## Plan

Launches pre-implementation planning mode to develop detailed implementation strategies. Supports efficient development by creating structured plans before code implementation.

### Usage

```bash
# Request Plan Mode from Claude
"Create implementation plan for [implementation content]"
```

### Basic Examples

```bash
# New feature implementation plan
"Create implementation plan for user authentication feature"

# System design plan
"Create implementation plan for microservice decomposition"

# Refactoring plan
"Create refactoring plan for legacy code"
```

### Integration with Claude

```bash
# Complex feature implementation
"Create implementation plan for chat feature. Include WebSocket, real-time notifications, and history management"

# Database design
"Create database design plan for e-commerce site. Include product, order, and user management"

# API design
"Create implementation plan for GraphQL API. Include authentication, caching, and rate limiting"

# Infrastructure design
"Create implementation plan for Docker containerization. Include development environment, production environment, and CI/CD"
```

### Plan Mode Features

**Automatic Activation**

- Plan Mode automatically launches when implementation tasks are detected
- Can be explicitly activated with keywords like "create implementation plan"

**Structured Specifications**

- Requirements definition (user stories and acceptance criteria)
- Design documentation (architecture, data design, UI design)
- Implementation plan (task breakdown, progress tracking, quality assurance)
- Risk analysis and countermeasures

**Approval Process**

- Present plan with `exit_plan_mode` tool
- **Important**: Regardless of tool return value, always wait for explicit user approval
- Implementation start without approval is prohibited
- Plan modification and adjustment possible
- Start task management with TodoWrite only after approval

### Detailed Examples

```bash
# Complex system implementation
"Create implementation plan for online payment system. Include Stripe integration, security, and error handling"

# Frontend implementation
"Create implementation plan for React dashboard. Include state management, component design, and testing"

# Backend implementation
"Create implementation plan for RESTful API. Include authentication, validation, and logging"

# DevOps implementation
"Create implementation plan for CI/CD pipeline. Include test automation, deployment, and monitoring"
```

### Three-Phase Workflow

#### Phase 1: Requirements

- **User Stories**: Clarify function purpose and value
- **Acceptance Criteria**: Define completion conditions and quality standards
- **Constraints & Prerequisites**: Organize technical and time constraints
- **Prioritization**: Classify Must-have/Nice-to-have

#### Phase 2: Design

- **Architecture Design**: System configuration and technology selection
- **Data Design**: Schema, API specifications, data flow
- **UI/UX Design**: Screen configuration and operation flow
- **Risk Analysis**: Potential problems and countermeasures

#### Phase 3: Implementation

- **Task Breakdown**: Subdivision into implementable units
- **Progress Tracking**: State management with TodoWrite
- **Quality Assurance**: Test strategy and validation methods
- **Approval Process**: Plan presentation with exit_plan_mode and explicit approval waiting

### Important Notes

**Scope of Application**

- Plan Mode is optimal for complex implementation tasks
- For simple fixes or small changes, use regular implementation format
- Recommended for 3+ step work or new feature development

**Technical Limitations**

- Do not trust `exit_plan_mode` tool return values
- Approval process judges by user's explicit intent expression
- Different functionality from CLI plan mode

**Execution Notes**

- Implementation start before approval is strictly prohibited
- Must wait for user response after plan presentation
- Present alternative methods in case of errors

### Usage Example

```bash
# Usage example
"Create implementation plan for user management system"

# Expected behavior:
# 1. Plan Mode automatically launches
# 2. Requirements analysis and technology selection
# 3. Structure implementation steps
# 4. Present plan with exit_plan_mode
# 5. Start implementation after approval
```
