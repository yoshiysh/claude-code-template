# Claude Code Template Project

Claude Code (claude.ai/code) 用のシンプルなテンプレートリポジトリです。新しいプロジェクトのセットアップを効率化し、開発の生産性を向上させます。

![Claude Code Compatible](https://img.shields.io/badge/Claude%20Code-Compatible-blue)
![GitHub Template](https://img.shields.io/badge/GitHub-Template-success)

## 概要

このテンプレートは、Claude Code との統合に最適化されたシンプルな構成を提供します。最小限の設定で新しいプロジェクトを開始でき、必要に応じて機能を追加していくことができます。

### 主な特徴

- **🚀 Claude Code 統合**: プロジェクトメモリの最適化設定
- **📁 シンプルな構成**: 必要最小限のファイル構成でスタート
- **📚 ドキュメント管理**: 調査・計画・実装の記録を体系的に管理
- **🎯 柔軟性**: どんなプロジェクトタイプにも適応可能な基盤

## クイックスタート（3ステップ）

### 1. テンプレートを使用

上記の **"Use this template"** ボタンをクリックするか、[テンプレートから作成](https://github.com/yoshiysh/claude-code-template/generate)

### 2. プロジェクトをカスタマイズ

```bash
# 新しいリポジトリをクローン
git clone https://github.com/yourusername/your-project-name.git
cd your-project-name

# CLAUDE.md をプロジェクトの詳細に更新
# プロジェクト概要セクションを編集
```

### 3. プロジェクトを開始

```bash
# 必要な設定ファイルを追加
# package.json、requirements.txt、go.mod など
# プロジェクトに必要なファイルを作成
```

## テンプレート構成

### 📁 ファイル構造

```text
claude-code-template/
├── CLAUDE.md                 # Claude Code プロジェクトメモリ
├── README.md                 # このファイル
└── ai-rules/                 # AI関連のルール設定
    ├── API_FUNCTION_NAMING.md
    ├── COMMIT_AND_PR_GUIDELINES.md
    └── ISSUE_GUIDELINES.md
```

### 🚀 含まれる機能

- **Claude Code 最適化**: プロジェクトメモリ設定でAI支援を最大化
- **ドキュメント管理**: 調査・計画・実装の体系的な記録管理
- **AI ルール設定**: コミット、PR、API命名などのガイドライン
- **軽量構成**: 必要最小限から始めて段階的に拡張可能

## GitHub Template 使用方法

### テンプレートからの新規リポジトリ作成

1. **テンプレート使用**: GitHubリポジトリページの "Use this template" ボタンをクリック
2. **リポジトリ情報入力**: 
   - Repository name: 新しいプロジェクト名を入力
   - Description: プロジェクトの説明を追加（オプション）
   - Public/Private: 公開設定を選択
3. **作成**: "Create repository from template" をクリック

### テンプレート後の初期設定

```bash
# 作成したリポジトリをクローン
git clone https://github.com/yourusername/your-new-repository.git
cd your-new-repository

# CLAUDE.mdをプロジェクトに合わせて更新
# ai-rules/配下のルールも必要に応じてカスタマイズ
```

## コマンドワークフロー

### 推奨される開発フロー

AI支援開発を効率的に進めるため、以下の順序でコマンドを実行することを推奨します：

1. **investigate（調査）**: 既存コードの理解や技術調査
   ```bash
   # 実装前の調査フェーズ
   # 結果はdocs/investigate/に記録される
   ```

2. **plan（計画）**: 調査結果を基に実装計画を作成
   ```bash
   # investigateの結果を入力として使用
   # 結果はdocs/plan/に記録される
   ```

3. **implement（実装）**: 計画に基づいて実装
   ```bash
   # planの結果を入力として使用
   # 結果はdocs/implement/に記録される
   ```

4. **test（テスト）**: 実装のテストと検証
   ```bash
   # implementの結果を入力として使用
   # 結果はdocs/test/に記録される
   ```

### ワークフローの重要なポイント

- **連続性**: 各フェーズの結果を次のフェーズの入力として使用
- **記録管理**: すべての作業がdocs/配下に体系的に記録
- **反復可能**: 必要に応じて前のフェーズに戻って再実行可能
- **AI最適化**: Claude Codeとの統合により各フェーズでAI支援を最大化

## カスタマイズガイド

### 基本的なカスタマイズ

1. **プロジェクト情報の更新**

   ```bash
   # CLAUDE.md のプロジェクト概要セクションを編集
   # README.md をプロジェクト固有の内容に更新
   # 必要に応じてpackage.json、requirements.txt等を作成
   ```

2. **技術スタックの設定**

   ```bash
   # プロジェクトに必要な設定ファイルを追加
   # ビルドやテストスクリプトをカスタマイズ
   # 依存関係管理ファイルを更新
   ```

3. **Claude Code 統合のカスタマイズ**

   ```bash
   # CLAUDE.md の開発コマンドセクションを更新
   # プロジェクト固有の重要な注意事項を追加
   ```

### 拡張カスタマイズ

- **AI ルール**: `ai-rules/` の設定をプロジェクトに合わせて調整
- **必要に応じて追加**: GitHubワークフロー、セキュリティ設定、コミュニティファイルなど

## ドキュメント

- 🔧 [CLAUDE.md](CLAUDE.md) - Claude Code固有の設定とプロジェクトメモリ
- ⚙️ [ai-rules/](ai-rules/) - AI関連のルールとガイドライン

---

**注意**: このテンプレートは継続的にメンテナンスされ、進化するベストプラクティスに従います。⭐ を付けて最新の機能と改善情報をチェックしてください。
