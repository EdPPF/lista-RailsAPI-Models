class Commentary < ApplicationRecord
  validates :content, presence: :true
end
