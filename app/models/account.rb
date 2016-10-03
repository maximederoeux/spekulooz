class Account < ApplicationRecord
	belongs_to :user
	has_many :items

	after_create :generate_subdomain_1
	after_create :generate_subdomain_2
	after_create :generate_subdomain_3
	after_create :update_subdomain

  def generate_subdomain_1
  	resto_name.parameterize.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '')
  end

	def generate_subdomain_2
		resto_name.parameterize.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '-')
	end

	def generate_subdomain_3
		resto_name.parameterize.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '_')
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

	def update_subdomain
    if availability_subdomain_1 == false
		  self.update_attributes(:subdomain => generate_subdomain_1)
    elsif availability_subdomain_2 == false
      self.update_attributes(:subdomain => generate_subdomain_2)
    elsif availability_subdomain_3 == false
      self.update_attributes(:subdomain => generate_subdomain_3)
    else
      self.update_attributes(:subdomain => "resto_#{id}")
    end
	end

	def url_subdomain_1
		"#{generate_subdomain_1}.spekulooz.be"
	end

	def url_subdomain_2
		"#{generate_subdomain_2}.spekulooz.be"
	end

	def url_subdomain_3
		"#{generate_subdomain_3}.spekulooz.be"
	end

	def validated_url
		"#{subdomain}.spekulooz.be"
	end
end
