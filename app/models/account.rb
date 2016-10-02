class Account < ApplicationRecord
	belongs_to :user
	has_many :items

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
