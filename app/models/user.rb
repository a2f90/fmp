class User < ActiveRecord::Base
	ROLES = %w[admin member]

	before_save :setup_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable, :timeout_in => 1.hour, :stretches => 15

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me

	def role?(role)
  		return (self.role.to_s == role.to_s)
	end

	 # Default role is "Member"
  def setup_role 
    if self.role.to_s.empty?     
      self.role = 'member' 
    end
  end
end
