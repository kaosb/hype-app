class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable,
	:confirmable, :lockable
	# has_one :profile, dependent: :destroy
end
