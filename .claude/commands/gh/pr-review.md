# PR Review

Systematic Pull Request review to ensure code quality and architectural integrity.

## Usage

```bash
/pr-review [options]
```

## Options

- `--pr <number>` : Specify PR number (auto-detect current branch if omitted)
- `--focus <aspect>` : Focus on specific aspect (security, performance, architecture, style)
- `--severity <level>` : Filter by severity level (critical, high, medium, low)
- `--format <format>` : Output format (standard, checklist, summary)

## Basic Examples

```bash
# Quantitative code quality evaluation
find . -name "*.js" -exec wc -l {} + | sort -rn | head -5
"Please evaluate code complexity, function size, and duplication rate and point out improvements"

# Security vulnerability check
grep -r "password\|secret\|token" . --include="*.js" | head -10
"Please check risks of sensitive information leakage, hardcoding, and authentication bypass"

# Architectural violation detection
grep -r "import.*from.*\.\./\.\." . --include="*.js"
"Please evaluate layer violations, circular dependencies, and coupling issues"
```

## Comment Classification System

```
🔴 critical.must: Critical issues
├─ Security vulnerabilities
├─ Data integrity issues
└─ System failure risks

🟡 high.imo: High priority improvements
├─ Function failure risks
├─ Performance issues
└─ Significant maintainability degradation

🟢 medium.imo: Medium priority improvements
├─ Readability enhancements
├─ Code structure improvements
└─ Test quality improvements

🟢 low.nits: Minor issues
├─ Style unification
├─ Typo fixes
└─ Comment additions

🔵 info.q: Questions & information sharing
├─ Implementation intent confirmation
├─ Design decision background
└─ Best practice sharing
```

## Review Perspectives

### 1. Code Correctness

- **Logic Errors**: Boundary values, null checks, exception handling
- **Data Integrity**: Type safety, validation
- **Error Handling**: Comprehensiveness, appropriate processing

### 2. Security

- **Authentication & Authorization**: Proper checks, permission management
- **Input Validation**: SQL injection, XSS prevention
- **Sensitive Information**: Logging prohibition, encryption

### 3. Performance

- **Algorithms**: Time complexity, memory efficiency
- **Database**: N+1 queries, index optimization
- **Resources**: Memory leaks, cache utilization

### 4. Architecture

- **Layer Separation**: Dependency direction, proper separation
- **Coupling**: Loose coupling, interface utilization
- **SOLID Principles**: Single responsibility, open-closed, dependency inversion

## Review Flow

1. **Pre-check**: PR information, change diff, related Issues
2. **Systematic Check**: Security → Correctness → Performance → Architecture
3. **Constructive Feedback**: Specific improvement suggestions and code examples
4. **Follow-up**: Fix verification, CI status, final approval

## Effective Comment Examples

**Security Issue**

```markdown
**critical.must.** Password is stored in plain text

```javascript
// Fix suggestion
const bcrypt = require('bcrypt');
const hashedPassword = await bcrypt.hash(password, 12);
```

Hashing is required to prevent security risks.
```

**Performance Improvement**

```markdown
**high.imo.** N+1 query problem occurs

```javascript
// Improvement: Eager Loading
const users = await User.findAll({ include: [Post] });
```

This can significantly reduce the number of queries.
```

**Architecture Violation**

```markdown
**high.must.** Layer violation detected

Domain layer directly depends on infrastructure layer.
Please introduce interfaces following the dependency inversion principle.
```

## Important Notes

- **Constructive Tone**: Collaborative communication, not aggressive
- **Specific Suggestions**: Provide solutions, not just problem identification
- **Prioritization**: Respond in order Critical → High → Medium → Low
- **Continuous Improvement**: Create knowledge base from review results
