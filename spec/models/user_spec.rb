require 'rails_helper'

RSpec.describe User, type: :model do
  describe "入力内容によって新規登録が正しく出来るか" do
    let(:user){User.new(name: name,email: email,password: password)}
    subject{user.valid?}

    context"名前・アドレス・パスワードが全て正しく記載された場合" do
      let(:name){"testname"}
      let(:email){"test@gmail.com"}
      let(:password){"testpassword"}
      it "登録出来る" do
        is_expected.to eq(true)
        # user = User.new(name: "test",email:"test@gmail.com",password: "test")
        # expect(user).to be_valid
      end
    end
    
    context"名前がない場合" do
      let(:name){nil}
      let(:email){"test@gmail.com"}
      let(:password){"testpassword"}
      it "登録不可" do
        is_expected.to eq(false)
        # user = User.new(name: nil)
        # expect(user.valid?).to eq(false)
      end
    end
    
    context"メールアドレスがない場合"do
      let(:email){nil}
      let(:name){"testname"}
      let(:password){"testpassword"}
      it "登録不可" do
        is_expected.to eq(false)
        # user =User.new(email: nil)
        # expect(user.valid?).to eq(false)
      end
    end
    
    context"パスワードがない場合"do
    let(:password){nil}
    let(:name){"testname"}
    let(:email){"test@gmail.com"}
      it "登録不可" do
        is_expected.to eq(false)
        # user =User.new(password: nil)
        # expect(user.valid?).to eq(false)
      end
    end
  end

  context"メールアドレスが重複した場合" do
  let(:name){"testname"}
  let(:email){"test@gmail.com"}
  let(:password){"testpassword"}
    it "登録不可" do
      another_user = User.new(name: "testname2",email:"test@gmail.com",password: "testpassword2")
      another_user.valid?
    end
  end

end