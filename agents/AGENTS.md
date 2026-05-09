# AI Agents Configuration

This folder contains shared AI tooling configurations used across all projects.

## Structure

```
agents/
├── rules/        # Global rules for AI agents
├── skills/       # Reusable skills and capabilities
├── commands/     # Custom commands for AI agents
└── AGENTS.md     # This file
```

## Usage

Files in this directory are symlinked to `~/.claude/` and `~/.agents/` for global access by AI tools.

- Add global rules in `rules/` that apply to all projects
- Add reusable skills in `skills/` for common tasks
- Add custom commands in `commands/` for AI agent workflows

## Rules

Rules define how AI agents should behave globally. These are applied to all projects.

## Skills

Skills are reusable capabilities that can be invoked by AI agents across different contexts.

## Commands

Commands are custom operations that AI agents can execute as part of their workflow.