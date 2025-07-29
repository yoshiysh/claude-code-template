## Role Help

Selection guide and help system for when you're unsure which role to use.

### Usage

```bash
/role-help                      # General role selection guide
/role-help <situation/problem>  # Recommended role for specific situation
/role-help compare <role1>,<role2> # Role comparison
```

### Basic Examples

```bash
# General guidance
/role-help
→ List available roles and their characteristics

# Situation-specific recommendations
/role-help "Concerned about API security"
→ Recommend security role and usage

# Role comparison
/role-help compare frontend,mobile
→ Differences and usage between frontend and mobile
```

### Situation-Based Role Selection Guide

### 🔒 Security-Related

```
Use security role when:
✅ Implementing login and authentication features
✅ Checking API security vulnerabilities
✅ Data encryption and privacy protection
✅ Security compliance verification
✅ Penetration testing and security assessment

Usage: /role security
```

### 🏗️ Architecture & Design

```
Use architect role when:
✅ System-wide design evaluation
✅ Microservices vs monolith decisions
✅ Database design and technology selection
✅ Scalability and extensibility considerations
✅ Technical debt evaluation and improvement planning

Usage: /role architect
```

### ⚡ Performance Issues

```
Use performance role when:
✅ Application is slow
✅ Database query optimization
✅ Web page loading speed improvement
✅ Memory and CPU usage optimization
✅ Scaling and load handling

Usage: /role performance
```

### 🔍 Problem Investigation

```
Use analyzer role when:
✅ Root cause analysis of bugs and errors
✅ System failure cause investigation
✅ Structural analysis of complex problems
✅ Data analysis and statistical investigation
✅ Understanding why problems occurred

Usage: /role analyzer
```

### 🎨 Frontend & UI/UX

```
Use frontend role when:
✅ User interface improvements
✅ Accessibility compliance
✅ Responsive design
✅ Usability and ease-of-use improvements
✅ General web frontend technologies

Usage: /role frontend
```

### 📱 Mobile App Development

```
Use mobile role when:
✅ iOS and Android app optimization
✅ Mobile-specific UX design
✅ Touch interface optimization
✅ Offline support and sync functionality
✅ App Store and Google Play compliance

Usage: /role mobile
```

### 👀 Code Review & Quality

```
Use reviewer role when:
✅ Code quality checks
✅ Readability and maintainability evaluation
✅ Coding standards verification
✅ Refactoring suggestions
✅ PR and commit reviews

Usage: /role reviewer
```

### 🧪 Testing & Quality Assurance

```
Use qa role when:
✅ Planning test strategies
✅ Evaluating test coverage
✅ Automated testing implementation policies
✅ Bug prevention and quality improvement measures
✅ Test automation in CI/CD

Usage: /role qa
```

### When Multiple Roles Are Needed

### 🔄 multi-role (Parallel Analysis)

```
Use multi-role when:
✅ Want evaluation from multiple expert perspectives
✅ Need to create integrated improvement plans
✅ Want to compare evaluations from different fields
✅ Need to organize contradictions and overlaps

Example: /multi-role security,performance
```

### 🗣️ role-debate (Discussion)

```
Use role-debate when:
✅ Trade-offs exist between specialized fields
✅ Opinions differ on technology selection
✅ Want to decide design policies through discussion
✅ Want to hear debates from different perspectives

Example: /role-debate security,performance
```

### 🤖 smart-review (Automatic Suggestions)

```
Use smart-review when:
✅ Unsure which role to use
✅ Want to know the optimal approach for current situation
✅ Want to choose from multiple options
✅ Beginner uncertain about decisions

Example: /smart-review
```

### Role Comparison Table

### Security-Related

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| security | Vulnerability & attack countermeasures | Threat analysis, authentication design | UX, performance |
| analyzer | Root cause analysis | Logical analysis, evidence collection | Prevention, future planning |

### Design-Related

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| architect | System design | Long-term perspective, overall optimization | Detailed implementation, short-term solutions |
| reviewer | Code quality | Implementation level, maintainability | Business requirements, UX |

### Performance-Related

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| performance | Acceleration & optimization | Measurement, bottleneck identification | Security, UX |
| qa | Quality assurance | Testing, automation | Design, architecture |

### User Experience

| Role | Main Use | Strengths | Weaknesses |
|--------|----------|----------|----------|
| frontend | Web UI/UX | Browser, accessibility | Server-side, DB |
| mobile | Mobile UX | Touch, offline support | Server-side, Web |

### Decision Flowchart When Unsure

```
What is the nature of the problem?
├─ Security-related → security
├─ Performance issues → performance  
├─ Bug/failure investigation → analyzer
├─ UI/UX improvement → frontend or mobile
├─ Design/architecture → architect
├─ Code quality → reviewer
├─ Testing-related → qa
└─ Complex/composite → smart-review for suggestions

Spans multiple fields?
├─ Want integrated analysis → multi-role
├─ Discussion/trade-offs → role-debate
└─ Uncertain about decision → smart-review
```

### Frequently Asked Questions

### Q: What's the difference between frontend and mobile?

```
A: 
frontend: Web browser-focused, HTML/CSS/JavaScript
mobile: Mobile app-focused, iOS/Android native, React Native, etc.

For cases involving both, multi-role frontend,mobile is recommended
```

### Q: How to differentiate between security and analyzer?

```
A:
security: Attack/threat prevention, security design
analyzer: Root cause analysis of problems that already occurred, investigation

For security incident investigation, use multi-role security,analyzer
```

### Q: What's the difference between architect and performance?

```
A:
architect: Long-term design of entire system, scalability
performance: Specific speed and efficiency improvements

For performance design of large-scale systems, use multi-role architect,performance
```

### Integration with Claude

```bash
# Combined with situation description
/role-help
"React app page loading is slow and users are complaining"

# Combined with file content
cat problem-description.md
/role-help
"Recommend the optimal role for this problem"

# When unsure between specific choices
/role-help compare security,performance
"Which role is appropriate for JWT token expiration issues?"
```

### Important Notes

- More complex problems benefit from combining multiple roles
- For urgent cases, use single role for quick response
- When unsure, we recommend using smart-review for automatic suggestions
- Final decisions should be made by users considering the nature of the problem