class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: {case_sensitive: false}
end
