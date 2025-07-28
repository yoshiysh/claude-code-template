## Refactor

Performs safe and incremental code refactoring while evaluating adherence to SOLID principles.

### Usage

```bash
# Identify complex code and plan refactoring
find . -name "*.js" -exec wc -l {} + | sort -rn | head -10
"Please refactor large files to reduce complexity"

# Detect and consolidate duplicate code
grep -r "function processUser" . --include="*.js"
"Please consolidate duplicate functions using Extract Method"

# Detect SOLID principle violations
grep -r "class.*Service" . --include="*.js" | head -10
"Please evaluate whether these classes follow the single responsibility principle"
```

### Basic Examples

```bash
# Detect long methods
grep -A 50 "function" src/*.js | grep -B 50 -A 50 "return" | wc -l
"Please split methods over 50 lines using Extract Method"

# Conditional complexity
grep -r "if.*if.*if" . --include="*.js"
"Please improve nested conditionals with Strategy pattern"

# Detect code smells
grep -r "TODO\|FIXME\|HACK" . --exclude-dir=node_modules
"Please resolve comments that have become technical debt"
```

### Refactoring Techniques

#### Extract Method

```javascript
// Before: 長大なメソッド
function processOrder(order) {
  // 50 行の複雑な処理
}

// After: 責任分離
function processOrder(order) {
  validateOrder(order);
  calculateTotal(order);
  saveOrder(order);
}
```

#### Replace Conditional with Polymorphism

```javascript
// Before: switch 文
function getPrice(user) {
  switch (user.type) {
    case 'premium': return basPrice * 0.8;
    case 'regular': return basePrice;
  }
}

// After: Strategy パターン
class PremiumPricing {
  calculate(basePrice) { return basePrice * 0.8; }
}
```

### SOLID Principles Check

```
S - Single Responsibility
├─ Each class has a single responsibility
├─ Reasons for change limited to one
└─ Clear responsibility boundaries

O - Open/Closed
├─ Open for extension
├─ Closed for modification
└─ Protect existing code when adding new features

L - Liskov Substitution
├─ Derived class substitutability
├─ Contract compliance
└─ Maintain expected behavior

I - Interface Segregation
├─ Appropriate interface granularity
├─ Avoid dependencies on unused methods
└─ Role-specific interface definitions

D - Dependency Inversion
├─ Depend on abstractions
├─ Separate from concrete implementations
└─ Utilize dependency injection
```

### Refactoring Process

1. **Current State Analysis**
   - Complexity measurement (cyclomatic complexity)
   - Duplicate code detection
   - Dependency relationship analysis

2. **Incremental Execution**
   - Small steps (15-30 minute units)
   - Test execution after each change
   - Frequent commits

3. **Quality Verification**
   - Maintain test coverage
   - Performance measurement
   - Code review

### Common Code Smells

- **God Object**: Classes with excessive responsibilities
- **Long Method**: Methods exceeding 50 lines
- **Duplicate Code**: Repeated logic
- **Large Class**: Classes exceeding 300 lines
- **Long Parameter List**: 4 or more parameters

### Automation Support

```bash
# Static analysis
npx complexity-report src/
sonar-scanner

# Code formatting
npm run lint:fix
prettier --write src/

# Test execution
npm test
npm run test:coverage
```

### Important Notes

- **Prohibit Feature Changes**: Do not change external behavior
- **Test First**: Add tests before refactoring
- **Incremental Approach**: Avoid large changes at once
- **Continuous Verification**: Run tests at each step
