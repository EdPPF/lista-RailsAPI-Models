FactoryBot.define do
  factory :commentary do
    content { "MyText" }
    user_id { 1 }
    post_id { 1 }
  end
end
