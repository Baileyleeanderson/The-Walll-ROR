class User < ActiveRecord::Base
    has_many :messages
    has_many :comments
    validates :first_name, :last_name, :email, presence: true
    validates_uniqueness_of :username, length: {minimum: 5}, presence: true
end

