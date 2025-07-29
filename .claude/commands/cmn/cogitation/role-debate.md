## Role Debate

A command that enables different specialized roles to debate, consider trade-offs, and derive optimal solutions.

### Usage

```bash
/role-debate <role1>,<role2> [topic]
/role-debate <role1>,<role2>,<role3> [topic]
```

### Basic Examples

```bash
# Security vs Performance trade-offs
/role-debate security,performance
"JWT token expiration settings"

# Usability vs Security balance
/role-debate frontend,security
"Two-factor authentication UX optimization"

# Technology selection discussion
/role-debate architect,mobile
"React Native vs Flutter selection"

# Three-way discussion
/role-debate architect,security,performance
"Microservices adoption feasibility"
```

### Debate Principles

#### Constructive Discussion Guidelines

- **Mutual Respect**: Honor other roles' expertise and perspectives
- **Evidence-Based**: Data and fact-driven arguments, not emotional responses
- **Solution-Oriented**: Aim for better solutions, not criticism for its own sake
- **Implementation-Focused**: Consider feasibility over theoretical ideals

#### Evidence Quality Requirements

- **Official Documentation**: Reference standards, guidelines, and official docs
- **Empirical Cases**: Specific citations of success/failure examples
- **Quantitative Assessment**: Numerical and metric-based comparisons when possible
- **Temporal Consideration**: Short, medium, and long-term impact evaluation

#### Debate Ethics

- **Integrity**: Acknowledge limitations within one's specialty area
- **Openness**: Flexibility toward new information and perspectives
- **Transparency**: Clearly state reasoning and assumptions
- **Accountability**: Include implementation risks in proposals

### Debate Process

#### Phase 1: Initial Position Statements

Each role independently presents their expert perspective

- Present recommended approaches
- Cite supporting standards and documentation
- Explain anticipated risks and challenges
- Define success metrics

#### Phase 2: Cross-Debate and Rebuttals

Inter-role cross-examination and debate

- Constructive criticism of other role proposals
- Highlight overlooked perspectives
- Clarify trade-offs
- Present alternative solutions

#### Phase 3: Compromise Exploration

Search for implementable solutions

- Evaluate importance of each perspective
- Explore Win-Win solutions
- Consider phased implementation approaches
- Develop risk mitigation strategies

#### Phase 4: Integrated Conclusions

Determine final recommendations

- Agreed-upon solutions
- Implementation roadmap
- Success metrics and measurement methods
- Future review points

### Output Format Examples

#### Two-Role Debate Example

```
Role Debate: Security vs Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Topic: JWT Token Expiration Configuration

Security Role's Position:
"I recommend a short expiration time of 15 minutes"

Evidence:
- OWASP JWT Security Cheat Sheet compliance
- Minimize damage window during token leakage
- Limit available time for attackers

Concerns:
- Long expiration times exponentially increase attack risk
- Compliance requirements (financial sector) mandate short periods

Success Metrics:
- Security incident rate < 0.1%
- Average attack detection time < 5 minutes

Performance Role's Counter-argument:
"I recommend a 2-hour expiration time"

Evidence:
- Reference to Google OAuth 2.0 Best Practices
- Avoid server load increase from frequent re-authentication
- Minimize user experience disruption (work interruption)

Concerns:
- 15-minute interval re-authentication increases API load 8x
- Frequent connection drops in mobile environments

Success Metrics:
- Maintain API response time < 200ms
- Server CPU usage < 60%

Cross-debate:
Security → Performance:
"Security breach business losses are far greater than server load.
Example: Equifax incident resulted in $700 million in losses"

Performance → Security:
"Can achieve both with refresh token mechanism.
Background updates ensure security without compromising UX"

Security → Performance:
"Refresh tokens are also attack targets. Proper implementation is prerequisite"

Performance → Security:
"Propose phased approach. Normal operations 30 minutes, sensitive operations 15 minutes"

Compromise Exploration:
Common Understanding:
- Need to balance user experience and security
- Flexible response based on risk levels
- Realistic consideration of implementation/operational costs

Win-Win Elements:
- Utilize refresh token mechanism
- Phased introduction of risk-based authentication
- Supplement with automatic logout functionality

Integrated Conclusion:
"30-minute expiration + refresh tokens + risk-based authentication"

Implementation Details:
1. Access tokens: 30-minute expiration
2. Refresh tokens: 7-day expiration
3. High-risk operations: Force re-authentication at 15 minutes
4. Automatic logout after 30 minutes of inactivity

Phased Implementation:
Weeks 1-2: Basic 30-minute token implementation
Weeks 3-4: Add refresh token mechanism
Month 2: Introduce risk-based authentication

Success Metrics:
- Security: Incident rate < 0.1%
- Performance: API load increase < 20%
- UX: User satisfaction > 85%

Future Reviews:
- 3 months later: Evaluate actual attack patterns and load conditions
- 6 months later: Consider migration to more sophisticated risk-based authentication
```

### Three-Role Debate Case

```
Role Debate: Architect vs Security vs Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Topic: Feasibility of Microservices Adoption

Architect Role's Position:
"Recommend phased microservices adoption"
Evidence: Domain boundary clarification, independent deployment, technology choice flexibility

Security Role's Concerns:
"Security complexity in inter-service communication"
Evidence: Management costs of API Gateway, mTLS, distributed authentication

Performance Role's Concerns:
"Increased latency from network communication"
Evidence: N+1 problems from internal API calls, distributed transactions

Three-way Debate:
Architect → Security: "Centralized management through API Gateway enables control"
Security → Architect: "Risk of becoming single point of failure"
Performance → Architect: "Service division granularity is critical"
...(debate continues)

Integrated Conclusion:
"Phased division by domain-driven design + security-first design"
```

### Effective Debate Patterns

### Technology Selection

```bash
/role-debate architect,performance
「データベース選択: PostgreSQL vs MongoDB」

/role-debate frontend,mobile
「UI フレームワーク: React vs Vue」

/role-debate security,architect
「認証方式: JWT vs Session Cookie」
```

### Design Decisions

```bash
/role-debate security,frontend
「ユーザー認証の UX 設計」

/role-debate performance,mobile
「データ同期戦略の最適化」

/role-debate architect,qa
「テスト戦略とアーキテクチャ設計」
```

### Trade-off Issues

```bash
/role-debate security,performance
「暗号化レベル vs 処理速度」

/role-debate frontend,performance
「リッチ UI vs ページ読み込み速度」

/role-debate mobile,security
「利便性 vs データ保護レベル」
```

### ロール別議論特性

#### 🔒 Security ロール

```yaml
議論スタンス:
  - 保守的アプローチ (リスク最小化)
  - 規則準拠重視 (標準からの逸脱に慎重)
  - 最悪ケース想定 (攻撃者視点)
  - 長期的影響重視 (技術的負債としてのセキュリティ)

典型的論点:
  - "セキュリティ vs 利便性" のトレードオフ
  - "コンプライアンス要件の必達"
  - "攻撃コスト vs 防御コストの比較"
  - "プライバシー保護の徹底"

論拠ソース:
  - OWASP ガイドライン
  - NIST フレームワーク
  - 業界標準 (ISO 27001, SOC 2)
  - 実際の攻撃事例・統計

議論での強み:
  - リスク評価の精度
  - 規制要件の知識
  - 攻撃手法への理解

注意すべき偏見:
  - 過度な保守性 (イノベーション阻害)
  - UX への配慮不足
  - 実装コストの軽視
```

#### ⚡ Performance ロール

```yaml
議論スタンス:
  - データ駆動判断 (測定ベース)
  - 効率性重視 (コスト対効果の最適化)
  - ユーザー体験優先 (体感速度重視)
  - 継続的改善 (段階的最適化)

典型的論点:
  - "パフォーマンス vs セキュリティ"
  - "最適化コスト vs 効果の投資対効果"
  - "現在 vs 将来のスケーラビリティ"
  - "ユーザー体験 vs システム効率"

論拠ソース:
  - Core Web Vitals メトリクス
  - ベンチマーク結果・統計
  - ユーザー行動への影響データ
  - 業界パフォーマンス標準

議論での強み:
  - 定量的評価能力
  - ボトルネック特定
  - 最適化手法の知識

注意すべき偏見:
  - セキュリティの軽視
  - 保守性への配慮不足
  - プレマチュアオプティマイゼーション
```

#### 🏗️ Architect ロール

```yaml
議論スタンス:
  - 長期視点重視 (システム進化への配慮)
  - バランス追求 (全体最適)
  - 段階的変更 (リスク管理)
  - 標準準拠 (実証済みパターン優先)

典型的論点:
  - "短期効率 vs 長期保守性"
  - "技術的負債 vs 開発速度"
  - "マイクロサービス vs モノリス"
  - "新技術採用 vs 安定性"

論拠ソース:
  - アーキテクチャパターン集
  - 設計原則 (SOLID, DDD)
  - 大規模システム事例
  - 技術進化のトレンド

議論での強み:
  - 全体俯瞰能力
  - 設計パターンの知識
  - 長期影響の予測

注意すべき偏見:
  - 過度な一般化
  - 新技術への保守性
  - 実装詳細への理解不足
```

#### 🎨 Frontend ロール

```yaml
議論スタンス:
  - ユーザー中心設計 (UX 最優先)
  - 包摂的アプローチ (多様性配慮)
  - 直感性重視 (学習コスト最小化)
  - アクセシビリティ標準 (WCAG 準拠)

典型的論点:
  - "ユーザビリティ vs セキュリティ"
  - "デザイン統一 vs プラットフォーム最適化"
  - "機能性 vs シンプルさ"
  - "パフォーマンス vs リッチな体験"

論拠ソース:
  - UX 研究・ユーザビリティテスト結果
  - アクセシビリティガイドライン
  - デザインシステム標準
  - ユーザー行動データ

議論での強み:
  - ユーザー視点の代弁
  - デザイン原則の知識
  - アクセシビリティ要件

注意すべき偏見:
  - 技術制約への理解不足
  - セキュリティ要件の軽視
  - パフォーマンス影響の過小評価
```

#### 📱 Mobile ロール

```yaml
議論スタンス:
  - プラットフォーム特化 (iOS/Android 差異考慮)
  - コンテキスト適応 (移動中・片手操作)
  - リソース制約 (バッテリー・メモリ・通信)
  - ストア準拠 (審査ガイドライン)

典型的論点:
  - "ネイティブ vs クロスプラットフォーム"
  - "オフライン対応 vs リアルタイム同期"
  - "バッテリー効率 vs 機能性"
  - "プラットフォーム統一 vs 最適化"

論拠ソース:
  - iOS HIG / Android Material Design
  - App Store / Google Play ガイドライン
  - モバイル UX 研究
  - デバイス性能統計

議論での強み:
  - モバイル特有制約の理解
  - プラットフォーム差異の知識
  - タッチインターフェース設計

注意すべき偏見:
  - Web プラットフォームへの理解不足
  - サーバーサイド制約の軽視
  - デスクトップ環境への配慮不足
```

#### 🔍 Analyzer ロール

```yaml
議論スタンス:
  - 証拠重視 (データファースト)
  - 仮説検証 (科学的アプローチ)
  - 構造的思考 (システム思考)
  - バイアス除去 (客観性追求)

典型的論点:
  - "相関関係 vs 因果関係"
  - "症状対症療法 vs 根本解決"
  - "仮説 vs 事実の区別"
  - "短期症状 vs 構造的問題"

論拠ソース:
  - 実測データ・ログ分析
  - 統計的手法・分析結果
  - システム思考理論
  - 認知バイアス研究

議論での強み:
  - 論理的分析能力
  - 証拠評価の客観性
  - 構造的問題の発見

注意すべき偏見:
  - 分析麻痺 (行動力不足)
  - 完璧主義 (実用性軽視)
  - データ万能主義
```

### 議論進行テンプレート

#### Phase 1: 立場表明テンプレート

```
【ロール名】の推奨案:
「[具体的な提案]」

根拠:
- [公式文書・標準への言及]
- [実証事例・データ]
- [専門分野の原則]

想定効果:
- [短期的効果]
- [中長期的効果]

懸念・リスク:
- [実装リスク]
- [運用リスク]
- [他分野への影響]

成功指標:
- [測定可能な指標 1]
- [測定可能な指標 2]
```

#### Phase 2: 反駁テンプレート

```
[対象ロール] への反論:
「[対象提案への具体的反論]」

反論根拠:
- [見落とされた視点]
- [対立する証拠・事例]
- [専門分野からの懸念]

代替案:
「[改良された提案]」

妥協可能ポイント:
- [受け入れ可能な条件]
- [段階的実装の可能性]
```

#### Phase 3: 統合解決テンプレート

```
統合解決案:
「[各ロールの懸念を考慮した最終提案]」

各ロールへの配慮:
- [Security]: [セキュリティ要件の満足方法]
- [Performance]: [パフォーマンス要件の満足方法]
- [その他]: [その他要件の満足方法]

実装ロードマップ:
- フェーズ 1 (即座): [緊急対応事項]
- フェーズ 2 (短期): [基本実装]
- フェーズ 3 (中期): [完全実装]

成功指標・測定方法:
- [統合的な成功指標]
- [測定方法・頻度]
- [見直しタイミング]
```

### 議論品質チェックリスト

#### 論拠の質

- [ ] 公式文書・標準への言及がある
- [ ] 具体的な事例・データが提示されている
- [ ] 推測と事実が明確に区別されている
- [ ] 情報源が明示されている

#### 議論の建設性

- [ ] 相手の提案を正確に理解している
- [ ] 感情的でなく論理的な反論
- [ ] 代替案も提示している
- [ ] Win-Win の可能性を探っている

#### 実装可能性

- [ ] 技術的実現可能性を考慮
- [ ] 実装コスト・期間を見積もり
- [ ] 段階的実装の可能性を検討
- [ ] リスク軽減策を提示

#### 統合性

- [ ] 他分野への影響を考慮
- [ ] 全体最適を追求
- [ ] 長期的視点を含む
- [ ] 測定可能な成功指標を設定

### Claude との連携

```bash
# 設計文書を元にした議論
cat system-design.md
/role-debate architect,security
「この設計のセキュリティ面での課題を議論して」

# 問題を元にした解決策議論
cat performance-issues.md
/role-debate performance,architect
「パフォーマンス問題の根本的解決策を議論して」

# 要件を元にした技術選定議論
/role-debate mobile,frontend
「iOS ・ Android ・ Web の統一 UI 戦略について議論して」
```

### 注意事項

- 議論は時間がかかる場合があります（複雑なトピックほど長時間）
- 3 つ以上のロールでは議論が発散する可能性があります
- 最終判断は議論結果を参考にユーザーが行ってください
- 緊急性の高い問題では single role や multi-role を先に検討してください
