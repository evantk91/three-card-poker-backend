class User < ApplicationRecord
    has_many :scores
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 5}
end
