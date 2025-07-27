# PR Feedback

Efficiently address Pull Request review comments and achieve root resolution through 3-stage error analysis approach.

## Usage

```bash
/pr-feedback [options]
```

## Options

- `--pr <number>` : Specify PR number (auto-detect current branch if omitted)
- `--category <type>` : Filter comments by category (must/imo/nits/q)
- `--priority` : Sort by priority order

## Basic Examples

```bash
# Execute comment classification
gh pr view 123 --comments | head -20
"Please classify review comments into must/imo/nits/q and determine action order"

# Collect error information
npm run build 2>&1 | tee error.log
"Please identify root cause of build errors and suggest appropriate fixes"

# Verify fix implementation
git diff HEAD~1
"Please evaluate if this fix properly resolves the review concerns"
```

## Comment Classification System

```
🔴 must: Fix required
├─ Security issues
├─ Functional bugs
├─ Design principle violations
└─ Convention violations

🟡 imo: Improvement suggestions
├─ Better implementation methods
├─ Performance improvements
├─ Readability enhancements
└─ Refactoring proposals

🟢 nits: Minor issues
├─ Typo fixes
├─ Indentation adjustments
├─ Comment additions
└─ Minor naming adjustments

🔵 q: Questions & confirmations
├─ Implementation intent confirmation
├─ Specification clarification
├─ Design decision background
└─ Alternative consideration
```

## 3-Stage Error Analysis Approach

### Stage 1: Information Gathering

**Required Execution**

- Complete error message retrieval
- Stack trace verification
- Reproduction condition identification

**Recommended Execution**

- Environment information collection
- Recent change history
- Related log verification

### Stage 2: Root Cause Analysis

- Apply 5 Whys analysis
- Track dependencies
- Check environment differences
- Create minimal reproduction code

### Stage 3: Solution Implementation

- Immediate response (hotfix)
- Fundamental solution (core fix)
- Prevention measures (recurrence prevention)

## Response Flow

1. **Comment Analysis**: Classification by priority
2. **Fix Planning**: Determine response order
3. **Staged Fixes**: Critical → High → Medium → Low
4. **Quality Check**: Test, lint, build
5. **Progress Report**: Specific explanation of fixes

## Post-Fix Verification

```bash
# Basic checks
npm test
npm run lint
npm run build

# Regression tests
npm run test:e2e

# Code quality
npm run test:coverage
```

## Reply Templates

**Fix Completion Report**

```markdown
@reviewer Thank you for the feedback.
Fixes completed:

- [Specific fix details]
- [Test results]
- [Verification method]
```

**Technical Decision Explanation**

```markdown
Implementation background: [Reason]
Alternatives considered: [Options and decision rationale]
Benefits of adopted approach: [Advantages]
```

## Important Notes

- **Priority Adherence**: Respond in order Critical → High → Medium → Low
- **Test First**: Check regression tests before fixes
- **Clear Reporting**: Describe fix details and verification methods specifically
- **Constructive Dialogue**: Polite communication based on technical rationale