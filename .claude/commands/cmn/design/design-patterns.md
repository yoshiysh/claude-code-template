## Design Patterns

コードベースに適用可能なデザインパターンを提案し、SOLID 原則の遵守状況を評価します。

### 使い方

```bash
/design-patterns [分析対象] [オプション]
```

### オプション

- `--suggest` : 適用可能なパターンを提案（デフォルト）
- `--analyze` : 既存パターンの使用状況を分析
- `--refactor` : リファクタリング案を生成
- `--solid` : SOLID 原則の遵守状況をチェック
- `--anti-patterns` : アンチパターンを検出

### 基本例

```bash
# プロジェクト全体のパターン分析
/design-patterns

# 特定ファイルへのパターン提案
/design-patterns src/services/user.js --suggest

# SOLID 原則チェック
/design-patterns --solid

# アンチパターン検出
/design-patterns --anti-patterns
```

### 分析カテゴリ

#### 1. 生成に関するパターン

- **Factory Pattern**: オブジェクト生成の抽象化
- **Builder Pattern**: 複雑なオブジェクトの段階的構築
- **Singleton Pattern**: インスタンスの一意性保証
- **Prototype Pattern**: オブジェクトのクローン生成

#### 2. 構造に関するパターン

- **Adapter Pattern**: インターフェースの変換
- **Decorator Pattern**: 機能の動的追加
- **Facade Pattern**: 複雑なサブシステムの簡略化
- **Proxy Pattern**: オブジェクトへのアクセス制御

#### 3. 振る舞いに関するパターン

- **Observer Pattern**: イベント通知の実装
- **Strategy Pattern**: アルゴリズムの切り替え
- **Command Pattern**: 操作のカプセル化
- **Iterator Pattern**: コレクションの走査

### SOLID 原則チェック項目

```
S - Single Responsibility Principle (単一責任の原則)
O - Open/Closed Principle (開放閉鎖の原則)
L - Liskov Substitution Principle (リスコフの置換原則)
I - Interface Segregation Principle (インターフェース分離の原則)
D - Dependency Inversion Principle (依存性逆転の原則)
```

### Output Example

```
Design Pattern Analysis Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Currently Used Patterns
├─ Observer Pattern: EventEmitter (12 locations)
├─ Factory Pattern: UserFactory (3 locations)
├─ Singleton Pattern: DatabaseConnection (1 location)
└─ Strategy Pattern: PaymentProcessor (5 locations)

Recommended Patterns
├─ [HIGH] Repository Pattern
│  └─ Target: src/models/*.js
│  └─ Reason: Data access logic separation
│  └─ Example:
│      class UserRepository {
│        async findById(id) { ... }
│        async save(user) { ... }
│      }
│
├─ [MED] Command Pattern
│  └─ Target: src/api/handlers/*.js
│  └─ Reason: Request processing unification
│
└─ [LOW] Decorator Pattern
   └─ Target: src/middleware/*.js
   └─ Reason: Function combination improvement

SOLID Principle Violations
├─ [S] UserService: Handles both authentication and authorization
├─ [O] PaymentGateway: Requires modification when adding new payment methods
├─ [D] EmailService: Direct dependency on concrete classes
└─ [I] IDataStore: Contains unused methods

Refactoring Suggestions
1. Split UserService into authentication and authorization
2. Introduce PaymentStrategy interface
3. Define EmailService interface
4. Separate IDataStore by usage
```

### 高度な使用例

```bash
# パターン適用の影響分析
/design-patterns --impact-analysis Repository

# 特定パターンの実装例生成
/design-patterns --generate Factory --for src/models/Product.js

# パターンの組み合わせ提案
/design-patterns --combine --context "API with caching"

# アーキテクチャパターンの評価
/design-patterns --architecture MVC
```

### Pattern Application Example

#### Before (Problematic Code)

```javascript
class OrderService {
  processOrder(order, paymentType) {
    if (paymentType === "credit") {
      // Credit card processing
    } else if (paymentType === "paypal") {
      // PayPal processing
    }
    // Other payment methods...
  }
}
```

#### After (Strategy Pattern Applied)

```javascript
// Strategy interface
class PaymentStrategy {
  process(amount) {
    throw new Error("Must implement process method");
  }
}

// Concrete strategy
class CreditCardPayment extends PaymentStrategy {
  process(amount) {
    /* implementation */
  }
}

// Context
class OrderService {
  constructor(paymentStrategy) {
    this.paymentStrategy = paymentStrategy;
  }

  processOrder(order) {
    this.paymentStrategy.process(order.total);
  }
}
```

### アンチパターン検出

- **God Object**: 過度に多くの責務を持つクラス
- **Spaghetti Code**: 制御フローが複雑に絡み合ったコード
- **Copy-Paste Programming**: 重複コードの過度な使用
- **Magic Numbers**: ハードコードされた定数
- **Callback Hell**: 深くネストしたコールバック

### ベストプラクティス

1. **段階的適用**: 一度に多くのパターンを適用しない
2. **必要性の検証**: パターンは問題解決の手段であり目的ではない
3. **チーム合意**: パターン適用前にチームで議論
4. **ドキュメント化**: 適用したパターンの意図を記録
