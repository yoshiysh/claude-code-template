# Push

Push local commits to remote repository with intelligent branch management and conflict detection. Analyzes current branch state and executes appropriate push operations automatically.

## Usage

```bash
/push [options]
```

## Options

- `--force` : Force push (use with caution)
- `--set-upstream` : Set upstream tracking for new branches
- `--dry-run` : Preview push operations without executing

## Basic Examples

```bash
# Push current branch to remote
/push

# Push and set upstream for new branch
/push --set-upstream

# Preview push operations
/push --dry-run
```

## Prerequisites

**Important**: This command checks for local commits ahead of remote. If no commits to push, it will display current status.

```bash
# Warning displayed if nothing to push
$ /push
Current branch is up to date with remote. Nothing to push.
```

### Automatic Push Execution

The command automatically determines the appropriate push operation based on branch state and executes `git push` with optimal parameters.

**Implementation Notes**:

- Check branch tracking status before pushing
- Auto-detect if `--set-upstream` is needed for new branches
- Display push result and commit summary for confirmation
- Use `--dry-run` option to preview operations without pushing

### Automatic Branch Detection

**Important**: When branch-specific configurations exist, they take priority.

#### 1. Branch Tracking Status Check

Auto-detect current branch state:

- Local branch exists but no remote tracking
- Local commits ahead of remote
- Remote commits ahead of local (conflict detection)
- Branch is up to date

```bash
# Check branch status
git status --porcelain -b
git rev-list --count HEAD ^origin/$(git branch --show-current) 2>/dev/null || echo "0"
```

#### 2. Remote Branch Detection

Detect remote branch existence:

```bash
# Check if remote branch exists
git ls-remote --heads origin $(git branch --show-current) | wc -l
```

#### 3. Conflict Detection

Check for potential conflicts before pushing:

```bash
# Check if remote has new commits
git fetch --dry-run 2>&1 | grep -q "Would update" && echo "Remote has updates"
```

#### 4. Branch Naming Convention Analysis

```bash
# Analyze current branch name for push strategy
BRANCH_NAME=$(git branch --show-current)
case $BRANCH_NAME in
  main|master|develop) echo "Protected branch detected" ;;
  feature/*|feat/*) echo "Feature branch detected" ;;
  hotfix/*|fix/*) echo "Hotfix branch detected" ;;
  *) echo "Standard branch detected" ;;
esac
```

### Automatic Conflict Resolution

Automatically handle common push scenarios:

1. **Clean Push** - No conflicts, direct push
2. **New Branch** - Auto-add `--set-upstream`
3. **Behind Remote** - Suggest pull before push
4. **Diverged History** - Warn about force push necessity

### Push Operations

#### Standard Push (Default)

```bash
git push
```

#### New Branch Push

```bash
git push --set-upstream origin <branch-name>
```

**Important**: Automatically detects new branches and sets upstream tracking.

### Output Examples

```bash
$ /push

🚀 Push Operation Starting
━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Branch Analysis:
- Current branch: feature/user-auth
- Local commits ahead: 3
- Remote tracking: ✅ origin/feature/user-auth

✨ Executing push...

✅ Push successful: 3 commits pushed to origin/feature/user-auth
   Total: 5 files changed, 127 insertions(+), 23 deletions(-)
```

**Implementation Example**:

```bash
# Check branch status
CURRENT_BRANCH=$(git branch --show-current)
COMMITS_AHEAD=$(git rev-list --count HEAD ^origin/$CURRENT_BRANCH 2>/dev/null || echo "0")

# Display status
cat << EOF
🚀 Push Operation Starting
━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Branch Analysis:
- Current branch: $CURRENT_BRANCH
- Local commits ahead: $COMMITS_AHEAD
EOF

# Execute push
if [ "$COMMITS_AHEAD" -gt "0" ]; then
  git push
  echo "✅ Push successful: $COMMITS_AHEAD commits pushed to origin/$CURRENT_BRANCH"
  git diff --stat HEAD~$COMMITS_AHEAD HEAD
else
  echo "ℹ️ Current branch is up to date with remote. Nothing to push."
fi
```

### Operation Overview

1. **Analysis**: Check current branch status and tracking
2. **Detection**: Identify push requirements and potential conflicts
3. **Execution**: Execute appropriate push command
4. **Confirmation**: Display push result and commit statistics

**Note**: This command executes git push automatically. Use `--dry-run` to preview operations without pushing.

### Smart Features

#### 1. Automatic Branch Management

- New branch detection → Auto-add `--set-upstream`
- Protected branch warning → Confirm before push
- Hotfix branch → Fast-track push
- Feature branch → Standard push with tracking

#### 2. Conflict Prevention

- Pre-fetch check for remote updates
- Diverged history detection
- Force push safety warnings

#### 3. Push Strategy Selection

```bash
# Detection criteria (priority order)
1. Check if remote branch exists
2. Analyze local vs remote commit status
3. Detect branch naming patterns
4. Apply appropriate push strategy
```

#### 4. Status Information Display

Information displayed during analysis:

- `git status --porcelain -b` - Branch status
- `git rev-list --count HEAD ^origin/branch` - Commits ahead
- `git log --oneline -n 5` - Recent commits to push

### Force Push Handling

When force push is necessary:

**Safety Checks**:

```bash
# Warn before force push
echo "⚠️  WARNING: Force push will overwrite remote history"
echo "   Remote commits may be lost permanently"
read -p "Continue? (y/N): " confirm
```

### Best Practices

1. **Safety First**: Always check remote status before pushing
2. **Clean History**: Ensure commits are properly formatted
3. **Branch Protection**: Respect protected branch policies
4. **Communication**: Coordinate force pushes with team
5. **Backup**: Consider creating backup branches for force pushes

### Common Patterns

**Examples**:

```bash
# Standard feature development
git add . && git commit -m "feat: add user validation"
/push

# New feature branch
git checkout -b feature/new-feature
git add . && git commit -m "feat: initial implementation"
/push --set-upstream

# Hotfix deployment
git checkout -b hotfix/critical-bug
git add . && git commit -m "fix: resolve critical security issue"
/push --set-upstream
```

### Claude Integration

```bash
# Push after committing changes
git add . && /commit && /push
"Commit changes and push to remote"

# Create feature branch and push
git checkout -b feature/user-profile
git add . && /commit && /push --set-upstream
"Create feature branch, commit, and push with upstream"

# Safe push with preview
/push --dry-run
"Preview push operations before executing"

# Emergency hotfix push
git add . && /commit && /push
"Commit and push critical hotfix immediately"
```

### Important Notes

- **Prerequisites**: Local commits must exist to push
- **Automatic Execution**: Push operations are executed immediately unless `--dry-run` is used
- **Safety**: Always checks for conflicts before pushing
- **Branch Tracking**: Automatically sets upstream for new branches
- **Recommendations**: Check remote status and team coordination before force pushes

### Advanced Options

- `--dry-run` : Preview push operations without executing
- `--set-upstream` : Force set upstream tracking
- `--force` : Force push (requires confirmation)
- `--verbose` : Display detailed push information