class Comment < ApplicationRecord
	belongs_to :man 
	belongs_to :user
end
