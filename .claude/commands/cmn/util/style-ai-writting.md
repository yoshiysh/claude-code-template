## AI Writing Check

Detects mechanical patterns in AI-generated text and provides improvement suggestions for more natural writing.

### Usage

```bash
/ai-writing-check [options]
```

### Options

- none : Analyze current file or selected text
- `--file <path>` : Analyze specific file
- `--dir <path>` : Batch analyze files in directory
- `--severity <level>` : Detection level (all/high/medium)
- `--fix` : Automatically fix detected patterns

### Basic Examples

```bash
# Check AI-like patterns in file
cat README.md
/ai-writing-check
"Check this document for AI-like patterns and provide improvement suggestions"

# Analyze specific file
/ai-writing-check --file docs/guide.md
"Detect AI-like expressions and suggest natural alternatives"

# Scan entire project
/ai-writing-check --dir . --severity high
"Report only critical AI-like issues in the project"
```

### Detection Patterns

#### 1. Mechanical List Formatting Patterns

```markdown
Detected examples:

- **Important**: This is an important item
- Completed item (with checkmark)
- Hot topic (with fire emoji)
- Ready to launch (with rocket emoji)

Improved examples:

- Important item: This is an important item
- Completed item
- Notable topic
- Ready to launch
```

#### 2. Exaggerated/Hype Expressions

```markdown
Detected examples:
Revolutionary technology that will transform the industry.
This completely solves the problem.
Works like magic.

Improved examples:
Effective technology that brings change to the industry.
Solves many problems.
Works smoothly.
```

#### 3. Mechanical Emphasis Patterns

```markdown
Detected examples:
**Idea**: Here's a new proposal (with lightbulb emoji)
**Warning**: Important warning notice (with warning emoji)

Improved examples:
Idea: Here's a new proposal
Notice: Important warning notice
```

#### 4. Redundant Technical Writing

```markdown
Detected examples:
First, initially set up the configuration.
You can be able to use this tool.
Performance improves dramatically.

Improved examples:
First, set up the configuration.
You can use this tool.
Performance improves by 30%.
```

### Integration with Claude

```bash
# Analyze entire document for AI-like patterns
cat article.md
/ai-writing-check
"Analyze from the following perspectives and provide improvement suggestions:
1. Detection of mechanical expressions
2. Suggestions for natural language improvements
3. Priority-based improvement list"

# Focus on specific patterns
/ai-writing-check --file blog.md
"Focus on exaggerated expressions and redundant language for improvement suggestions"

# Batch check multiple files
find . -name "*.md" -type f
/ai-writing-check --dir docs/
"Analyze AI-like patterns across all documentation and create a summary"
```

### Detailed Examples

```bash
# Before/after comparison
/ai-writing-check --file draft.md
"Detect AI-like expressions and present in the following format:
- Problem locations (with line numbers)
- Problem type and reasoning
- Specific improvement suggestions
- Expected impact of improvements"

# Automatic fix mode
/ai-writing-check --file report.md --fix
"Automatically fix detected patterns and report results"

# Project AI-like pattern report
/ai-writing-check --dir . --severity all
"Analyze AI-like patterns across the entire project:
1. Statistical information (detection count by pattern)
2. Top 5 most problematic files
3. Improvement priority matrix
4. Phased improvement plan"
```

### Advanced Usage Examples

```bash
# Apply custom rules
/ai-writing-check --file spec.md
"Check as technical specification with additional criteria:
- Vague expressions (appropriate, as needed)
- Lack of specificity (fast → specific numerical values)
- Inconsistent terminology usage"

# CI/CD integration check
/ai-writing-check --dir docs/ --severity high
"Output results in GitHub Actions-compatible format:
- Error count and file names
- Line numbers requiring fixes
- Exit code configuration"

# Style guide compliance check
/ai-writing-check --file manual.md
"Additional checks based on company style guide:
- Polite language usage (consistency in formal tone)
- Appropriate use of technical terms
- Reader consideration"
```

### Important Notes

- AI-like pattern detection varies by context, so treat suggestions as reference
- Criteria are adjusted based on document type (technical docs, blogs, manuals, etc.)
- You don't need to accept all suggestions - select appropriate ones
- The `--fix` option automatically corrects detected patterns

### Command Execution Behavior

When the `/ai-writing-check` command is executed, Claude performs the following processes:

1. **Pattern Detection**: Detect AI-like patterns from specified files or text
2. **Specific Fix Suggestions**: Provide fix suggestions with line numbers for each issue
3. **--fix Mode**: Automatically fix detected patterns and display summary results
4. **Report Generation**: Provide detection counts, improvement priorities, and before/after comparisons

Claude reads actual file content and performs analysis based on textlint-rule-preset-ai-writing rules.

### Reference

This command is created based on the [textlint-rule-preset-ai-writing](https://github.com/textlint-ja/textlint-rule-preset-ai-writing) rule set. It is a textlint rule preset designed to detect mechanical patterns in AI-generated text and promote more natural expressions.
