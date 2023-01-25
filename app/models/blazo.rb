class Blazo < ApplicationRecord
  belongs_to :user
  has_many :likes
  # https://qiita.com/miriwo/items/9d93b8e7083df03f8809 を参考にした
  validates :abstract, {presence: true, length: {maximum: 200}}
  validates :content, {presence: true}
end
