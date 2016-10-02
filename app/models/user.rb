class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts

	after_create :generate_subdomain
	after_create :create_account

	def create_account
    if availability_subdomain_1 == false
		  Account.create(:resto_name => resto_name, :user_id => id, :subdomain => generate_subdomain_1)
    elsif availability_subdomain_2 == false
      Account.create(:resto_name => resto_name, :user_id => id, :subdomain => generate_subdomain_2)
    elsif availability_subdomain_3 == false
      Account.create(:resto_name => resto_name, :user_id => id, :subdomain => generate_subdomain_3)
    else
      Account.create(:resto_name => resto_name, :user_id => id)
    end
	end

  def generate_subdomain
  	resto_name.parameterize.gsub(/-/,'')
  end

  def generate_subdomain_1
    resto_name.parameterize.gsub(/-/,'')
  end

  def generate_subdomain_2
    resto_name.squish.downcase.tr(" ","-")  
  end

  def generate_subdomain_3
    resto_name.squish.downcase.tr(" ","_")      
  end

  def availability_subdomain_1
    if Account.where(:subdomain => generate_subdomain_1).any?
      true
    else
      false
    end
  end

  def availability_subdomain_2
    if Account.where(:subdomain => generate_subdomain_2).any?
      true
    else
      false
    end
  end

  def availability_subdomain_3
    if Account.where(:subdomain => generate_subdomain_3).any?
      true
    else
      false
    end
  end  
end
