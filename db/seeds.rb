# frozen_string_literal: true

DUMMY_BOOK_COUNT = 50
DUMMY_USER_COUNT = 30

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp.casecmp('Y').zero?
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

DUMMY_BOOK_COUNT.times do
  Book.create!(
    title: Faker::Book.title,
    memo: Faker::Book.genre,
    author: Faker::Book.author,
    picture: picture_file('no-image.png')
  )
end

User.destroy_all

DUMMY_USER_COUNT.times do |i|
  email = i.zero? ? 'user@example.com' : "user#{i}@example.com"
  User.create!(
    email:,
    username: Faker::Internet.username(specifier: 5..8),
    full_name: Faker::Name.name,
    password: 'p123456',
    password_confirmation: 'p123456',
    postal_code: Faker::Address.postcode,
    address: "#{Faker::Address.state}#{Faker::Address.city}#{Faker::Address.street_name}#{rand(1..9)}-#{rand(1..99)}-#{rand(1..9)}",
    bio: "こんにちは。好きなジブリのキャラクターは#{Faker::JapaneseMedia::StudioGhibli.character}です。好きな動物は#{Faker::Creature::Animal.name}で、好きな寿司ネタは#{Faker::Food.sushi}です。"
  )
end

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output
