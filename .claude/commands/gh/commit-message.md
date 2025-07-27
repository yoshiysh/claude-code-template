# Commit Message

Generate appropriate commit messages from staged changes (`git diff --staged`). Only performs message generation and clipboard copying without executing git commands.

## Usage

```bash
/commit-message [options]
```

## Options

- `--format <format>` : Specify message format (conventional, gitmoji, angular)
- `--breaking` : Detect and include Breaking Changes

## Basic Examples

```bash
# Generate message from staged changes
# Main candidate automatically copied to clipboard
/commit-message

# Detect Breaking Changes
/commit-message --breaking
```

## Prerequisites

**Important**: This command only analyzes staged changes. You must stage changes with `git add` beforehand.

```bash
# Warning displayed if nothing is staged
$ /commit-message
No staged changes found. Please run git add first.
```

### Automatic Clipboard Feature

The generated main candidate is automatically copied to clipboard in the complete format `git commit -m "message"`. You can paste and execute it directly in the terminal.

**Implementation Notes**:

- Execute the commit command to `pbcopy` in a separate process from message output
- Use `printf` instead of `echo` to avoid trailing newlines

### Automatic Project Convention Detection

**Important**: When project-specific conventions exist, they take priority.

#### 1. CommitLint Configuration Check

Auto-detect settings from the following files:

- `commitlint.config.js`
- `commitlint.config.mjs`
- `commitlint.config.cjs`
- `commitlint.config.ts`
- `.commitlintrc.js`
- `.commitlintrc.json`
- `.commitlintrc.yml`
- `.commitlintrc.yaml`
- `commitlint` section in `package.json`

```bash
# Search for configuration files
find . -name "commitlint.config.*" -o -name ".commitlintrc.*" | head -1
```

#### 2. Custom Type Detection

Project-specific type examples:

```javascript
// commitlint.config.mjs
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore',
        'wip',      // Work in Progress
        'hotfix',   // Emergency fix
        'release',  // Release
        'deps',     // Dependency updates
        'config'    // Configuration changes
      ]
    ]
  }
}
```

#### 3. Language Setting Detection

```javascript
// For projects using non-English commit messages
export default {
  rules: {
    'subject-case': [0],  // Disabled for non-English support
    'subject-max-length': [2, 'always', 72]  // Adjusted character limit
  }
}
```

#### 4. Existing Commit History Analysis

```bash
# Learn usage patterns from recent commits
git log --oneline -50 --pretty=format:"%s"

# Type usage statistics
git log --oneline -100 --pretty=format:"%s" | \
grep -oE '^[a-z]+(\([^)]+\))?' | \
sort | uniq -c | sort -nr
```

### Automatic Language Detection

Automatically switch language based on following conditions:

1. **CommitLint settings** - Check language configuration
2. **git log analysis** - Automatic detection
3. **Project files** - Language settings
4. **Changed files** - Comment and string analysis

Default is English. Generate in project language when detected.

### Message Format

#### Conventional Commits (Default)

```
<type>: <description>
```

**Important**: Always generate single-line commit messages. Multi-line messages are not generated.

**Note**: When project-specific conventions exist, they take priority.

### Standard Types

**Required Types**:

- `feat`: New features (user-visible feature additions)
- `fix`: Bug fixes

**Optional Types**:

- `build`: Changes to build system or external dependencies
- `chore`: Other changes (no release impact)
- `ci`: CI configuration files or script changes
- `docs`: Documentation only changes
- `style`: Changes that don't affect code meaning (whitespace, formatting, semicolons)
- `refactor`: Code changes that neither fix bugs nor add features
- `perf`: Performance improvements
- `test`: Adding or correcting tests

### Output Examples

```bash
$ /commit-message

📝 Commit Message Suggestions
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Main candidate:
feat: implement JWT-based authentication system

📋 Alternatives:
1. feat: add user authentication with JWT tokens
2. fix: resolve token validation error in auth middleware
3. refactor: extract auth logic into separate module

✅ `git commit -m "feat: implement JWT-based authentication system"` copied to clipboard
```

**Implementation Example (Corrected)**:

```bash
# Copy commit command to clipboard first (no newline)
printf 'git commit -m "%s"' "$COMMIT_MESSAGE" | pbcopy

# Then display message
cat << EOF
📝 Commit Message Suggestions
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Main candidate:
$COMMIT_MESSAGE

📋 Alternatives:
1. ...
2. ...
3. ...

✅ \`git commit -m "$COMMIT_MESSAGE"\` copied to clipboard
EOF
```

### Operation Overview

1. **Analysis**: Analyze `git diff --staged` content
2. **Generation**: Generate appropriate commit message
3. **Copy**: Automatically copy main candidate to clipboard

**Note**: This command does not execute git add or git commit. It only generates commit messages and copies to clipboard.

### Smart Features

#### 1. Automatic Change Classification (Staged files only)

- New file addition → `feat`
- Error fix patterns → `fix`
- Test files only → `test`
- Config file changes → `chore`
- README/docs updates → `docs`

#### 2. Automatic Project Convention Detection

- `.gitmessage` file
- Conventions in `CONTRIBUTING.md`
- Past commit history patterns

#### 3. Language Detection Details (Staged changes only)

```bash
# Detection criteria (priority order)
1. Detect language from git diff --staged content
2. Analyze comments in staged files
3. Analyze language in git log --oneline -20
4. Project main language settings
```

#### 4. Staging Analysis Details

Information used for analysis (read-only):

- `git diff --staged --name-only` - List of changed files
- `git diff --staged` - Actual change content
- `git status --porcelain` - File status

### Breaking Change Detection

When there are breaking API changes:

**Format**:

```bash
feat!: change user API response format

BREAKING CHANGE: user response now includes additional metadata
```

Or

```bash
feat(api)!: change authentication flow
```

### Best Practices

1. **Project Consistency**: Follow existing commit language
2. **Brevity**: Clear within 50 characters
3. **Consistency**: Don't mix languages (stick to one language)
4. **OSS**: English recommended for open source
5. **Single Line**: Always single-line commit messages (use PR for detailed explanations)

### Common Patterns

**Examples**:

```
feat: add user registration endpoint
fix: resolve memory leak in cache manager
docs: update API documentation
```

### Claude Integration

```bash
# Use with staged changes
git add -p  # Interactive staging
/commit-message
"Generate optimal commit message"

# Stage specific files for analysis
git add src/auth/*.js
/commit-message
"Generate message appropriate for authentication changes"

# Breaking change detection and handling
git add -A
/commit-message --breaking
"Mark breaking changes appropriately if present"
```

### Important Notes

- **Prerequisites**: Changes must be staged with `git add` beforehand
- **Limitations**: Unstaged changes are not analyzed
- **Recommendations**: Check existing project commit conventions beforehand