FactoryBot.define do
  factory :feedback do
    like { false }
    user_id { 1 }
    post_id { 1 }
  end
end
