# Commit

Generate appropriate commit messages from staged changes and execute the commit automatically. Analyzes staged changes to create optimal commit messages and applies them directly.

## Usage

```bash
/commit [options]
```

## Options

- `--format <format>` : Specify message format (conventional, gitmoji, angular)
- `--breaking` : Detect and include Breaking Changes

## Basic Examples

```bash
# Generate message and commit automatically
/commit

# Detect Breaking Changes and commit
/commit --breaking

# Preview commit message before executing
/commit --dry-run
```

## Prerequisites

**Important**: This command only analyzes staged changes. You must stage changes with `git add` beforehand.

```bash
# Warning displayed if nothing is staged
$ /commit
No staged changes found. Please run git add first.
```

### Automatic Commit Execution

The generated commit message is automatically applied using `git commit -m "message"`. The commit is executed immediately after message generation.

**Implementation Notes**:

- Execute `git commit` directly with the generated message
- Display commit result and hash for confirmation
- Use `--dry-run` option to preview message without committing

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

```text
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
$ /commit

📝 Commit Message Generated
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Commit message:
feat: implement JWT-based authentication system

🚀 Executing commit...

✅ Commit successful: a1b2c3d feat: implement JWT-based authentication system
   3 files changed, 45 insertions(+), 12 deletions(-)
```

**Implementation Example**:

```bash
# Generate commit message
COMMIT_MESSAGE="feat: implement JWT-based authentication system"

# Display message
cat << EOF
📝 Commit Message Generated
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Commit message:
$COMMIT_MESSAGE

🚀 Executing commit...
EOF

# Execute commit
git commit -m "$COMMIT_MESSAGE"

# Display result
echo "✅ Commit successful: $(git log --oneline -1)"
git diff --stat HEAD~1 HEAD
```

### Operation Overview

1. **Analysis**: Analyze `git diff --staged` content
2. **Generation**: Generate appropriate commit message
3. **Execution**: Automatically execute `git commit` with generated message
4. **Confirmation**: Display commit hash and change statistics

**Note**: This command executes git commit automatically. Use `--dry-run` to preview the message without committing.

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

```text
feat: add user registration endpoint
fix: resolve memory leak in cache manager
docs: update API documentation
```

### Claude Integration

```bash
# Use with staged changes
git add -p  # Interactive staging
/commit
"Generate optimal commit message and commit"

# Stage specific files and commit
git add src/auth/*.js
/commit
"Generate message and commit authentication changes"

# Breaking change detection and commit
git add -A
/commit --breaking
"Detect breaking changes and commit appropriately"

# Preview before committing
git add .
/commit --dry-run
"Preview commit message without executing"
```

### Important Notes

- **Prerequisites**: Changes must be staged with `git add` beforehand
- **Automatic Execution**: Commits are applied immediately unless `--dry-run` is used
- **Limitations**: Unstaged changes are not analyzed
- **Safety**: Use `--dry-run` to preview commit message before actual commit
- **Recommendations**: Check existing project commit conventions beforehand

### New Options

- `--dry-run` : Preview commit message without executing commit
- `--confirm` : Ask for confirmation before executing commit
- `--amend` : Amend the last commit with new message
