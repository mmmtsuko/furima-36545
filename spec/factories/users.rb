FactoryBot.define do
  factory :user do

    nickname {Faker::Name.initials}
    password {'aaaa11'}
    password_confirmation {password}
    last_name {"苗字"}
    first_name {"名前"}
    last_name_kana {"ミョウジ"}
    first_name_kana {"ナマエ"}
    birthbay {"2021-09-05"}
    email {Faker::Internet.free_email}
  end
end
