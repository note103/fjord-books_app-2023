# frozen_string_literal: true

# ユーザー一覧ページのページネーションを確認するためのダミーユーザーを作成します。

DUMMY_USER_COUNT = 12

if Rails.env.development? || Rails.env.test?
  (1..DUMMY_USER_COUNT).each do |i|
    User.find_or_create_by(email: "user#{i}@example.com") do |user|
      user.password = 'p123456'
      user.password_confirmation = 'p123456'
    end
  end
end
