# PLAN Phase

## Purpose
Determine implementation strategy, decompose tasks, create file change plan, and establish testing strategy.

## Required Input Files
- `docs/investigate/investigate_{TIMESTAMP}.md` - Investigation results

## Important Notes
- Read all related code.
- Always work thoughtfully with ultrathink in all processes.

# User Input

# $ARGUMENTS

## Testing Strategy
- **Endpoint Testing**: Required (FastAPI: TestClient / httpx)
- **Integration Testing**: Implement as needed
- **E2E Testing**: Implement when UI changes are involved
- **Docker Environment Execution**: All tests run in Docker environment

## TODOs to Include in Task
1. Understand user instructions
2. Read the latest `docs/investigate/investigate_{TIMESTAMP}.md` and confirm investigation results
3. Determine implementation strategy based on investigation results
4. Decompose detailed implementation tasks and set priorities
5. Create file change plan (new creation, modification, deletion)
6. Establish test strategy (unit, integration, E2E)
7. Consider risk analysis and countermeasures
8. Document implementation plan and save to `docs/plan/plan_{TIMESTAMP}.md`
9. Check `ai-rules/ISSUE_GUIDELINES.md` and create GitHub Issue if necessary
10. Execute `afplay /System/Library/Sounds/Sosumi.aiff` to notify user of plan completion and file saving
11. Output plan file name and created Issue number (if any) to console

## GitHub Issue Creation (As Needed)
Follow `ai-rules/ISSUE_GUIDELINES.md` and create Issue including:
- Title
- Overview
- Acceptance criteria
- Task list
- Priority and labels

## Output Files
- `docs/plan/plan_{TIMESTAMP}.md`

## Final Output Format
- Must output in the following two formats

### When Plan Formulation Complete
status: SUCCESS
next: IMPLEMENT
details: "Implementation plan formulation complete. Details recorded in plan_{TIMESTAMP}.md. Moving to implementation phase."

### When Investigation Insufficient
status: NEED_MORE_INFO
next: INVESTIGATE
details: "Insufficient information. Details recorded in plan_{TIMESTAMP}.md. Additional investigation required."