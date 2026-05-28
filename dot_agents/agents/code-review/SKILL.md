---
name: code-review
description: Conducts comprehensive code reviews on a specified Git branch by comparing it against master. Use when you need to review code changes, identify bugs, suggest improvements, verify architectural decisions, and ensure code quality before merging a feature branch.
---

# Code Review

## Setup

No additional packages are required. Ensure you are in a Git repository with the target branch checked out and that `master` (or `main`) is up to date.

```bash
cd /path/to/repository
git fetch origin
git checkout <branch-to-review>
```

## Usage

Invoke the skill when asked to review a branch:

```bash
# Review the current branch against master
./scripts/review.sh --branch $(git branch --show-current) --base master

# Review a specific branch
./scripts/review.sh --branch feature/xyz --base master
```

Use relative paths from the skill directory. See [the reference guide](references/REFERENCE.md) for details on output formats and filters.

## Extracting Readable Diffs Against Master

To get a clean, readable diff of the branch against master, use the commands below. **Prefer the three-dot syntax** (`master...HEAD`) — it shows only the changes introduced by the branch and ignores anything that landed on master after the branch was created.

### High-level summary
```bash
# Files changed with insertions/deletions stats
git diff master...HEAD --stat

# Commit history on this branch that is not in master
git log master..HEAD --oneline
```

### Full diff for review
```bash
# Full diff, ignoring whitespace-only changes (recommended default)
git diff master...HEAD --ignore-space-change

# Save to a file for easier review / piping to LLM
git diff master...HEAD --ignore-space-change > /tmp/branch-review.diff

# Colorized, cleaner paths (no a/ b/ prefix) for terminal reading
git diff master...HEAD --color --no-prefix
```

### Per-file or filtered review
```bash
# Review a specific file
git diff master...HEAD -- path/to/file.ext

# Exclude generated, vendored, or noisy files
git diff master...HEAD -- . \
  ':!vendor/' \
  ':!node_modules/' \
  ':!*.min.js' \
  ':!package-lock.json' \
  ':!yarn.lock'

# Only Added/Modified files (skip deletes and renames when noisy)
git diff master...HEAD --diff-filter=AM
```

### Useful flags reference
| Flag | Purpose |
|------|---------|
| `--stat` | High-level summary of touched files |
| `--ignore-space-change` / `-w` | Ignore whitespace-only changes |
| `--color` | Colorized output for terminals |
| `--no-prefix` | Cleaner paths (drops `a/` and `b/`) |
| `--diff-filter=AM` | Only Added/Modified files |
| `-U<n>` | Show `n` lines of context (e.g. `-U0` for a quick scan) |
| `--word-diff` | Highlight word-level changes inside a line |

## Review Process

Follow these steps when conducting a review:

1. **Orient yourself** — read the branch summary, commit messages, and the linked issue/PR description to understand the intent *before* looking at code.
2. **Get the big picture** — run `git diff master...HEAD --stat` to gauge scope.
3. **Walk through the diff** — review file-by-file, starting with core logic, then tests, then configs and generated files.
4. **Apply the Code Review Manifest** (below) as a checklist for every non-trivial change.
5. **Classify each comment** — mark comments as `blocking`, `suggestion`, `nit`, or `question` so the author knows what must be acted on.
6. **Summarize** — provide a short verdict (`approve` / `request changes` / `discuss`) with the top 3 findings.

---

## Code Review Manifest

Use this checklist during every review. It defines both the quality bar and the tone of feedback.

### Before diving in
- I understand what problem this code solves and what constraints already exist.
- I have read the discussion in the issue and in the MR/PR itself — so I don't re-ask already-resolved questions.

### Correctness and business logic
- The code does exactly what was required (no more, no less).
- Edge cases (empty, zero, max, duplicates) are explicitly visible and handled.
- Existing functionality appears not to break.
- If I see a scenario not covered by tests, I flag it (even if it isn't a bug).

### Simplicity and clarity
- The code tells a story: it reads sequentially, without unnecessary jumps.
- Entity names are understandable without extra context.
- Complex or non-obvious parts are explained directly in the code — the *why*, not the *how*.
- There is no logic "buried" in an unexpected place.

### Reliability and observability
- When something goes wrong, the error is not lost or hidden.
- A failure nearby will not cascade into this code.
- Logs or metrics make it easy to understand what happened and where.

### Architecture and growth
- This change does not create a future trap (tight coupling, unclear contracts).
- The layer or module does one thing, and that is easy to explain.
- If I suspect this may become painful under load or under future changes, I share that concern.

### Sharing understanding (context as the value of review)
- If I know why a similar place was done differently, I explain it (this is faster than fixing it later).
- If I see that the decision affects a neighboring system or team, I mention it.
- If the author chose a non-obvious path, I ask "why this way?" without accusation — often the answer enriches everyone.
- If a comment is about taste or convention rather than an error, I mark it explicitly and reference the team's guideline.
- If I learned something new reading this code, I note it (review is two-way learning).

### Tests as living documentation
- Tests verify behavior, not implementation.
- A failing test today saves us tomorrow; if I see a missed case, I write about it.
- If tests are missing where they are clearly called for, I gently ask the reason.

### Security and data
- What should not leak out, does not leak — not into logs, not into API responses.
- Access and permissions are checked before actions are executed.
- User data is not processed "on a best-effort basis."
