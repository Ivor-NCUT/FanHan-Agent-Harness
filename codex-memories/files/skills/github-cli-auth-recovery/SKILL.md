---
name: github-cli-auth-recovery
description: Recover `gh` login on this macOS machine when GitHub CLI shows invalid `GH_TOKEN`/keyring auth, `EOF`, or `SSL_ERROR_SYSCALL`, especially before GitHub repo creation or push work.
argument-hint: "[github-host]"
disable-model-invocation: true
user-invocable: true
allowed-tools:
  - Read
  - Grep
  - Bash
---

# GitHub CLI Auth Recovery

Use this skill when the task involves configuring `gh`, fixing broken GitHub CLI auth, or preparing this machine for GitHub repo/push work and `gh auth status` is failing.

Default host: `github.com` unless the user gives a different host in `$ARGUMENTS`.

Do not use this skill for repo-specific code fixes when GitHub auth is already healthy.

## Inputs / context to gather first

1. Target host: `$ARGUMENTS` or `github.com`.
2. Whether the user wants interactive browser/device login or has already provided a token.
3. Current env overrides:
   - `GH_TOKEN`
   - `GITHUB_TOKEN`
   - `ALL_PROXY`
   - `all_proxy`
   - `HTTPS_PROXY`
   - `HTTP_PROXY`
4. Whether the task only needs `gh` login or also needs later `git push` / `gh repo create`.

## Procedure

1. Check the installed CLI and current auth state first.
   - Run `gh --version`.
   - Run `gh auth status -h <host>`.
   - Treat env-token failures and keyring failures as separate signals if both appear.

2. Clear stale env overrides before retrying auth.
   - Start retries from a clean shell state with:
     - `unset GH_TOKEN GITHUB_TOKEN ALL_PROXY all_proxy HTTPS_PROXY HTTP_PROXY`
   - Re-run `gh auth status -h <host>` to see what remains after env overrides are removed.

3. Remove stale stored auth if keyring state is broken.
   - If `gh auth status` reports an invalid keyring account, run:
     - `gh auth logout -h <host> -u <account>`
   - Inspect `~/.config/gh/hosts.yml` to confirm whether stored host credentials were actually cleared.

4. Verify GitHub reachability before attempting login again.
   - Test direct API reachability first.
   - If direct HTTPS fails, test the local SOCKS proxy path:
     - `curl -I --proxy socks5h://127.0.0.1:7890 https://api.github.com`
   - Treat `HTTP/2 403` from `api.github.com` as “network path exists but auth/rate-limit differs”, not as a transport failure.
   - If both direct and proxy checks fail at TLS/EOF level, stop login retries and report the network problem first.

5. Choose the login mode by environment behavior.
   - If browser/device login is requested and the network path is healthy, try:
     - `gh auth login -h <host> -p https -w`
   - If browser/device login hits `Post "https://github.com/login/device/code": EOF` or timeout, pivot away from device flow.
   - If the user provides a token, prefer:
     - `gh auth login -h <host> --with-token`
   - Never store or echo the token in memory artifacts.

6. Verify the token and stored state separately.
   - After token login, run `gh auth status -h <host>`.
   - If status still fails, check whether env vars are overriding the stored login.
   - Inspect `~/.config/gh/hosts.yml` again to distinguish “login never stored” from “stored login exists but env override broke status”.

7. If the goal includes later repo/push work, validate the right layer before moving on.
   - For `gh repo create` / `gh repo view`, verify plain `gh` API access first.
   - For `git push`, validate the transport path separately; `gh` auth success does not guarantee stable HTTPS push.

## Efficiency plan

1. Separate auth state from network state early: `gh auth status` first, proxy/API reachability second.
2. Clear env overrides once at the start of retries; do not keep re-testing through mixed env states.
3. Use `~/.config/gh/hosts.yml` as a cheap confirmation step before repeating login attempts.
4. Stop retrying browser/device flow after one confirmed `EOF`/timeout in this environment; pivot to token login or report transport instability.
5. Stop once you can clearly classify the blocker as one of:
   - stale env token
   - stale keyring login
   - invalid new token
   - proxy/TLS transport failure

## Pitfalls and fixes

- Symptom: `gh auth status` shows `Failed to log in ... using token (GH_TOKEN)`
  - Likely cause: stale `GH_TOKEN` or `GITHUB_TOKEN` in the shell overrides the local login state.
  - Fix: `unset GH_TOKEN GITHUB_TOKEN` and re-check status before doing anything else.

- Symptom: `gh auth status` also shows `Failed to log in ... account <user> (keyring)`
  - Likely cause: stale keyring entry.
  - Fix: `gh auth logout -h <host> -u <user>` and confirm `~/.config/gh/hosts.yml` was cleared.

- Symptom: `gh auth login -w` fails with `Post "https://github.com/login/device/code": EOF`
  - Likely cause: unstable proxy/TLS path to GitHub device-code endpoint.
  - Fix: test `api.github.com` reachability through the chosen proxy first; if unstable, stop using device flow and pivot to token login.

- Symptom: `curl` through `socks5h://127.0.0.1:7890` reaches GitHub but `gh auth login --with-token` still fails
  - Likely cause: the provided token is invalid or lacks the needed scopes.
  - Fix: ask for a fresh token rather than repeating transport experiments.

- Symptom: `gh auth status` remains confusing after several retries
  - Likely cause: env overrides, keyring state, and proxy state were changed in different attempts.
  - Fix: return to a clean shell state, clear env vars, inspect `hosts.yml`, then run one controlled retry.

## Verification checklist

- `gh --version` confirms the CLI exists.
- `gh auth status -h <host>` has been checked before and after clearing env overrides.
- If logout was needed, the stale keyring account was removed and `~/.config/gh/hosts.yml` was checked.
- Direct or proxied `api.github.com` reachability was verified before retrying login.
- The final blocker is explicitly classified as auth-token, keyring, or transport related.
- Any supplied token is treated as secret and not written into memory files.
