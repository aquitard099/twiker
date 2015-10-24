class Tweet < ActiveRecord::Base
	validates :content, length: {minimum: 1, maximum:140}
	belongs_to :user
	# Cada tweet le pertece a un usuario unicamente.
end
