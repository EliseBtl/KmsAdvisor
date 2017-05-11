class Man < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :user_id, presence: true
	validates :description, presence: true, length: { maximum: 340 }


	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end 

end
