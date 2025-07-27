# Semantic Commit

Split large changes into meaningful minimal units and commit them sequentially with semantic commit messages. Uses only standard git commands without external tool dependencies.

## Usage

```bash
/semantic-commit [options]
```

## Options

- `--dry-run` : Show proposed commit splits without performing actual commits
- `--max-commits <number>` : Specify maximum number of commits (default: 10)

## Basic Examples

```bash
# Analyze current changes and commit in logical units
/semantic-commit

# Review split proposal only (no actual commits)
/semantic-commit --dry-run

# Split into maximum of 5 commits
/semantic-commit --max-commits 5
```

### Operation Flow

1. **Change Analysis**: Get all changes with `git diff HEAD`
2. **File Classification**: Logically group changed files
3. **Commit Proposal**: Generate semantic commit messages for each group
4. **Sequential Execution**: After user confirmation, commit each group sequentially

### Core Change Splitting Functionality

#### "Large Change" Detection

Detect as large changes under following conditions:

1. **File Count**: 5 or more changed files
2. **Line Count**: 100 or more changed lines
3. **Multiple Features**: Changes spanning 2 or more functional areas
4. **Mixed Patterns**: feat + fix + docs mixed together

```bash
# Change scale analysis
CHANGED_FILES=$(git diff HEAD --name-only | wc -l)
CHANGED_LINES=$(git diff HEAD --stat | tail -1 | grep -o '[0-9]\+ insertions\|[0-9]\+ deletions' | awk '{sum+=$1} END {print sum}')

if [ $CHANGED_FILES -ge 5 ] || [ $CHANGED_LINES -ge 100 ]; then
  echo "Large change detected: Split recommended"
fi
```

#### "Meaningful Minimal Unit" Split Strategy

##### 1. Split by Functional Boundaries

```bash
# Identify functional units from directory structure
git diff HEAD --name-only | cut -d'/' -f1-2 | sort | uniq
# → src/auth, src/api, components/ui etc.
```

##### 2. Separation by Change Type

```bash
# New files vs existing file modifications
git diff HEAD --name-status | grep '^A' # New files
git diff HEAD --name-status | grep '^M' # Modified files
git diff HEAD --name-status | grep '^D' # Deleted files
```

##### 3. Dependency Analysis

```bash
# Detect import relationship changes
git diff HEAD | grep -E '^[+-].*import|^[+-].*require' | \
cut -d' ' -f2- | sort | uniq
```

#### File-level Detailed Analysis

```bash
# Get list of changed files
git diff HEAD --name-only

# Analyze change content for each file individually
git diff HEAD -- <file>

# Determine file change type
git diff HEAD --name-status | while read status file; do
  case $status in
    A) echo "$file: New creation" ;;
    M) echo "$file: Modification" ;;
    D) echo "$file: Deletion" ;;
    R*) echo "$file: Rename" ;;
  esac
done
```

#### Logical Grouping Criteria

1. **Functional Unit**: Files related to same functionality
   - Files under `src/auth/` → Authentication feature
   - Files under `components/` → UI components

2. **Change Type**: Same type of changes
   - Test files only → `test:`
   - Documentation only → `docs:`
   - Configuration files only → `chore:`

3. **Dependencies**: Mutually related files
   - Model + Migration
   - Component + Style

4. **Change Scale**: Maintain appropriate commit size
   - 10 files or less per commit
   - Group files with high relatedness

### Output Example

```bash
$ /semantic-commit

Analyzing changes...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Detected changes:
• src/auth/login.ts (modified)
• src/auth/register.ts (new)
• src/auth/types.ts (modified)
• tests/auth.test.ts (new)
• docs/authentication.md (new)

Proposed commit splits:

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit 1/3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: feat: implement user registration and login system
Included files:
  • src/auth/login.ts
  • src/auth/register.ts  
  • src/auth/types.ts

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit 2/3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: test: add comprehensive tests for authentication system
Included files:
  • tests/auth.test.ts

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit 3/3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: docs: add authentication system documentation
Included files:
  • docs/authentication.md

Execute commits with this split plan? (y/n/edit): 
```

### Execution Options

- `y` : Execute with proposed commit split
- `n` : Cancel
- `edit` : Edit commit messages individually
- `merge <number 1> <number 2>` : Merge specified commits
- `split <number>` : Further split specified commit

### Dry Run Mode

```bash
$ /semantic-commit --dry-run

Analyzing changes... (DRY RUN)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Display commit split proposal]

ℹ️  DRY RUN mode: No actual commits will be executed
💡 To execute, re-run without --dry-run option
```

### Smart Analysis Features

#### 1. Project Structure Understanding

- Determine project type from `package.json`, `Cargo.toml`, `pom.xml` etc.
- Infer functional units from folder structure

#### 2. Change Pattern Recognition

```bash
# Bug fix pattern detection
- "fix", "bug", "error" keywords
- Exception handling additions
- Conditional branch corrections

# New feature pattern detection  
- New file creation
- New method additions
- API endpoint additions
```

#### 3. Dependency Analysis

- Import statement changes
- Type definition additions/modifications
- Configuration file relationships

### Technical Implementation

#### Sequential Commit Implementation with Standard Git Commands

##### 1. Preprocessing: Save Current State

```bash
# Reset unstaged changes if any
git reset HEAD
git status --porcelain > /tmp/original_state.txt

# Confirm working branch
CURRENT_BRANCH=$(git branch --show-current)
echo "Working branch: $CURRENT_BRANCH"
```

##### 2. Group-wise Sequential Commit Execution

```bash
# Load split plan
while IFS= read -r commit_plan; do
  group_num=$(echo "$commit_plan" | cut -d':' -f1)
  files=$(echo "$commit_plan" | cut -d':' -f2- | tr ' ' '\n')
  
  echo "=== Executing Commit $group_num ==="
  
  # Stage only relevant files
  echo "$files" | while read file; do
    if [ -f "$file" ]; then
      git add "$file"
      echo "Staging: $file"
    fi
  done
  
  # Confirm staging state
  staged_files=$(git diff --staged --name-only)
  if [ -z "$staged_files" ]; then
    echo "Warning: No staged files"
    continue
  fi
  
  # Generate commit message (LLM analysis)
  commit_msg=$(generate_commit_message_for_staged_files)
  
  # User confirmation
  echo "Proposed commit message: $commit_msg"
  echo "Staged files:"
  echo "$staged_files"
  read -p "Execute this commit? (y/n): " confirm
  
  if [ "$confirm" = "y" ]; then
    # Execute commit
    git commit -m "$commit_msg"
    echo "✅ Commit $group_num completed"
  else
    # Cancel staging
    git reset HEAD
    echo "❌ Commit $group_num skipped"
  fi
  
done < /tmp/commit_plan.txt
```

##### 3. Error Handling and Rollback

```bash
# Pre-commit hook failure handling
commit_with_retry() {
  local commit_msg="$1"
  local max_retries=2
  local retry_count=0
  
  while [ $retry_count -lt $max_retries ]; do
    if git commit -m "$commit_msg"; then
      echo "✅ Commit successful"
      return 0
    else
      echo "❌ Commit failed (attempt $((retry_count + 1))/$max_retries)"
      
      # Incorporate auto-fixes from pre-commit hooks
      if git diff --staged --quiet; then
        echo "Changes auto-fixed by pre-commit hooks"
        git add -u
      fi
      
      retry_count=$((retry_count + 1))
    fi
  done
  
  echo "❌ Commit failed. Please check manually."
  return 1
}

# Recovery from interruption
resume_from_failure() {
  echo "Detected interrupted commit process"
  echo "Current staging state:"
  git status --porcelain
  
  read -p "Continue processing? (y/n): " resume
  if [ "$resume" = "y" ]; then
    # Resume from last commit position
    last_commit=$(git log --oneline -1 --pretty=format:"%s")
    echo "Last commit: $last_commit"
  else
    # Complete reset
    git reset HEAD
    echo "Process reset"
  fi
}
```

##### 4. Post-completion Verification

```bash
# Confirm all changes are committed
remaining_changes=$(git status --porcelain | wc -l)
if [ $remaining_changes -eq 0 ]; then
  echo "✅ All changes committed"
else
  echo "⚠️  Uncommitted changes remain:"
  git status --short
fi

# Display commit history
echo "Created commits:"
git log --oneline -n 10 --graph
```

##### 5. Automatic Push Suppression

```bash
# Note: No automatic push
echo "📝 Note: Automatic push not executed"
echo "Push manually if needed with:"
echo "  git push origin $CURRENT_BRANCH"
```

### Conventional Commits Compliance

#### Basic Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Standard Types

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

#### Scope (Optional)

Indicates scope of change impact:

```
feat(api): add user authentication endpoint
fix(ui): resolve button alignment issue
docs(readme): update installation instructions
```

#### Breaking Change

For breaking API changes:

```
feat!: change user API response format

BREAKING CHANGE: user response now includes additional metadata
```

Or

```
feat(api)!: change authentication flow
```

### Prerequisites

- Execute within Git repository
- Uncommitted changes must exist
- Staged changes will be temporarily reset

### Important Notes

- **No automatic push**: Manual `git push` required after commits
- **No branch creation**: Commits on current branch
- **Backup recommended**: Use `git stash` for backup before important changes

### Best Practices

1. **Project Convention Respect**: Follow existing settings and patterns
2. **Small Change Units**: One commit for one logical change
3. **Clear Messages**: Make changes clearly identifiable
4. **Relationship Focus**: Group functionally related files
5. **Test Separation**: Separate test files into different commits
6. **Configuration File Usage**: Introduce CommitLint for team-wide convention consistency