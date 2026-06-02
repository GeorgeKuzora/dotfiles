---
name: mise-task-runner
description: Use `mise` as the centralized task runner for all project commands (linting, testing, formatting, etc.) instead of executing raw CLI tools directly, if mise file in the project. Ensures consistent tool versions, environment variables, and project-specific workflows.

---
# mise Task Runner Skill

## Purpose
Use `mise` as the centralized task runner for all project commands (linting, testing, formatting, etc.) instead of executing raw CLI tools directly. Ensures consistent tool versions, environment variables, and project-specific workflows.

## When to Apply
- The project root contains `mise.toml` or `mise.local.toml`
- You need to run development commands like `lint`, `test`, `format`, `check`, or `build`
- You want to guarantee commands use the exact tool versions defined by the project

## Agent Workflow
1. **Scan** project root for `mise.toml` or `mise.local.toml`
2. **Discover** available tasks: `mise tasks`
3. **Execute** via `mise run <task-name>` (never raw `pytest`, `ruff`, `flake8`, etc.)
4. **Fallback**: If a task is missing, propose adding it to `mise.toml` (shared) or `mise.local.toml` (local)

## Core Rules
✅ **ALWAYS** prefer `mise run <task>` over direct tool invocations
✅ **ALWAYS** verify task existence with `mise tasks` before running
✅ **RESPECT** `mise.local.toml` for personal/debug overrides; do not commit it unless explicitly requested
✅ **PASS** extra flags directly: `mise run test -- -v -k auth`
❌ **NEVER** hardcode raw lint/test commands when mise tasks are available
❌ **NEVER** modify `mise.toml` without explicit user approval (use `mise.local.toml` for local experiments)

## Task Discovery & Execution
```bash
# List all available tasks with descriptions
mise tasks

# Run a single task
mise run lint

# Run multiple tasks sequentially
mise run format lint test

# Pass additional arguments to the underlying command
mise run test -- -x -v
