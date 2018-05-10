class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :post,  presence: true, length: {minimum: 10}
end