class Post < ApplicationRecord
    has_many :commentaries, dependent: :destroy
    has_many :feedbacks, dependent: :destroy
    has_many :post_category, dependent: :destroy

    validates :title, presence: :true
    validates :content, presence: :true
end
