# アプリ名：TUMIKI
目標達成サポートアプリです。
「日々コツコツと積み上げていくことで目標を達成する」というコンセプトから【TUMIKI】というサービス名にしました。

特徴は以下の2つです。

①進捗を外部発信すること  
毎日、その日やったことをSNS発信することで、「続けている自分」を他者の目に晒し、「辞めてしまう自分」への抵抗感を作り出すことで習慣化出来るようなシステムになっています。

②ゲーム性でモチベーション維持  
投稿が積み木のように積み上がっていくことで、どのくらい行動してきたのかを可視化することが出来ます。
また、行動し、投稿をすることで積み木の高さが上がっていくため、ゲーム感覚で投稿を続けることが出来、モチベーション維持に繋がるようなシステムにしました。

# URL
http://raimuhosoda02.work/  
上記URLの「ゲストログイン」からゲストユーザーとして利用可能です。

# 使用技術
* Ruby：2.6.3
* Rails：5.0.7.2
* AWS
    * Route53
    * VPC
    * EC2
* Unicorn
* nginx
* HTML
* SASS
* jQuery
* RSpec
* Mysql　

【追加予定】

* Docker
* CircleCI

# 機能一覧
* ユーザー機能
    * 新規登録
    * ログイン・ログアウト
    * プロフィール編集
    * アイコン画像登録
    * ユーザー一覧表示
    * 他ユーザーのホーム画面（目標や投稿内容）の確認
    
* 投稿機能
    * 全てのユーザーの投稿一覧表示
    * 新規投稿
    * 編集
    * 削除

* いいね！機能
    * いいね！付与
    * いいね！を付与した投稿一覧表示
    * いいね！をもらった数を表示

* 目標設定機能
    * 新規作成（目標・目的・期限）
    * 再設定・編集機能
    * 目標達成機能

* タスク管理機能
    * 新規タスク設定
    * 編集
    * タスク一覧（未完了タスク・完了タスクの２種）
    * タスク完了・未完了へ戻す機能
    * 削除

* マイルール設定機能
    * 新規投稿
    * マイルール一覧表示
    * 編集
    * 削除
