## Error Fix

Identifies root causes from error messages and proposes proven solutions.

### Usage

```bash
/fix-error [options]
```

### Options

- none : Standard error analysis
- `--deep` : Deep analysis mode (including dependencies and environmental factors)
- `--preventive` : Prevention-focused analysis
- `--quick` : Present only immediately applicable fixes

### Basic Examples

```bash
# Standard error analysis
npm run build 2>&1
/fix-error
"Analyze build error and provide fix methods"

# Deep analysis mode
python app.py 2>&1
/fix-error --deep
"Analyze error root causes including environmental factors"

# Quick fix focus
cargo test 2>&1
/fix-error --quick
"Provide immediately applicable fix methods"

# Prevention-focused
./app 2>&1 | tail -50
/fix-error --preventive
"Provide error fixes and future prevention strategies"
```

### Integration with Claude

```bash
# Error log analysis
cat error.log
/fix-error
"Identify error root causes and propose fix methods"

# Test failure resolution
npm test 2>&1
/fix-error --quick
"Analyze failed tests and provide immediately applicable fixes"

# Stack trace analysis
python script.py 2>&1
/fix-error --deep
"Identify problem areas from this stack trace and analyze including environmental factors"

# Resolve multiple errors together
grep -E "ERROR|WARN" app.log | tail -20
/fix-error
"Classify these errors and warnings by priority and propose solutions for each"
```

### Error Analysis Priority

#### 🔴 High Urgency (Immediate Response Required)

- **Application Shutdown**: Crashes, infinite loops, deadlocks
- **Data Loss Risk**: Database errors, file corruption
- **Security Vulnerabilities**: Authentication failures, permission errors, injection attacks
- **Production Environment Impact**: Deployment failures, service outages

#### 🟡 Medium Urgency (Early Response Recommended)

- **Performance Issues**: Memory leaks, delays, timeouts
- **Partial Dysfunction**: Specific function errors, UI bugs
- **Development Efficiency Decline**: Build errors, test failures

#### 🟢 Low Urgency (Planned Response)

- **Warning Messages**: Deprecation warnings, lint errors
- **Development Environment Only**: Local environment-specific issues
- **Future Risks**: Technical debt, maintainability issues

### Analysis Process

#### Phase 1: Error Information Collection

```bash
🔴 Must Execute:
- Complete error message acquisition
- Stack trace verification
- Condition identification (reproducibility)

🟡 Early Execution:
- Environment information collection (OS, versions, dependencies)
- Recent change history (git log, recent commits)
- Related log verification

🟢 Additional Execution:
- System resource status
- Network state
- External service status
```

#### Phase 2: Root Cause Analysis

1. **Surface Symptom Organization**
   - Accurate error message content
   - Occurrence timing and patterns
   - Impact scope identification

2. **Deep Cause Identification**
   - Application of 5 Whys analysis
   - Dependency tracking
   - Environment difference verification

3. **Hypothesis Verification**
   - Minimal reproduction code creation
   - Isolated test execution
   - Cause narrowing down

#### Phase 3: Solution Implementation

```bash
🔴 Immediate Response (Hotfix):
- Minimal fixes to suppress symptoms
- Temporary workaround application
- Emergency deployment preparation

🟡 Fundamental Solution:
- Essential fixes for root causes
- Test case additions
- Documentation updates

🟢 Prevention Implementation:
- Error handling enhancement
- Monitoring and alert setup
- CI/CD pipeline improvements
```

### Output Example

```
🚨 Error Analysis Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📍 Error Overview
├─ Type: [Compile/Runtime/Logic/Environment]
├─ Urgency: 🔴 High / 🟡 Medium / 🟢 Low
├─ Impact Scope: [Function/Component name]
└─ Reproducibility: [100% / Intermittent / Specific conditions]

🔍 Root Cause
├─ Direct Cause: [Specific cause]
├─ Background Factors: [Environment/Configuration/Dependencies]
└─ Trigger: [Occurrence conditions]

💡 Solutions
🔴 Immediate Response:
1. [Specific fix commands/code]
2. [Temporary workarounds]

🟡 Fundamental Solution:
1. [Essential fix methods]
2. [Required refactoring]

🟢 Prevention:
1. [Error handling improvements]
2. [Test additions]
3. [Monitoring setup]

📝 Verification Steps
1. [Post-fix verification methods]
2. [Test execution commands]
3. [Operation check items]
```

### Analysis Methods by Error Type

#### Compile/Build Errors

```bash
# TypeScript type errors
Must check (High):
- tsconfig.json configuration
- Type definition files (.d.ts) existence
- Import statement accuracy

# Rust lifetime errors
Must check (High):
- Ownership transfers
- Reference validity periods
- Mutability conflicts
```

#### Runtime Errors

```bash
# Null/Undefined references
Must check (High):
- Missing optional chaining
- Initialization timing
- Async process completion waiting

# Memory-related errors
Must check (High):
- Heap dump acquisition
- GC log analysis
- Circular reference detection
```

#### Dependency Errors

```bash
# Version conflicts
Must check (High):
- Lock file consistency
- Peer dependencies requirements
- Transitive dependencies

# Module resolution errors
Must check (High):
- NODE_PATH configuration
- Path alias configuration
- Symbolic links
```

### Important Notes

- **Absolutely Prohibited**: Judging by partial error messages only, applying Stack Overflow solutions without verification
- **Exception Conditions**: Temporary workarounds are allowed only under these 3 conditions:
  1. Production environment emergency response (root solution required within 24 hours)
  2. External service failures (alternative measures while waiting for recovery)
  3. Known framework bugs (waiting for fix release)
- **Recommendations**: Prioritize root cause identification and avoid superficial fixes

### Best Practices

1. **Complete Information Collection**: Check error messages from start to finish
2. **Reproducibility Verification**: Prioritize creating minimal reproduction code
3. **Incremental Approach**: Start with small fixes and verify
4. **Documentation**: Record solution process for knowledge sharing

#### Common Pitfalls

- **Symptom Treatment**: Superficial fixes that miss root causes
- **Over-generalization**: Broadly applying specific case solutions
- **Skipping Verification**: Not checking side effects after fixes
- **Knowledge Silos**: Not documenting solution methods

### Related Commands

- `/design-patterns` : Analyze code structure issues and suggest patterns
- `/tech-debt` : Analyze error root causes from technical debt perspective
- `/analyzer` : For deeper root cause analysis when needed
