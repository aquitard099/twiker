class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}, uniqueness: true
    validates :password, length: {minimum: 8}
    validates :username, presence: true, uniqueness: true, on: :update
    
    has_many :tweets
end
