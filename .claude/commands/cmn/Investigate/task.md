## Task

Launch a dedicated agent to autonomously execute complex search, investigation, and analysis tasks. Combines multiple tools for large-scale information processing with emphasis on context efficiency.

### Usage

```bash
# Request Task investigation from Claude
"Investigate [issue] using Task"
```

### Task Features

**Autonomous Execution**

- Automatic execution combining multiple tools
- Systematic information gathering and analysis  
- Result integration and structured reporting

**Efficient Information Processing**

- Context consumption optimization
- Large-scale file search and analysis
- External data source collection

**Quality Assurance**

- Information source reliability checks
- Multi-perspective verification
- Automatic completion of missing information

### Basic Examples

```bash
# Complex codebase investigation
"Investigate which files implement this feature using Task"

# Large-scale file search
"Identify configuration file inconsistencies using Task"

# External information gathering
"Research latest AI technology trends using Task"
```

### Integration with Claude

```bash
# Complex problem analysis
"Analyze memory leak causes using Task. Include profiling results and logs"

# Dependency investigation
"Investigate vulnerabilities in this npm package using Task"

# Competitive analysis
"Research competitor service API specifications using Task"

# Architecture analysis
"Analyze microservice dependencies using Task"
```

### Command Comparison

#### Task vs Other Commands

| Command | Primary Use | Execution Style | Information Gathering |
|---------|-------------|-----------------|----------------------|
| **Task** | Investigation, Analysis, Search | Autonomous execution | Multiple sources |
| ultrathink | Deep thinking, Decision-making | Structured reasoning | Existing knowledge |
| sequential-thinking | Problem solving, Design | Step-by-step thinking | As needed |
| plan | Implementation planning | Approval process | Requirements analysis |

#### Decision Flowchart

```
Need information gathering?
├─ Yes → Multiple sources/large-scale?
│          ├─ Yes → **Task**
│          └─ No → Regular question
└─ No → Need deep thinking?
          ├─ Yes → ultrathink/sequential-thinking
          └─ No → Regular question
```

### Effective vs Unnecessary Cases

**Effective Cases**

- Complex codebase investigation (dependencies, architecture analysis)
- Large-scale file searches (specific implementation patterns, configuration files)
- External information gathering and organization (tech trends, library research)
- Multi-source information integration (log analysis, metrics analysis)
- Iterative investigation work (security audits, technical debt assessment)
- Large-scale analysis where context consumption should be minimized

**Unnecessary Cases**

- Simple questions answerable with existing knowledge
- Quick, one-off tasks that complete in short time
- Work requiring interactive confirmation or consultation
- Implementation or design decisions (plan or thinking commands are more appropriate)

### Category-Specific Examples

#### System Analysis & Investigation

```bash
# Complex system analysis
"Identify e-commerce bottlenecks using Task. Investigate database, API, and frontend comprehensively"

# Architecture analysis
"Analyze microservice dependencies using Task. Include API communication and data flow"

# Technical debt investigation
"Analyze legacy code technical debt using Task. Include refactoring priorities"
```

#### Security & Compliance

```bash
# Security audit
"Investigate application vulnerabilities using Task. Based on OWASP Top 10"

# License investigation
"Investigate project dependency license issues using Task"

# Configuration audit
"Identify security configuration inconsistencies using Task. Include environment-specific differences"
```

#### Performance & Optimization

```bash
# Performance analysis
"Identify heavy queries using Task. Include execution plans and optimization suggestions"

# Resource usage investigation
"Investigate memory leak causes using Task. Include profiling results and code analysis"

# Bundle size analysis
"Investigate frontend bundle size issues using Task. Include optimization recommendations"
```

#### External Information Gathering

```bash
# Technology trend research
"Research 2024 JavaScript framework trends using Task"

# Competitive analysis
"Research competitor service API specifications using Task. Include feature comparison table"

# Library evaluation
"Compare state management libraries using Task. Include performance and learning curve"
```

### Execution Flow and Quality Assurance

#### Task Execution Flow

```
1. Initial Analysis
   ├─ Problem decomposition and scope identification
   ├─ Required tools and information source selection
   └─ Execution plan development

2. Information Gathering
   ├─ File search and code analysis
   ├─ External information collection
   └─ Data structuring

3. Analysis & Integration
   ├─ Collected information relationship analysis
   ├─ Pattern and issue identification
   └─ Hypothesis verification

4. Reporting & Recommendations
   ├─ Result structuring
   ├─ Improvement proposal creation
   └─ Next action presentation
```

#### Quality Assurance

- **Information Source Reliability**: Multi-source fact verification
- **Completeness Verification**: Check for investigation gaps
- **Consistency Validation**: Resolve contradictory information
- **Practicality Assessment**: Evaluate proposal feasibility and effectiveness

### Error Handling and Limitations

#### Common Limitations

- **External API Usage Restrictions**: Rate limits and authentication errors
- **Large File Processing Limits**: Memory and timeout constraints
- **Access Permission Issues**: File and directory access restrictions

#### Error Response Strategies

- **Partial Result Reporting**: Analysis with available information only
- **Alternative Method Suggestions**: Alternative investigation approaches under constraints
- **Phased Execution**: Large task subdivision for execution

### Important Notes

- Task is optimal for complex and autonomous investigation/analysis tasks
- For simple questions or immediate responses, use regular question format
- Treat investigation results as reference information; always verify important decisions
- When collecting external information, pay attention to information freshness and accuracy

### Usage Example

```bash
# Usage example
"Investigate GraphQL schema issues using Task"

# Expected behavior:
# 1. Dedicated agent launches
# 2. Search for GraphQL-related files
# 3. Analyze schema definitions
# 4. Compare with best practices
# 5. Identify issues and create improvement proposals
# 6. Generate structured report
```
