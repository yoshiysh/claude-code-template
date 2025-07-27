# IMPLEMENT Phase

# User Input

# $ARGUMENTS

## Purpose
Implement tasks step by step based on plan.md. Continuously update the Draft PR.

## Important Notes

- Always work thoughtfully with ultrathink
- Emojis should not be used in code.

## Required Input Files

- `docs/plan/plan_{TIMESTAMP}.md` - Implementation plan
- GitHub Issues (if any)
- Related existing files and code

## TODOs to Include in Task

1. Understand user instructions and notify implementation start in console
2. Read the latest `docs/plan/plan_{TIMESTAMP}.md` file and confirm implementation plan
3. Check current branch and confirm being on the appropriate branch
4. Execute implementation step by step according to the plan
5. Commit and push following `@COMMIT_AND_PR_GUIDELINES.md`
6. Create or update Draft PR (create on first implementation, update on continuation)
7. Record implementation details in `docs/implement/implement_{TIMESTAMP}.md`
8. Execute `afplay /System/Library/Sounds/Sosumi.aiff` to notify user of implementation completion and file saving
9. Output related plan files, implementation detail files, and PR number to console

## Branch and Commit Rules

- Branch naming: Follow `@COMMIT_AND_PR_GUIDELINES.md`
- Commit messages: Follow same guidelines
- Small commits: Properly split by task units
- Draft PR: Create on first implementation, update on continuation

## Output Files

- `docs/implement/implement_{TIMESTAMP}.md` - Implementation detail record

## Final Output Format

- Must output in the following three formats

### When Implementation Complete

status: SUCCESS
next: TEST
details: "Implementation complete. Details recorded in implement_{TIMESTAMP}.md. Moving to test phase."

### When Additional Work Needed

status: NEED_MORE
next: IMPLEMENT
details: "Dependency implementation required. Details recorded in implement_{TIMESTAMP}.md. Continuing task."

### When Plan Review Needed

status: NEED_REPLAN
next: PLAN
details: "Design change required. Details recorded in implement_{TIMESTAMP}.md. Returning to plan phase."
