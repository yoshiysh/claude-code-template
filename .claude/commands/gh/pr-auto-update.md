# PR Auto Update

## Overview

Command to automatically update Pull Request descriptions and labels by analyzing Git changes. Analyzes change content to generate and set appropriate descriptions and labels.

## Usage

```bash
/pr-auto-update [options] [PR number]
```

### Options

- `--pr <number>` : Specify target PR number (auto-detect from current branch if omitted)
- `--description-only` : Update description only (don't change labels)
- `--labels-only` : Update labels only (don't change description)
- `--dry-run` : Show generated content without actual update
- `--lang <language>` : Specify language (ja, en)

### Basic Examples

```bash
# Auto-update current branch's PR
/pr-auto-update

# Update specific PR
/pr-auto-update --pr 1234

# Update description only
/pr-auto-update --description-only

# Dry run to preview
/pr-auto-update --dry-run
```

## Feature Details

### 1. Automatic PR Detection

Auto-detect corresponding PR from current branch:

```bash
# Search PR from branch
gh pr list --head $(git branch --show-current) --json number,title,url
```

### 2. Change Analysis

Collect and analyze the following information:

- **File Changes**: Added, deleted, and modified files
- **Code Analysis**: Changes in import statements, function definitions, class definitions
- **Tests**: Presence and content of test files
- **Documentation**: Updates to README, docs
- **Configuration**: Changes to package.json, pubspec.yaml, config files
- **CI/CD**: Changes to GitHub Actions, workflows

### 3. Automatic Description Generation

#### Template Processing Priority

1. **Existing PR Description**: **Fully preserve** already written content
2. **Project Template**: Get structure from `@COMMIT_AND_PR_GUIDELINES.md`
3. **Default Template**: Fallback when above doesn't exist

#### Existing Content Preservation Rules

**Important**: Do not modify existing content

- Preserve written sections
- Only fill empty sections
- Preserve functional comments (like Copilot review rules)

#### Using Project Template

```bash
# Parse @COMMIT_AND_PR_GUIDELINES.md structure
parse_template_structure() {
  local template_file="$1"
  
  if [ -f "$template_file" ]; then
    # Extract section structure
    grep -E '^##|^###' "$template_file"
    
    # Identify comment placeholders
    grep -E '<!--.*-->' "$template_file"
    
    # Fully preserve existing template structure
    cat "$template_file"
  fi
}
```

### 4. Automatic Label Setting

#### Label Acquisition System

**Priority Order**:

1. **`.github/labels.yml`**: Get from project-specific label definitions
2. **GitHub API**: Get existing labels with `gh api repos/{OWNER}/{REPO}/labels --jq '.[].name'`

#### Auto-Detection Rules

**File Pattern Based**:

- Documentation: `*.md`, `README`, `docs/` → Labels containing `documentation|docs|doc`
- Tests: `test`, `spec` → Labels containing `test|testing`
- CI/CD: `.github/`, `*.yml`, `Dockerfile` → Labels containing `ci|build|infra|ops`
- Dependencies: `package.json`, `pubspec.yaml`, `requirements.txt` → Labels containing `dependencies|deps`

**Change Content Based**:

- Bug fixes: `fix|bug|error|crash` → Labels containing `bug|fix`
- New features: `feat|feature|add|implement` → Labels containing `feature|enhancement|feat`
- Refactoring: `refactor|clean` → Labels containing `refactor|cleanup|clean`
- Performance: `performance|perf|optimize` → Labels containing `performance|perf`
- Security: `security|secure` → Labels containing `security`

#### Constraints

- **Maximum 3 labels**: Upper limit for auto-selected labels
- **Existing labels only**: Prohibited to create new labels
- **Partial match**: Determined by whether keywords are contained in label names

### 5. Execution Flow

```bash
#!/bin/bash

# 1. PR Detection & Retrieval
detect_pr() {
  if [ -n "$PR_NUMBER" ]; then
    echo $PR_NUMBER
  else
    gh pr list --head $(git branch --show-current) --json number --jq '.[0].number'
  fi
}

# 2. Change Analysis
analyze_changes() {
  local pr_number=$1
  
  # Get file changes
  gh pr diff $pr_number --name-only
  
  # Content analysis
  gh pr diff $pr_number | head -1000
}

# 3. Description Generation
generate_description() {
  local pr_number=$1
  local changes=$2
  
  # Get current PR description
  local current_body=$(gh pr view $pr_number --json body --jq -r .body)
  
  # Use existing content if available
  if [ -n "$current_body" ]; then
    echo "$current_body"
  else
    # Generate from template
    local template_file="@COMMIT_AND_PR_GUIDELINES.md"
    if [ -f "$template_file" ]; then
      generate_from_template "$(cat "$template_file")" "$changes"
    else
      generate_from_template "" "$changes"
    fi
  fi
}

# Generate from template
generate_from_template() {
  local template="$1"
  local changes="$2"
  
  if [ -n "$template" ]; then
    # Use template as-is (preserve HTML comments)
    echo "$template"
  else
    # Generate with default format
    echo "## What does this change?"
    echo ""
    echo "$changes"
  fi
}

# 4. Label Determination
determine_labels() {
  local changes=$1
  local file_list=$2
  local pr_number=$3
  
  # Get available labels
  local available_labels=()
  if [ -f ".github/labels.yml" ]; then
    # Extract label names from labels.yml
    available_labels=($(grep "^- name:" .github/labels.yml | sed "s/^- name: '\?\([^']*\)'\?/\1/"))
  else
    # Get labels from GitHub API
    local repo_info=$(gh repo view --json owner,name)
    local owner=$(echo "$repo_info" | jq -r .owner.login)
    local repo=$(echo "$repo_info" | jq -r .name)
    available_labels=($(gh api "repos/$owner/$repo/labels" --jq '.[].name'))
  fi
  
  local suggested_labels=()
  
  # Generic pattern matching
  analyze_change_patterns "$file_list" "$changes" available_labels suggested_labels
  
  # Limit to maximum 3
  echo "${suggested_labels[@]:0:3}"
}

# 5. PR Update
update_pr() {
  local pr_number=$1
  local description="$2"
  local labels="$3"
  
  if [ "$DRY_RUN" = "true" ]; then
    echo "=== DRY RUN ==="
    echo "Description:"
    echo "$description"
    echo "Labels: $labels"
  else
    # Get repository information
    local repo_info=$(gh repo view --json owner,name)
    local owner=$(echo "$repo_info" | jq -r .owner.login)
    local repo=$(echo "$repo_info" | jq -r .name)
    
    # Update body using GitHub API (preserve HTML comments)
    gh api \
      --method PATCH \
      "/repos/$owner/$repo/pulls/$pr_number" \
      --field body="$description"
    
    # Labels can use normal gh command
    if [ -n "$labels" ]; then
      gh pr edit $pr_number --add-label "$labels"
    fi
  fi
}
```

## Configuration File (Future Extension)

`~/.claude/pr-auto-update.config`:

```json
{
  "language": "en",
  "max_labels": 3
}
```

## Common Patterns

### Flutter Project

```markdown
## What does this change?

Implemented {feature name} to solve users' {issue}.

### Main Changes

- **UI Implementation**: Created new {screen name}
- **State Management**: Added Riverpod providers
- **API Integration**: Implemented GraphQL queries and mutations
- **Testing**: Added widget tests and unit tests

### Technical Specifications

- **Architecture**: {pattern used}
- **Dependencies**: {newly added packages}
- **Performance**: {optimization details}
```

### Node.js Project

```markdown
## What does this change?

Implemented {API name} endpoint to support {use case}.

### Main Changes

- **API Implementation**: Created new {endpoint}
- **Validation**: Added request validation logic
- **Database**: Implemented operations on {table name}
- **Testing**: Added integration tests and unit tests

### Security

- **Authentication**: JWT token verification
- **Authorization**: Role-based access control
- **Input Validation**: SQL injection prevention
```

## Important Notes

1. **Complete Preservation of Existing Content**:
   - Do not change **a single character** of already written content
   - Only fill empty comment sections and placeholders
   - Respect content intentionally written by users

2. **Template Priority**:
   - Existing PR description > `@COMMIT_AND_PR_GUIDELINES.md` > Default
   - Fully preserve project-specific template structure

3. **Label Constraints**:
   - Prioritize `.github/labels.yml` if exists
   - Get existing labels from GitHub API if not
   - Prohibited to create new labels
   - Maximum 3 auto-selected labels

4. **Safe Updates**:
   - Recommend using `--dry-run` for preview
   - Show warnings for changes containing sensitive information
   - Save original description as backup

5. **Consistency Maintenance**:
   - Match existing PR style in project
   - Unify language (Japanese/English)
   - Inherit labeling conventions

## Troubleshooting

### Common Issues

1. **PR not found**: Check branch name and PR association
2. **Permission error**: Check GitHub CLI authentication status
3. **Cannot set labels**: Check repository permissions
4. **HTML comments escaped**: GitHub CLI converts `<!-- -->` to `&lt;!-- --&gt;`

### GitHub CLI HTML Comment Escaping Issue

**Important**: GitHub CLI (`gh pr edit`) auto-escapes HTML comments and may inject invalid strings like `EOF < /dev/null` through shell redirect processing.

#### Fundamental Solutions

1. **Use GitHub API --field option**: Proper escape processing with `--field`
2. **Simplify shell processing**: Avoid complex redirects and pipe processing
3. **Simplify template processing**: Eliminate HTML comment removal and preserve completely
4. **Proper JSON escaping**: Handle special characters correctly

### Debug Options

```bash
# Verbose log output (to be added during implementation)
/pr-auto-update --verbose
```