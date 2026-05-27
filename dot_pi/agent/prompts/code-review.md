---
description: Conduct a comprehensive code review on a specified Git branch against master, guided by task context.
argument-hint: "<branch-name> <task-context-and-goals>"
---
Act as an expert code reviewer and apply the **Code Review Manifest** from the `code-review` skill.

**Target Branch:** `$1`
**Base Branch:** `master`
**Task Context & Business Goal:**
$@

**Execution Steps:**
1. **Extract the Diff:** Run `git diff master...$1 --stat` to understand the scope, then run `git diff master...$1 --ignore-space-change` to extract the full, readable diff. (If `master` doesn't exist, fallback to `main`).
2. **Contextualize:** Analyze the code changes strictly through the lens of the provided **Task Context**. Does the code solve the specific problem described without over-engineering or missing requirements?
3. **Evaluate against the Manifest:** Review the diff file-by-file, checking for:
   - **Correctness:** Edge cases, business logic, exact requirements.
   - **Simplicity:** Readability, naming, clear "why" comments, no buried logic.
   - **Reliability:** Error handling, observability, prevention of cascade failures.
   - **Architecture:** Coupling, future traps, single responsibility.
   - **Security:** Data leaks, authorization checks, safe data processing.
4. **Format Feedback:** Output your findings clearly. Classify each comment as `[BLOCKING]`, `[SUGGESTION]`, `[NIT]`, or `[QUESTION]`.
5. **Summarize:** Conclude with a brief summary of the changes and a clear final verdict: `APPROVE`, `REQUEST CHANGES`, or `DISCUSS`.
