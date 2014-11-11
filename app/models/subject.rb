class Subject < ActiveRecord::Base
	
	has_many :pages

	has_secure_password

	validates_presence_of :name
	validates_length_of :name, :maximum =>255

	SUBJECTS_NOT_ALLOWED = ['delbel', 'rafael', 'fernando']
	validate :subjects_is_allowed

     def subjects_is_allowed
     	if SUBJECTS_NOT_ALLOWED.include?(name)
     		errors.add(:name, "has been restricted from use")
     	end
     end

	scope :visible, lambda {
	     where(:visible => true)
	}
	scope :invisible, lambda {
	     where(:visible => false)
	}
	scope :sorted, lambda { order ("subjects.position ASC") }
	scope :newest_first, lambda { order ("subjects.created_at DESC") }
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}
end
