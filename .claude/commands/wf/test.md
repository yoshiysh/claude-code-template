# TEST Phase

# User Input

# $ARGUMENTS

## Purpose
Verify **endpoint functionality** of added/modified code by execution in Docker environment.

## Test Execution Policy
- **Docker Environment Execution Required**: All tests must run inside Docker containers
- **Environment Consistency**: Minimize differences from production environment
- **Reproducibility Assurance**: Eliminate environment-dependent issues

## Required Input Files
- `docs/plan/plan_{TIMESTAMP}.md` - Confirm test requirements
- `docs/implement/implement_{TIMESTAMP}.md` - Implementation details
- Implemented code (current branch)

## Test Types
- **Endpoint Testing (Required)**
  - Execution in Docker Compose environment
  - FastAPI: `TestClient` / `httpx`
  - Each endpoint status_code == 200
  - Response JSON matches expected schema
- **Integration Testing (Optional)**
  - Database integration testing inside Docker containers
  - External API integration testing inside Docker containers
- **E2E Testing (Optional)**
  - Browser testing using Playwright in Docker environment

## TODOs to Include in Task
1. Understand user instructions and notify test start in console
2. Confirm test requirements from latest `docs/plan/plan_{TIMESTAMP}.md`
3. Confirm implementation content from latest `docs/implement/implement_{TIMESTAMP}.md`
4. Notify user of Docker Compose environment construction and startup
5. Create test cases for added/modified endpoints
6. Execute endpoint tests inside Docker environment
7. Execute integration and E2E tests inside Docker environment as needed
8. Notify user of test execution status in real-time
9. Report details to user if any tests fail
10. Comprehensively evaluate and document test results
11. Notify user of Docker environment shutdown and cleanup
12. Save test results in `docs/test/test_{TIMESTAMP}.md`
13. Notify user of test completion and file saving
14. Output next phase transition decision to console

## Output Files
- `docs/test/test_{TIMESTAMP}.md`

## Final Output Format
- Must output in the following three formats

### When Test Successful
status: SUCCESS
next: DONE
details: "All tests passed. Details recorded in test_{TIMESTAMP}.md."

### When Test Failed - Fix Required
status: FAILURE
next: IMPLEMENT
details: "Failed: /users GET returned 500 error. Check test_{TIMESTAMP}.md for details. Fix required."

### When Critical Issue Discovered
status: CRITICAL_FAILURE
next: INVESTIGATE
details: "Critical issue discovered. test_{TIMESTAMP}.md. Root cause re-investigation required."