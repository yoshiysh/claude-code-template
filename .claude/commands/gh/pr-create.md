# PR Create

Efficient Pull Request workflow through automatic PR creation based on Git change analysis.

## Usage

```bash
# Automatic PR creation through change analysis
git add . && git commit -m "feat: implement user authentication feature"
"Please analyze the changes and create a Draft PR with appropriate description and labels"

# Update preserving existing template
cp .github/PULL_REQUEST_TEMPLATE.md pr_body.md
"Please preserve template structure completely and fill in the changes"

# Gradual quality improvement
gh pr ready
"Please change to Ready for Review after quality confirmation"
```

## Basic Examples

```bash
# 1. Branch creation and commit
git checkout main && git pull
git checkout -b feat-user-profile
git add . && git commit -m "feat: implement user profile feature"
git push -u origin feat-user-profile

# 2. PR creation
"Please create PR with following steps:
1. Check changes with git diff --cached
2. Create description using .github/PULL_REQUEST_TEMPLATE.md
3. Select up to 3 appropriate labels from change content
4. Create as Draft PR (preserve HTML comments)"

# 3. Ready after CI confirmation
"Please change PR to Ready for Review after CI passes"
```

## Execution Steps

### 1. Branch Creation

```bash
# Naming convention following guidelines: {type}-{subject}
git checkout main
git pull
git checkout -b feat-user-authentication

# Verify branch (display current branch name)
git branch --show-current
```

### 2. Commit

```bash
# Stage changes
git add .

# Commit message following guidelines
git commit -m "feat: implement user authentication API"
```

### 3. Push to Remote

```bash
# Initial push (set upstream)
git push -u origin feat-user-authentication

# Subsequent pushes
git push
```

#### 4. Automatic Draft PR Creation through Analysis

##### Step 1: Change Content Analysis

```bash
# Get file changes (check staged changes)
git diff --cached --name-only

# Content analysis (max 1000 lines)
git diff --cached | head -1000
```

##### Step 2: Automatic Description Generation

```bash
# Template processing priority
# 1. Existing PR description (complete preservation)
# 2. .github/PULL_REQUEST_TEMPLATE.md
# 3. Default template

cp .github/PULL_REQUEST_TEMPLATE.md pr_body.md
# Fill only empty sections while preserving HTML comments and dividers
```

##### Step 3: Automatic Label Selection

```bash
# Get available labels (non-interactive)
"Get available labels from .github/labels.yml or GitHub repository and automatically select appropriate labels based on change content"

# Automatic selection through pattern matching (max 3)
# - Documentation: *.md, docs/ → documentation|docs
# - Tests: test, spec → test|testing
# - Bug fixes: fix|bug → bug|fix
# - New features: feat|feature → feature|enhancement
```

##### Step 4: GitHub API PR Creation (HTML Comment Preservation)

```bash
# PR creation
"Create Draft PR with following information:
- Title: Auto-generated from commit message
- Description: Properly filled using .github/PULL_REQUEST_TEMPLATE.md
- Labels: Auto-selected from change content (max 3)
- Base branch: main
- HTML comments completely preserved"
```

##### Method B: GitHub MCP (Fallback)

```javascript
// PR creation with HTML comment preservation
mcp_github_create_pull_request({
  owner: 'organization',
  repo: 'repository',
  base: 'main',
  head: 'feat-user-authentication',
  title: 'feat: implement user authentication',
  body: prBodyContent, // Complete content including HTML comments
  draft: true,
  maintainer_can_modify: true,
});
```

### Automatic Label Selection System

#### File Pattern-based Detection

- **Documentation**: `*.md`, `README`, `docs/` → `documentation|docs|doc`
- **Tests**: `test`, `spec` → `test|testing`
- **CI/CD**: `.github/`, `*.yml`, `Dockerfile` → `ci|build|infra|ops`
- **Dependencies**: `package.json`, `pubspec.yaml` → `dependencies|deps`

#### Change Content-based Detection

- **Bug fixes**: `fix|bug|error|crash` → `bug|fix`
- **New features**: `feat|feature|add|implement` → `feature|enhancement|feat`
- **Refactoring**: `refactor|clean` → `refactor|cleanup|clean`
- **Performance**: `performance|perf|optimize` → `performance|perf`
- **Security**: `security|secure` → `security`

#### Constraints

- **Maximum 3**: Upper limit for auto-selection
- **Existing labels only**: No new label creation
- **Partial match**: Keyword containment-based detection

### Project Guidelines

#### Basic Principles

1. **Always start with Draft**: All PRs are created in Draft state
2. **Gradual quality improvement**: Phase 1 (Basic implementation) → Phase 2 (Add tests) → Phase 3 (Update documentation)
3. **Appropriate labels**: Always assign maximum 3 types of labels
4. **Template usage**: Always use `.github/PULL_REQUEST_TEMPLATE.md`
5. **Consistent formatting**: Follow project code style guidelines

#### Branch Naming Convention

```text
{type}-{subject}

Examples:
- feat-user-profile
- fix-login-error
- refactor-api-client
```

#### Commit Messages

```text
{type}: {description}

Examples:
- feat: implement user authentication API
- fix: resolve login error
- docs: update README
```

### Template Processing System

#### Processing Priority

1. **Existing PR Description**: **Complete preservation** of already written content
2. **Project Template**: Maintain `.github/PULL_REQUEST_TEMPLATE.md` structure
3. **Default Template**: When above doesn't exist

#### Existing Content Preservation Rules

- **No character changes**: To already written content
- **Fill empty sections only**: Fill placeholder parts with change content
- **Preserve functional comments**: Maintain `<!-- Copilot review rule -->` etc.
- **Preserve HTML comments**: Complete preservation of `<!-- ... -->`
- **Preserve dividers**: Maintain structure like `---`

#### HTML Comment Preservation Solutions

**Important**: GitHub CLI (`gh pr edit`) auto-escapes HTML comments and may inject invalid strings like `EOF < /dev/null` through shell processing.

**Fundamental Solutions**:

1. **Use GitHub API --field option**: Proper escape processing for HTML comment preservation
2. **Simplify template processing**: Avoid complex pipe processing and redirects
3. **Complete preservation approach**: Abolish HTML comment removal processing and completely preserve templates

### Review Comment Response

```bash
# Re-commit after changes
git add .
git commit -m "fix: address review feedback"
git push
```

### Important Notes

#### Importance of HTML Comment Preservation

- **GitHub CLI limitations**: `gh pr edit` escapes HTML comments, invalid string injection
- **Fundamental workaround**: Proper escape processing with GitHub API `--field` option
- **Complete template preservation**: Abolish HTML comment removal processing and completely maintain structure

#### Automation Constraints

- **No new labels**: Cannot create labels outside `.github/labels.yml` definitions
- **Maximum 3 labels**: Upper limit for auto-selection
- **Existing content priority**: Never change manually written content

#### Gradual Quality Improvement

- **Draft required**: All PRs start in Draft
- **CI confirmation**: Check status with `gh pr checks`
- **Ready transition**: Move to `gh pr ready` after quality confirmation
- **Complete template compliance**: Maintain project-specific structure
