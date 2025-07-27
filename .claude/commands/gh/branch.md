# Branch Management Command

Intelligent Git branch management with automated naming conventions, branch switching, and comprehensive branch operations. Streamlines Git branch workflows with smart naming, automatic push capabilities, and safety features to prevent common mistakes.

## Quick Start

```bash
# Most common usage patterns
/branch create feature/new-feature --push    # Create and push new branch
/branch auto --type bugfix                   # Auto-generate branch name from changes
/branch switch develop                       # Switch to existing branch
/branch list                                 # Show all branches
```

## Usage

```bash
/branch [action] [branch-name] [options]
/branch auto [options]  # Analyze changes and auto-generate branch name
```

## Actions

| Action | Description | Example |
|--------|-------------|--------|
| `create <branch-name>` | Create new branch with specified name | `/branch create feature/auth` |
| `auto` | Analyze current changes and create branch with smart naming | `/branch auto --type bugfix` |
| `switch <branch-name>` | Switch to existing branch | `/branch switch develop` |
| `list` | List all branches with status | `/branch list --remote` |
| `delete <branch-name>` | Delete local/remote branch | `/branch delete feature/old` |
| `rename <old-name> <new-name>` | Rename branch locally and remotely | `/branch rename old new` |
| `current` | Show current branch info | `/branch current` |
| `cleanup` | Remove merged branches | `/branch cleanup --dry-run` |

## Options

| Option | Description | Default | Example |
|--------|-------------|---------|--------|
| `--from <branch>` | Base branch to create from | current branch | `--from main` |
| `--push` | Automatically push to remote after creation | false | `--push` |
| `--track` | Set up tracking with remote branch | true | `--track` |
| `--force` | Force operations (delete, push) | false | `--force` |
| `--remote` | Include remote branch operations | false | `--remote` |
| `--type <type>` | Branch type for auto mode | feature | `--type bugfix` |
| `--ticket <id>` | Include ticket/issue ID in branch name | none | `--ticket PROJ-123` |
| `--dry-run` | Preview operation without executing | false | `--dry-run` |
| `--pull` | Pull latest changes when switching | false | `--pull` |

## Basic Examples

```bash
# Create feature branch with specified name
/branch create feature/user-auth

# Auto-generate branch name from staged changes
/branch auto --push

# Auto-generate with specific type
/branch auto --type bugfix --ticket BUG-123

# Create and push feature branch
/branch create feature/payment-integration --push

# Switch to existing branch
/branch switch develop

# List all branches with details
/branch list --remote
```

## Branch Naming Conventions

### Recommended Branch Name Formats

When creating branches, use explicit naming that follows your project's conventions:

1. **GitFlow Convention**
   ```bash
   # Feature branches
   feature/user-authentication
   feature/payment-integration
   
   # Bugfix branches
   bugfix/login-error
   bugfix/cart-calculation
   
   # Hotfix branches
   hotfix/security-patch
   hotfix/critical-bug
   
   # Release branches
   release/1.2.0
   release/2.0.0-beta
   ```

2. **GitHub Flow Convention**
   ```bash
   # Simple descriptive names
   add-user-authentication
   fix-login-error
   update-documentation
   ```

3. **Ticket-Based Naming**
   ```bash
   # With issue/ticket numbers
   feature/PROJ-123-user-auth
   bugfix/BUG-456-login-timeout
   ```


### Common Branch Prefixes

**Standard Prefixes**:

- `feature/` : New features
- `bugfix/` : Bug fixes  
- `hotfix/` : Emergency fixes
- `release/` : Release preparation
- `chore/` : Maintenance tasks
- `docs/` : Documentation updates
- `test/` : Test additions/fixes
- `refactor/` : Code refactoring


### Branch Name Examples

```bash
# Feature branches
/branch create feature/user-dashboard
/branch create feature/api-v2-endpoints

# Bugfix branches
/branch create bugfix/fix-memory-leak
/branch create bugfix/resolve-login-issue

# Release branches
/branch create release/1.5.0
/branch create release/2.0.0-rc1
```

## Smart Branch Naming (Auto Mode)

### Automatic Branch Name Generation

The `auto` action analyzes your staged changes and generates appropriate branch names:

```bash
# Basic auto-generation
/branch auto
# Analyzes changed files and generates: feature/add-user-authentication

# With type specification
/branch auto --type bugfix
# Generates: bugfix/fix-login-validation-error

# With ticket number
/branch auto --ticket PROJ-456
# Generates: feature/PROJ-456-payment-integration

# Combined options
/branch auto --type hotfix --ticket HOT-789 --push
# Generates and pushes: hotfix/HOT-789-critical-security-fix
```

### How Auto Mode Works

1. **File Analysis**: Examines staged files and their changes
2. **Content Understanding**: Analyzes code modifications to understand the change purpose
3. **Smart Categorization**: Determines if changes are features, fixes, refactoring, etc.
4. **Descriptive Naming**: Creates concise, meaningful branch names
5. **Convention Compliance**: Follows your project's branch naming conventions

### Auto Mode Examples by Change Type

```bash
# Adding new authentication files
$ git add src/auth/*.js
$ /branch auto
🎯 Analyzing changes...
📝 Detected: New authentication implementation
🌿 Generated: feature/add-authentication-system

# Fixing validation bugs
$ git add src/validators/user.js
$ /branch auto --type bugfix
🎯 Analyzing changes...
📝 Detected: Validation logic fixes
🌿 Generated: bugfix/fix-user-validation-errors

# Documentation updates
$ git add docs/*.md README.md
$ /branch auto
🎯 Analyzing changes...
📝 Detected: Documentation improvements
🌿 Generated: docs/update-api-documentation
```

## Advanced Features

### 1. Branch Creation with Context

```bash
# Create from specific branch
/branch create feature/new-dashboard --from main

# Create bugfix branch from develop
/branch create bugfix/PROJ-123-login-fix --from develop

# Create release branch and push
/branch create release/2.0.0 --from develop --push
```

### 2. Branch Switching

```bash
# Switch to existing branch
/branch switch develop

# Switch to main and pull latest
/branch switch main --pull

# Switch to feature branch
/branch switch feature/new-ui
```

### 3. Branch Management

```bash
# Delete merged branches
/branch delete --merged

# Delete with remote
/branch delete feature/old-feature --remote

# Rename with remote update
/branch rename old-name new-name --remote
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
#!/bin/bash
set -euo pipefail

# Function to validate branch name
validate_branch_name() {
    local branch_name="$1"
    local max_length=50
    
    # Check for invalid characters
    if [[ ! "$branch_name" =~ ^[a-zA-Z0-9/_-]+$ ]]; then
        echo "❌ Invalid branch name. Use only letters, numbers, /, _, and -"
        return 1
    fi
    
    # Check length
    if [[ ${#branch_name} -gt $max_length ]]; then
        echo "❌ Branch name too long. Maximum $max_length characters."
        return 1
    fi
    
    # Check for protected branch patterns
    if [[ "$branch_name" =~ ^(main|master|develop)$ ]]; then
        echo "❌ Cannot create protected branch name: $branch_name"
        return 1
    fi
    
    return 0
}

# Function to create branch with safety checks
create_branch() {
    local branch_name="$1"
    local base_branch="${2:-HEAD}"
    local should_push="${3:-false}"
    
    # Validate branch name
    validate_branch_name "$branch_name" || return 1
    
    # Check if branch already exists
    if git show-ref --quiet refs/heads/"$branch_name"; then
        echo "⚠️  Branch '$branch_name' already exists locally"
        return 1
    fi
    
    # Stash changes if any
    if ! git diff --quiet || ! git diff --cached --quiet; then
        echo "📦 Stashing uncommitted changes..."
        git stash push -m "Auto-stash before creating branch $branch_name"
    fi
    
    # Create branch
    echo "🚀 Creating branch from $base_branch..."
    git checkout -b "$branch_name" "$base_branch"
    
    # Push if requested
    if [[ "$should_push" == "true" ]]; then
        echo "📤 Pushing to remote..."
        git push -u origin "$branch_name" || {
            echo "❌ Failed to push branch"
            return 1
        }
    fi
    
    # Display success message
    cat << EOF
🌿 Branch Created Successfully
━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Branch Details:
   Name: $branch_name
   Base: $base_branch
   Remote: $(if [[ "$should_push" == "true" ]]; then echo "origin/$branch_name"; else echo "not pushed"; fi)
   
✅ Ready to work on $branch_name
EOF
}

# Main execution
BRANCH_NAME="$1"
BASE_BRANCH="${2:-HEAD}"
SHOULD_PUSH="false"

# Parse options
for arg in "$@"; do
    case $arg in
        --push) SHOULD_PUSH="true" ;;
        --from=*) BASE_BRANCH="${arg#*=}" ;;
    esac
done

# Execute
create_branch "$BRANCH_NAME" "$BASE_BRANCH" "$SHOULD_PUSH"
```

### Branch Status Display

```bash
$ /branch list

📊 Branch Overview
━━━━━━━━━━━━━━━━━━━━━━━━━

🌿 Local Branches:
   * main                    ↑2 ↓0   [origin/main]
     develop                 ↑0 ↓3   [origin/develop]
     feature/user-auth       ↑5 ↓0   [origin/feature/user-auth]
     bugfix/login-error      local only

🌐 Remote Branches:
   origin/feature/api-v2
   origin/release/1.2.0
   
📈 Summary:
   Total: 4 local, 6 remote
   Unmerged: 2
   Stale: 1 (30+ days)
```

### Protection Rules

```bash
# Check before operations
/branch delete main
⚠️  Cannot delete protected branch 'main'

# Override with force
/branch delete feature/old --force --remote
✅ Branch deleted locally and remotely
```

### Integration Features

#### 1. CI/CD Status

```bash
/branch list --status
# Shows CI pipeline status for each branch
```

#### 2. PR Integration

```bash
/branch create feature --open-pr
# Creates branch and opens PR draft
```

#### 3. Worktree Support

```bash
/branch create feature --worktree /path/to/worktree
# Creates branch in separate worktree
```

### Best Practices

1. **Consistent Naming**: Follow project conventions automatically
2. **Clean History**: Delete merged branches regularly
3. **Remote Sync**: Always push feature branches for backup
4. **Descriptive Names**: Use clear, searchable branch names
5. **Regular Cleanup**: Use `/branch cleanup` periodically

### Common Patterns

```bash
# Feature development
/branch create feature/user-profile --push

# Bug fix with ticket number
/branch create bugfix/BUG-789-login-timeout

# Release preparation
/branch create release/1.5.0 --from develop

# Hotfix from production
/branch create hotfix/critical-security-fix --from main --push
```

### Claude Integration

```bash
# Create feature branch
/branch create feature/authentication
"Create feature/authentication branch"

# Auto-generate branch from changes
/branch auto --push
"Analyze staged changes and create appropriately named branch"

# List branches
/branch list
"Show all branches with their status"

# Delete merged branches
/branch delete feature/old-feature
"Delete the specified branch"
```

### Safety Features

- **Protected Branches**: Prevents deletion of main, master, develop
- **Merge Status Check**: Warns before deleting unmerged branches
- **Remote Sync**: Confirms before deleting remote branches
- **Stash Handling**: Automatically stashes changes when switching
- **Backup Creation**: Creates backup tags before destructive operations

### Configuration

Create `.gitbranchrc` for project-specific settings:

```yaml
# Protected branches that cannot be deleted or modified
protected:
  - main
  - master
  - develop
  - release/*
  - production

# Default behavior settings  
defaults:
  push: false          # Auto-push after creation
  track: true          # Set up remote tracking
  stash: true          # Auto-stash uncommitted changes
  pull: false          # Pull latest when switching
  
# Branch name validation rules
validation:
  # Regex pattern for branch name validation
  pattern: "^(feature|bugfix|hotfix|release|chore|docs|test|refactor)/[a-z0-9-]+$"
  max-length: 50
  min-length: 5
  # Forbidden words in branch names
  forbidden:
    - temp
    - test
    - wip
    - todo

# Auto mode configuration
auto:
  # Depth of analysis for auto naming
  analyze-depth: full  # full | shallow
  # How to handle ticket numbers
  include-ticket: prompt  # always | prompt | never
  # Default branch type if not detected
  default-type: feature
  # Use AI-powered detection
  smart-detection: true
  # Patterns for type detection
  type-patterns:
    bugfix: ["fix", "bug", "issue", "error"]
    feature: ["add", "implement", "create", "new"]
    refactor: ["refactor", "improve", "optimize"]
    docs: ["document", "readme", "docs"]

# Cleanup settings
cleanup:
  # Days before considering branch stale
  stale-days: 30
  # Exclude patterns from cleanup
  exclude:
    - release/*
    - hotfix/*
  # Require confirmation
  confirm: true
```

### Important Notes

#### Safety & Validation

- **Protected Branches**: Cannot delete or modify main, master, develop, or custom protected branches
- **Branch Name Validation**: Enforces naming conventions and character restrictions
- **Automatic Stashing**: Uncommitted changes are automatically stashed before branch operations
- **Remote Sync Checks**: Verifies remote state before push/delete operations

#### Best Practices

- **Explicit Naming**: Always specify the full branch name including prefix (or use auto mode)
- **Auto Mode**: Requires staged changes to analyze for branch name generation
- **Naming Convention**: Follow your project's branch naming convention consistently
- **Regular Cleanup**: Use `/branch cleanup` to remove merged branches periodically
- **Ticket Integration**: Include ticket IDs for better traceability

#### Technical Considerations

- **Valid Characters**: Branch names can contain letters, numbers, `/`, `_`, and `-`
- **Maximum Length**: Default 50 characters (configurable)
- **Remote Operations**: Require appropriate Git permissions
- **Force Operations**: Use with extreme caution, especially with `--remote`
- **Performance**: Auto mode analysis may take longer on large codebases

#### Troubleshooting

| Issue | Solution |
|-------|----------|
| "Branch already exists" | Use `/branch switch` or delete the existing branch |
| "Permission denied" | Check Git remote permissions and SSH keys |
| "Invalid branch name" | Ensure name follows pattern and uses valid characters |
| "Uncommitted changes" | Changes are auto-stashed, or commit them first |
| "Remote push failed" | Check network connection and remote repository access |
