# Branch

Intelligent Git branch management with automated naming conventions, branch switching, and comprehensive branch operations. Streamlines Git branch workflows with smart naming and automatic push capabilities.

## Usage

```bash
/branch [action] [branch-name] [options]
```

## Options

- `--from <branch>` : Base branch to create from (default: current branch)
- `--push` : Automatically push to remote after creation
- `--track` : Set up tracking with remote branch
- `--force` : Force operations (delete, push)
- `--type <type>` : Branch type for auto mode (feature/bugfix/hotfix/etc)
- `--ticket <id>` : Include ticket/issue ID in branch name

## Basic Examples

```bash
# Create feature branch with specified name
/branch create feature/user-auth

# Auto-generate branch name from staged changes
/branch auto --push

# Switch to existing branch
/branch switch develop

# List all branches with status
/branch list
```

## Prerequisites

**Important**: For auto mode, this command analyzes staged changes. You must stage changes with `git add` beforehand for automatic branch naming.

```bash
# Warning displayed if nothing is staged for auto mode
$ /branch auto
No staged changes found. Please run git add first or specify branch name manually.
```

### Automatic Branch Creation

The command creates a new Git branch and switches to it automatically. For auto mode, it analyzes staged changes to generate appropriate branch names.

**Implementation Notes**:

- Execute `git checkout -b <branch-name>` with the generated or specified name
- Display branch creation result and current status
- Optionally push to remote with `--push` option

### Automatic Project Convention Detection

**Important**: When project-specific branch naming conventions exist, they take priority.

#### 1. Branch Naming Convention Check

Auto-detect settings from the following sources:

- `@COMMIT_AND_PR_GUIDELINES.md`
- `.github/CONTRIBUTING.md`
- `.gitbranchrc` configuration file
- Existing branch patterns in the repository

```bash
# Search for convention files
find . -name "*COMMIT*" -o -name "*CONTRIBUTING*" -o -name ".gitbranchrc" | head -1
```

#### 2. Branch Type Detection

Project-specific branch type examples:

```yaml
# .gitbranchrc
branch_types:
  - feature    # New features
  - bugfix     # Bug fixes
  - hotfix     # Emergency fixes
  - release    # Release preparation
  - chore      # Maintenance tasks
  - docs       # Documentation updates
  - refactor   # Code refactoring
```

#### 3. Existing Branch Pattern Analysis

```bash
# Learn naming patterns from existing branches
git branch --all | grep -E 'feature/|bugfix/|hotfix/' | head -10

# Common prefix statistics
git branch --all | grep -oE '^[^/]+/' | sort | uniq -c | sort -nr
```

### Automatic Branch Naming (Auto Mode)

Automatically generate branch names based on staged changes analysis:

1. **File Analysis**: Examine staged files and their changes
2. **Content Understanding**: Analyze code modifications to understand purpose
3. **Smart Categorization**: Determine if changes are features, fixes, etc.
4. **Descriptive Naming**: Create concise, meaningful branch names

```bash
# Auto-generate branch name
$ /branch auto
🎯 Analyzing staged changes...
📝 Detected: New authentication implementation
🌿 Generated: feature/add-authentication-system
```

### Branch Actions

#### Create Branch

```bash
# Create new branch with specified name
/branch create <branch-name>

# Create from specific base branch
/branch create feature/new-feature --from main
```

#### Auto Branch

```bash
# Auto-generate branch name from staged changes
/branch auto

# Auto-generate with specific type
/branch auto --type bugfix

# Auto-generate with ticket number
/branch auto --ticket PROJ-123
```

#### Switch Branch

```bash
# Switch to existing branch
/branch switch <branch-name>

# Switch and pull latest changes
/branch switch main --pull
```

#### List Branches

```bash
# List all local branches
/branch list

# List all branches including remote
/branch list --remote
```

### Output Examples

```bash
$ /branch create feature/user-dashboard --push

🌿 Creating Branch
━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Branch Details:
   Name: feature/user-dashboard
   Base: main
   
🚀 Creating branch...
✅ Branch created successfully

📤 Pushing to remote...
✅ Branch pushed to origin

🔗 Tracking set up with origin/feature/user-dashboard
```

**Implementation Example**:

```bash
# Get branch name from input or auto-generate
BRANCH_NAME="$1"

# Validate branch name
if [[ ! "$BRANCH_NAME" =~ ^[a-zA-Z0-9/_-]+$ ]]; then
    echo "❌ Invalid branch name. Use only letters, numbers, /, _, and -"
    exit 1
fi

# Create branch
git checkout -b "$BRANCH_NAME"

# Push with tracking if --push flag is set
if [[ "$*" == *"--push"* ]]; then
    git push -u origin "$BRANCH_NAME"
fi

# Display result
cat << EOF
🌿 Creating Branch
━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Branch Details:
   Name: $BRANCH_NAME
   Base: $(git rev-parse --abbrev-ref HEAD)
   
✅ Branch created successfully
EOF
```

### Branch Naming Conventions

#### Recommended Formats

1. **GitFlow Convention**
   ```
   feature/user-authentication
   bugfix/login-error
   hotfix/security-patch
   release/1.2.0
   ```

2. **GitHub Flow Convention**
   ```
   add-user-authentication
   fix-login-error
   update-documentation
   ```

3. **Ticket-Based Naming**
   ```
   feature/PROJ-123-user-auth
   bugfix/BUG-456-login-timeout
   ```

### Smart Features

#### 1. Automatic Change Classification (Staged files only)

- New file addition → `feature`
- Error fix patterns → `bugfix`
- Security fixes → `hotfix`
- Config file changes → `chore`
- README/docs updates → `docs`

#### 2. Automatic Convention Detection

- `@COMMIT_AND_PR_GUIDELINES.md` compliance
- Existing branch pattern analysis
- Project-specific naming rules

#### 3. Auto Mode Analysis Details

Information used for analysis (read-only):

- `git diff --staged --name-only` - List of changed files
- `git diff --staged` - Actual change content
- `git status --porcelain` - File status

### Best Practices

1. **Consistent Naming**: Follow project conventions automatically
2. **Descriptive Names**: Use clear, searchable branch names
3. **Small Scope**: Create branches for specific features or fixes
4. **Regular Cleanup**: Delete merged branches regularly
5. **Remote Sync**: Push feature branches for backup and collaboration

### Common Patterns

**Examples**:

```bash
# Feature development workflow
/branch create feature/user-profile --push
# Work on feature...
git add . && /commit && /push

# Bug fix workflow
/branch auto --type bugfix
# Fix the bug...
git add . && /commit && /push

# Release preparation
/branch create release/1.5.0 --from develop
```

### Claude Integration

```bash
# Create feature branch and start development
/branch create feature/authentication
"Create feature/authentication branch for new auth system"

# Auto-generate branch from staged changes
git add src/auth/
/branch auto --push
"Analyze auth changes and create appropriate branch"

# Switch to development branch
/branch switch develop
"Switch to develop branch for integration"

# List branches for status check
/branch list --remote
"Show all branches with remote tracking status"
```

### Important Notes

- **Prerequisites**: For auto mode, changes must be staged with `git add`
- **Automatic Operations**: Branch creation and switching are immediate
- **Naming Rules**: Follow project-specific conventions when available
- **Safety**: Validates branch names and checks for conflicts
- **Recommendations**: Use meaningful names that describe the work being done

### Configuration

Create `.gitbranchrc` for project-specific settings:

```yaml
# Branch naming patterns
patterns:
  feature: "^feature/[a-z0-9-]+$"
  bugfix: "^bugfix/[a-z0-9-]+$"
  hotfix: "^hotfix/[a-z0-9-]+$"

# Default options
defaults:
  push: false
  track: true
  type: feature

# Protected branches
protected:
  - main
  - master
  - develop
```

### Advanced Options

- `--dry-run` : Preview branch operations without executing
- `--confirm` : Ask for confirmation before creating branch
- `--delete <branch>` : Delete specified branch (with safety checks)
- `--rename <old> <new>` : Rename branch locally and remotely