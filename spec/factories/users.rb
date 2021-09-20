FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    family_name           {'山本'}
    first_name            {'侑果'}
    family_name_kana      {'ヤマモト'}
    first_name_kana       {'ユウカ'}
    birth                 {'2000-01-20'}
  end
end

# user = User.new(nickname: "yukyamam", email: "yamamoto@yamamoto.com", password: "yamamoto", password_confirmation: "yamamoto", family_name: "山本", first_name: "侑果", family_name_kana: "ヤマモト", first_name_kana: "ユウカ", birth: "2000-01-20")
