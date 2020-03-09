require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario"user creates a new post"do
    #ユーザーを作成
    user = User.create(
      name:"鈴木一郎",
      email:"test@gmail.com",
      password:"ichiro"
    )
    #目標を作成
    goal = Goal.create(
      goal:"testgoal",
      purpose:"testpurpose",
      date:"1111-11-11",
      user_id:1,
      users_name:"鈴木一郎",
    )

    #お試し投稿を作成
    post = Post.create(
      content:"テスト投稿",
      user_id:1
    )

    #トップページへアクセス
    visit root_path

    # ログイン画面へ遷移
    # click_on "ログイン"

    #アドレスとパスワードを入力してログイン
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button"ログイン"

    #ログイン成功のフラッシュメッセージが表示される
    expect(page).to have_content "ログインしました"
  end
end
