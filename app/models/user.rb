class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts

	after_create :generate_subdomain
	after_create :create_account

	def create_account
		Account.create(:resto_name => resto_name, :user_id => id, :subdomain => generate_subdomain)
	end

  def generate_subdomain
  	resto_name.parameterize.gsub(/-/,'')
  end
end
