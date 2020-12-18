# READ ME
 READ MEに目を通していただきありがとうございます！

## アプリケーション名
 uchino_aji (うちの味)

## アプリケーション概要
 レシピを簡単に入手できるからこそ選ぶのに迷ってしまう
 時間がかかってしまうという悩みを持った方々に対して
 その時間を少しでも短縮できるような解決策を提供する機能をもったアプリです。

## テスト用アカウント
 **トップページはログイン無しでも閲覧可能です**
 - アカウント名
   テスト用
 - メールアドレス
   test@test.com
 - パスワード
   1111aaaa

## 利用方法
 - トップページでは人気レシピのピックアップを見ていただけます。
 - 検索機能は現在未実装のためお使いいただけないことをご了承ください。

## 目指した課題解決
 レシピ検索にかける時間の短縮です。

 作ってみたいレシピに聞き慣れないハーブや常備しづらい調味料があると
 最初から探し直して時間がかかるという自身の悩みに対する課題を
 家にある調味料に絞って検索することで解決したいということに加え
 
 区民施設の方々にご協力いただき、レシピサイトに関するアンケートを行った結果
 多すぎて選べない、人気レシピを見るには制限があるというご意見が多かったことから
 手軽に人気レシピを見られるようにすることで解決したいということを目指しました。

## 洗い出した要件
<img width="917" alt="uchino_aji 機能要件定義" src="https://user-images.githubusercontent.com/72552210/100367808-1dc18d80-3046-11eb-9ddb-82f99364239e.png">

## 実装した機能
- [APIによるレシピ表示機能](https://gyazo.com/7fa961ef0f5a1854e7c8fd833971560a)
- [ログインページエラー表示](https://gyazo.com/4d58f82002c7602aeadd3c789015ed52)
- [ログイン機能](https://gyazo.com/6ee0c6d6d2814f28bb9b2daca3b20a22)
- [ユーザー新規登録機能](https://gyazo.com/2301d9839a335bfd00a6d9b81a8d657c)
- [新規登録ページエラー表示](https://gyazo.com/1826fe43c80deffbd4711629358d8e33)

## 実装予定の機能
- ユーザー詳細表示・編集機能
- 調味料登録・編集機能
- レシピ検索機能

## データベース設計
### ER図
<img width="503" alt="uchino_aji ER図1" src="https://user-images.githubusercontent.com/72552210/100367698-f36fd000-3045-11eb-86a1-0fbf6daed2ec.png">

### テーブル設計
#### users
| Column             | Type       | Options     |
|:-------------------|:-----------|:------------|
| id                 | pk         |             |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| favorite_dish      | text       |             |
| profile            | text       |             |

##### Association
- has_many :seasonings, through: :users_seasonings
- has_many :users_seasonings

#### seasonings
| Column          | Type     | Options     |
|:----------------|:---------|:------------|
| id              | pk       |             |
| name            | string   | null: false |
| user_created_at | datetime |             |
| created_at      | datetime |             |
| updated_at      | datetime |             |

##### Association
- has_many :users, through: :users_seasonings
- has_many :users_seasonings

#### users_seasonings
| Column       | Type   | Options     |
|:-------------|:-------|:------------|
| id           | pd     |             |
| user_id      | bigint | null: false |
| seasoning_id | bigint | null: false |

##### Association
- belongs_to :user
- belongs_to :seasoning

## ローカルでの動作方法
- git clone https://github.com/bokko-chan/uchino_aji.git

### 開発環境
* ruby 2.6.5
  - rails 6.0.0
  - mysql 0.5.3
  - pry-rails
  - devise
  - rakuten_web_service
  - rails-i18n
  - mini_magick
  - image_processing
  - active_hash