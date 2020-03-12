class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true
    has_many :scores
    has_secure_password
end
