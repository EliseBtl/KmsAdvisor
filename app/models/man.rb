class Man < ApplicationRecord
	attr_accessor :avatar
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :user_id, presence: true
	validates :description, presence: true, length: { maximum: 340 }

	mount_uploader :avatar, AvatarUploader

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end 

end
