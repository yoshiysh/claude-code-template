# Performance Analysis

Analyze application performance issues and propose improvements from a technical debt perspective.

## Usage

```bash
# Comprehensive performance issue analysis
find . -name "*.js" -o -name "*.ts" | xargs wc -l | sort -rn | head -10
"Identify large files and performance issues, provide improvement suggestions"

# Detect inefficient code patterns
grep -r "for.*await\|forEach.*await" . --include="*.js"
"Analyze N+1 query problems and performance bottlenecks"

# Potential memory leaks
grep -r "addEventListener\|setInterval" . --include="*.js" | grep -v "removeEventListener\|clearInterval"
"Evaluate memory leak risks and countermeasures"
```

## Basic Examples

```bash
# Bundle size and load time
npm ls --depth=0 && find ./public -name "*.js" -o -name "*.css" | xargs ls -lh
"Identify bundle size and asset optimization improvements"

# Database performance
grep -r "SELECT\|findAll\|query" . --include="*.js" | head -20
"Analyze database query optimization points"

# Dependency performance impact
npm outdated && npm audit
"Evaluate the performance impact of outdated dependencies"
```

## Analysis Perspectives

### 1. Code-Level Issues

- **O(n²) Algorithms**: Detect inefficient array operations
- **Synchronous I/O**: Identify blocking processes
- **Duplicate Processing**: Remove unnecessary calculations and requests
- **Memory Leaks**: Manage event listeners and timers

### 2. Architecture-Level Issues

- **N+1 Queries**: Database access patterns
- **Lack of Caching**: Repeated calculations or API calls
- **Bundle Size**: Unnecessary libraries or code splitting
- **Resource Management**: Connection pools and thread usage

### 3. Technical Debt Impact

- **Legacy Code**: Performance degradation from old implementations
- **Design Issues**: High coupling due to poor responsibility distribution
- **Lack of Testing**: Missing performance regression detection
- **Monitoring Gaps**: Poor early problem detection systems

## Improvement Priority

```
🔴 Critical: System failure risk
├─ Memory leaks (server crashes)
├─ N+1 queries (database load)
└─ Synchronous I/O (response delays)

🟡 High: User experience impact
├─ Bundle size (initial load time)
├─ Image optimization (display speed)
└─ Cache strategy (response time)

🟢 Medium: Operational efficiency
├─ Dependency updates (security)
├─ Code duplication (maintainability)
└─ Enhanced monitoring (operational overhead)
```

## Measurement and Tools

### Node.js / JavaScript

```bash
# Profiling
node --prof app.js
clinic doctor -- node app.js

# Bundle analysis
npx webpack-bundle-analyzer
lighthouse --chrome-flags="--headless"
```

### Database

```sql
-- Query analysis
EXPLAIN ANALYZE SELECT ...
SHOW SLOW LOG;
```

### Frontend

```bash
# React performance
grep -r "useMemo\|useCallback" . --include="*.jsx"

# Resource analysis
find ./src -name "*.png" -o -name "*.jpg" | xargs ls -lh
```

## Continuous Improvement

- **Regular Audits**: Weekly performance test execution
- **Metrics Collection**: Track response times and memory usage
- **Alert Setup**: Automatic notifications for threshold violations
- **Team Sharing**: Document improvement cases and anti-patterns

## Performance Optimization Techniques

### Code Optimization

1. **Algorithm Efficiency**
   - Replace O(n²) with O(n log n) or O(n) algorithms
   - Use appropriate data structures (Map, Set, etc.)
   - Implement efficient search and sort operations

2. **Asynchronous Programming**
   - Convert synchronous operations to async/await
   - Use Promise.all() for parallel processing
   - Implement proper error handling in async flows

3. **Memory Management**
   - Clean up event listeners and timers
   - Avoid memory leaks in closures
   - Use weak references where appropriate

### Database Optimization

1. **Query Optimization**
   - Add appropriate indexes
   - Use query execution plans
   - Implement pagination for large datasets

2. **Connection Management**
   - Use connection pooling
   - Optimize connection timeouts
   - Monitor active connections

### Frontend Optimization

1. **Bundle Optimization**
   - Implement code splitting
   - Use dynamic imports
   - Remove unused dependencies

2. **Asset Optimization**
   - Compress images and videos
   - Use modern image formats (WebP, AVIF)
   - Implement lazy loading

## Monitoring and Alerts

### Key Metrics

- **Response Time**: API and page load times
- **Memory Usage**: Heap size and garbage collection
- **CPU Utilization**: Process and system load
- **Database Performance**: Query execution times
- **Error Rates**: Application and system errors

### Alert Thresholds

```yaml
alerts:
  response_time:
    warning: 500ms
    critical: 2000ms
  memory_usage:
    warning: 80%
    critical: 95%
  error_rate:
    warning: 1%
    critical: 5%
```

## Best Practices

1. **Performance Budget**: Set and maintain performance budgets
2. **Regular Testing**: Automated performance testing in CI/CD
3. **Profiling**: Regular performance profiling sessions
4. **Documentation**: Document performance optimizations
5. **Team Training**: Performance awareness and best practices