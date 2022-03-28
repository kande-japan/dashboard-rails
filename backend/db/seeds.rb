# frozen_string_literal: true

yasu = User.create(
  name: 'Yasutaka Nishihara',
  email: 'yassan@gmail.com',
  password: 'yassanyassanyassan'
)

SlackUser.create(
  id: 'U12345678',
  user_id: yasu.id
)

# User
puts 'Creating Users...'
first_names = %w[Takashi Akari Honoka Ryo Ren Aoi Haruto Mei Sota Koharu Yui]
last_names = %w[Sato Suzuki Takahashi Tanaka Ito Watanabe Yamamoto Nakamura Kobayashi Kato]

users = []
20.times do
  first_name = first_names.sample
  last_name = last_names.sample
  user = User.new(
    name: "#{first_name} #{last_name}",
    password: first_name * 3,
    email: "#{first_name}#{rand(10_000)}@kande-japan.com"
  )
  user.run_callbacks :create
  users << user
end
User.bulk_import! users
puts 'Created Users!'

# Slack User
def slack_id
  'U%07d' % rand(1_000_000)
end

puts 'Creating SlackUser of existing users...'
slack_users = []
users.each do |user|
  slack_user = SlackUser.new(
    id: slack_id,
    first_name: user.name.split(' ')[0],
    last_name: user.name.split(' ')[1],
    display_name: user.name,
    real_name: user.name,
    user_id: user.id,
    email: user.email
  )

  slack_users << slack_user
end
puts 'Created SlackUser of existing users!'

puts 'Creating new SlackUsers...'
80.times do
  first_name = first_names.sample
  last_name = last_names.sample
  slack_user = SlackUser.new(
    id: slack_id,
    first_name: first_name,
    last_name: last_name,
    display_name: "#{first_name} #{last_name}",
    real_name: "#{first_name} #{last_name}",
    email: "#{first_name}#{rand(10_000)}@kande-japan.com"
  )
  slack_users << slack_user
end
SlackUser.bulk_import! slack_users
puts 'Created new SlackUsers!'

# Content
puts 'Creating Contents...'

subjects = %w[動物園 パン ランドリー セミ 歌謡曲 虎 ボンネット トロンボーン カメラ 犯人 排気ガス]
adjectives = %w[暑い 重い あたたかい 真っ白い 久しい めまぐるしい 照れ臭い よそよそしい やすい ねちっこい 心地よい]
contents = []
10_000.times do
  text = "#{subjects.sample}は#{adjectives.sample[0..-2]}く#{adjectives.sample}"
  contents << Content.new(
    text: text,
    slack_user_id: slack_users.sample.id
  )
end
Content.bulk_import! contents
puts 'Created Contents!'

# Category
puts 'Creating Categories...'
categories = []
category_names = %w[ブロックチェーン データベース ネタ記事 クソリプ コメント その他]
category_names.each do |name|
  categories << Category.new(
    name: name
  )
end
Category.bulk_import! categories
categories = Category.all
puts 'Created Categories!'

# Content Category
puts 'Creating Content-Category assosiations...'
content_categories = []
contents = Content.all
contents[0, 8000].each do |content|
  content_categories << ContentCategory.new(
    content_id: content.id,
    category_id: categories.sample.id,
    user_id: users.sample.id
  )
end
ContentCategory.bulk_import! content_categories
puts 'Created Content-Category assosiations!'

puts
puts '-----------------------------------'
puts 'Created all seed data.'
