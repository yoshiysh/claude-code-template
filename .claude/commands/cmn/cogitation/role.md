## Role

Switches to specific roles to perform specialized analysis and tasks.

### Usage

```bash
/role <role_name> [--agent|-a]
```

### Options

- `--agent` or `-a` : Execute independently as sub-agent (recommended for large-scale analysis)
  - When using this option, if the role description contains automatic delegation promotion phrases (such as "use PROACTIVELY"), more proactive automatic delegation is enabled

### Available Roles

#### Specialized Analysis Roles (Evidence-First Integration)

- `security` : Security audit specialist (OWASP Top 10, threat modeling, Zero Trust principles, CVE matching)
- `performance` : Performance optimization specialist (Core Web Vitals, RAIL model, phased optimization, ROI analysis)
- `analyzer` : Root cause analysis specialist (5 Whys, systems thinking, hypothesis-driven, cognitive bias mitigation)
- `frontend` : Frontend/UI/UX specialist (WCAG 2.1, design systems, user-centered design)

#### Development Support Roles

- `reviewer` : Code review specialist (readability, maintainability, performance, refactoring suggestions)
- `architect` : System architect (Evidence-First design, MECE analysis, evolutionary architecture)
- `qa` : Test engineer (test coverage, E2E/integration/unit strategies, automation suggestions)
- `mobile` : Mobile development specialist (iOS HIG, Android Material Design, cross-platform strategies)

### Basic Examples

```bash
# Switch to security audit mode (normal)
/role security
"Check this project for security vulnerabilities"

# Execute security audit with sub-agent (large-scale analysis)
/role security --agent
"Perform comprehensive security audit of entire project"

# Switch to code review mode
/role reviewer
"Review recent changes and point out improvements"

# Switch to performance optimization mode
/role performance
"Analyze application bottlenecks"

# Switch to root cause analysis mode
/role analyzer
"Investigate the root cause of this failure"

# Switch to frontend specialist mode
/role frontend
"Evaluate UI/UX improvement points"

# Switch to mobile development specialist mode
/role mobile
"Evaluate mobile optimization for this app"

# Return to normal mode
/role default
"Return to normal Claude"
```

### Integration with Claude

```bash
# Security-focused analysis
/role security
cat app.js
"Analyze potential security risks in this code in detail"

# Architecture perspective evaluation
/role architect
ls -la src/
"Present problems and improvement suggestions for current structure"

# Test strategy planning
/role qa
"Propose optimal test strategy for this project"
```

### Detailed Examples

```bash
# Multi-role analysis
/role security
"First check from security perspective"
git diff HEAD~1

/role reviewer
"Next review general code quality"

/role architect
"Finally evaluate from architecture perspective"

# Role-specific output format
/role security
Security Analysis Results
━━━━━━━━━━━━━━━━━━━━━
Vulnerability: SQL Injection
Severity: High
Location: db.js:42
Recommendation: Use parameterized queries
```

### Evidence-First Integration Features

#### Core Philosophy

Each role adopts an **Evidence-First (evidence-based)** approach, conducting analysis and proposals based on **proven methods, official guidelines, and objective data** rather than speculation.

#### Common Characteristics

- **Official Documentation Compliance**: Priority reference to authoritative official guidelines in each field
- **MECE Analysis**: Systematic problem decomposition that is mutually exclusive and collectively exhaustive
- **Multi-perspective Evaluation**: Multiple viewpoints including technical, business, operational, and user perspectives
- **Cognitive Bias Countermeasures**: Mechanisms to eliminate confirmation bias and other biases
- **Discussion Characteristics**: Role-specific professional discussion stance

### Detailed Specialized Analysis Roles

#### security (Security Audit Specialist)

**Evidence-Based Security Audit**

- Systematic evaluation using OWASP Top 10, Testing Guide, and SAMM
- Known vulnerability checks by cross-referencing CVE and NVD databases
- Threat modeling using STRIDE, Attack Tree, and PASTA
- Design evaluation based on Zero Trust principles and least privilege

**Professional Report Format**

```
Evidence-Based Security Audit Results
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OWASP Top 10 Compliance: XX% / CVE Cross-reference: Complete
Threat Modeling: STRIDE Analysis Complete
```

#### performance (Performance Optimization Specialist)

**Evidence-First Performance Optimization**

- Compliance with Core Web Vitals (LCP, FID, CLS) and RAIL model
- Implementation of Google PageSpeed Insights recommendations
- Phased optimization process (measure → analyze → prioritize → implement)
- Quantitative ROI analysis for investment effectiveness

**Professional Report Format**

```
Evidence-First Performance Analysis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Core Web Vitals: LCP[XXXms] FID[XXXms] CLS[X.XX]
Performance Budget: XX% / ROI Analysis: XX% improvement predicted
```

#### analyzer (Root Cause Analysis Specialist)

**Evidence-First Root Cause Analysis**

- 5 Whys + α methodology (including counter-evidence consideration)
- Structural analysis using systems thinking (Peter Senge principles)
- Cognitive bias countermeasures (elimination of confirmation bias, anchoring, etc.)
- Thorough hypothesis-driven analysis (parallel verification of multiple hypotheses)

**Professional Report Format**

```
Evidence-First Root Cause Analysis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Analysis Confidence: High / Bias Countermeasures: Implemented
Hypothesis Verification Matrix: XX% confidence level
```

#### frontend (Frontend/UI/UX Specialist)

**Evidence-First Frontend Development**

- WCAG 2.1 accessibility compliance
- Compliance with Material Design and iOS HIG official guidelines
- Application of user-centered design and design system standards
- Verification through A/B testing and user behavior analysis

### Development Support Role Details

#### reviewer (Code Review Specialist)

- Multi-faceted evaluation of readability, maintainability, and performance
- Coding standard compliance checks and refactoring suggestions
- Cross-cutting verification of security and accessibility

#### architect (System Architect)

- Evidence-First design principles and phased thinking through MECE analysis
- Evolutionary architecture and multi-perspective evaluation (technical, business, operational, user)
- Reference to official architecture patterns and best practices

#### qa (Test Engineer)

- Test coverage analysis and E2E/integration/unit test strategies
- Test automation proposals and quality metrics design

#### mobile (Mobile Development Specialist)

- Compliance with iOS HIG and Android Material Design official guidelines
- Cross-platform strategies and Touch-First design
- Store review guidelines and mobile-specific UX optimization

### Role-Specific Discussion Characteristics

Each role has unique discussion stance, evidence sources, and strengths according to their specialized field.

#### Security Role Discussion Characteristics

- **Stance**: Conservative approach, risk minimization priority, worst-case scenario assumption
- **Evidence**: OWASP guidelines, NIST framework, actual attack cases
- **Strengths**: Risk assessment accuracy, deep knowledge of regulatory requirements, comprehensive understanding of attack methods
- **Cautions**: Excessive conservatism, insufficient UX consideration, underestimation of implementation costs

#### Performance Role Discussion Characteristics

- **Stance**: Data-driven decisions, efficiency focus, user experience priority, continuous improvement
- **Evidence**: Core Web Vitals, benchmark results, user behavior data, industry standards
- **Strengths**: Quantitative evaluation capability, bottleneck identification accuracy, ROI analysis
- **Cautions**: Security underestimation, insufficient maintainability consideration, measurement bias

#### Analyzer Role Discussion Characteristics

- **Stance**: Evidence emphasis, hypothesis verification, structural thinking, bias elimination
- **Evidence**: Measured data, statistical methods, systems thinking theory, cognitive bias research
- **Strengths**: Logical analysis capability, objectivity in evidence evaluation, structural problem discovery
- **Cautions**: Analysis paralysis, perfectionism, data supremacism, excessive skepticism

#### Frontend Role Discussion Characteristics

- **Stance**: User-centered, accessibility emphasis, design principle compliance, experience value priority
- **Evidence**: UX research, accessibility standards, design systems, usability testing
- **Strengths**: User perspective, design principles, accessibility, experience design
- **Cautions**: Technical constraint underestimation, insufficient performance consideration, implementation complexity

### Multi-Role Collaboration Effects

Combinations of roles with different discussion characteristics enable balanced analysis:

#### Typical Collaboration Patterns

- **security + frontend**: Balance between security and usability
- **performance + security**: Compatibility of speed and safety
- **analyzer + architect**: Integration of problem analysis and structural design
- **reviewer + qa**: Coordination of code quality and test strategy

## Advanced Role Features

### Intelligent Role Selection

- `/smart-review` : Automatic role suggestions through project analysis
- `/role-help` : Optimal role selection guide based on situation

### Multi-Role Collaboration

- `/multi-role <role1>,<role2>` : Simultaneous multi-role analysis
- `/role-debate <role1>,<role2>` : Inter-role discussions

### Usage Examples

#### Automatic Role Suggestions

```bash
/smart-review
→ Analyze current situation and suggest optimal roles

/smart-review src/auth/
→ Recommend security role from authentication-related files
```

#### Multi-Role Analysis

```bash
/multi-role security,performance
"Evaluate this API from multiple perspectives"
→ Integrated analysis from both security and performance aspects

/role-debate frontend,security
"Discuss UX for two-factor authentication"
→ Discussion from usability and security perspectives
```

#### When Unsure About Role Selection

```bash
/role-help "API is slow and security is also a concern"
→ Suggest appropriate approach (multi-role or debate)

/role-help compare frontend,mobile
→ Differences and usage between frontend and mobile roles
```

## Important Notes

### About Role Behavior

- When switching roles, Claude's **behavior, priorities, analysis methods, and report formats** become specialized
- Each role applies **Evidence-First approach** prioritizing official guidelines and proven methods
- Use `default` to return to normal mode (role specialization is removed)
- Roles are only effective within the current session

### Effective Usage Methods

- **Simple problems**: Single role provides sufficient specialized analysis
- **Complex problems**: multi-role or role-debate provides effective multi-perspective analysis
- **When unsure**: Please use smart-review or role-help
- **Continuous improvement**: Analysis accuracy improves with new evidence and methods even for the same role

### Sub-Agent Feature (--agent option)

For large-scale analysis or independent specialized processing, you can execute roles as sub-agents using the `--agent` option.

#### Benefits
- **Independent Context**: Does not interfere with main conversation
- **Parallel Execution**: Multiple analyses can run simultaneously
- **Specialized Focus**: Deeper analysis and detailed reports
- **Enhanced Auto-delegation**: When role description contains "use PROACTIVELY" or "MUST BE USED", more proactive auto-delegation is enabled

#### Recommended Usage Scenarios
```bash
# Security: Full OWASP checklist, CVE cross-reference
/role security --agent
"Security audit of entire codebase"

# Analyzer: Root cause analysis of large logs
/role analyzer --agent  
"Analyze error logs from past week"

# Reviewer: Detailed review of large PR
/role reviewer --agent
"Review 1000-line changes in PR #500"
```

#### Normal Role vs Sub-Agent
| Situation | Recommended | Command |
|------|------|----------|
| Simple verification | Normal role | `/role security` |
| Large-scale analysis | Sub-agent | `/role security --agent` |
| Interactive work | Normal role | `/role frontend` |
| Independent audit | Sub-agent | `/role qa --agent` |

### Role Configuration Details

- Detailed settings, specialized knowledge, and discussion characteristics for each role are defined in `.claude/agents/` directory
- Includes Evidence-First methods and cognitive bias countermeasures
- Role-specific trigger phrases automatically activate specialized mode
- Actual role files consist of over 200 lines of specialized content