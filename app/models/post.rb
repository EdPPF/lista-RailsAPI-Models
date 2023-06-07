class Post < ApplicationRecord
    has_many :commentaries, dependent: :destroy

    validates :title, presence: :true
    validates :content, presence: :true
end
