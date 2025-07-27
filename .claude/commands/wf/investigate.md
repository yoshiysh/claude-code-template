# INVESTIGATE Phase

# User Input

# $ARGUMENTS

## Purpose
Gather background, requirements, and constraints to determine implementation direction.

## Important Notes

- Read all related code.
- Always work thoughtfully with ultrathink in all processes.
- Do not use emojis in file descriptions.

## TODOs to Include in Task

1. Clarify investigation targets and scope
2. Check current branch status and create `feature/<topic>` branch
3. Collect and systematically analyze related files, logs, and documents
4. Investigate technical constraints and possibilities
5. Confirm consistency with existing systems
6. Identify root cause of problems and solution approaches
7. Document investigation results and save to `docs/investigate/investigate_{TIMESTAMP}.md`
8. Present recommendations for next phase (Plan)
9. Execute `afplay /System/Library/Sounds/Sosumi.aiff` to notify user of investigation completion and file saving
10. Output created branch name and investigation result file name to console

## Branch Creation Rules

- Branch naming: `feature/<topic>` or `fix/<issue>`
- Always create from `main` branch
- Continue all work on that branch after creation

## Output Files

- `docs/investigate/investigate_{TIMESTAMP}.md`

## Final Output Format

- Must output in the following two formats

### When Investigation Complete (Implementation Recommended)

status: COMPLETED
next: PLAN
details: "Investigation complete. feature/<topic> branch created. Details described in docs/investigate/investigate_{TIMESTAMP}.md. Implementation strategy formulation recommended."

### When Investigation Complete (Implementation Not Required)

status: COMPLETED
next: NONE
details: "Investigation complete. Details described in docs/investigate/investigate_{TIMESTAMP}.md. Can be handled with existing functionality. No implementation or changes required."
