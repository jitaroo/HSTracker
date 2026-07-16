# Cross-Mac Git workflow

These rules are mandatory for every coding-agent session in this repository, in
addition to any project-specific build, testing, architecture, or release rules.

## Before editing

1. Run `git status -sb` and identify the current branch and upstream.
2. Preserve every pre-existing user change. Never discard, overwrite, stash, or
   stage it without understanding its ownership.
3. If the working tree is clean and the branch has an upstream, run
   `git fetch --prune` followed by `git pull --rebase`.
4. If the tree is dirty, diverged, conflicted, or lacks an upstream, explain the
   state and resolve it safely before editing. Never guess or use a destructive
   reset.

## After making changes

1. Run the relevant project tests or validation checks.
2. Review `git diff` and `git status --short` for secrets, generated output,
   dependency caches, large artifacts, and unrelated work.
3. Stage only intended paths, commit with a concise descriptive message, and
   push the current branch to its configured upstream.
4. Verify `git status -sb` shows the local branch aligned with its upstream
   before claiming completion.

Do not leave agent-authored work unpushed unless a genuine blocker exists. If
testing, rebasing, committing, or pushing fails, preserve the work and report
the exact blocker prominently.

## Safety

- Never commit `.env` files, passwords, tokens, API keys, certificates,
  provisioning profiles, signing material, private source data, build products,
  or dependency caches.
- Never force-push, destructively reset, auto-resolve ambiguous conflicts, or
  create unattended automatic commits.
- Create new GitHub repositories as private unless the user explicitly chooses
  public visibility.
- For unfinished work on a default branch, use a focused working branch and
  push it rather than publishing a partial default-branch commit.

