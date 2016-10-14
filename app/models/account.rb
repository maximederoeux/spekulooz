class Account < ApplicationRecord
	belongs_to :user
	has_many :menus
	has_many :items
	has_many :categories

	after_create :generate_subdomain_1
	after_create :generate_subdomain_2
	after_create :generate_subdomain_3
	after_create :update_subdomain

	after_create :generate_main_menu

  has_attached_file :bg_pict_one, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :bg_pict_one, content_type: /\Aimage\/.*\z/
  
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
			if Account.where(:subdomain => generate_subdomain_1).first.id == id
				false
			else
				true
			end
		else
			false
		end
	end

	def availability_subdomain_2
		if Account.where(:subdomain => generate_subdomain_2).any?
			if Account.where(:subdomain => generate_subdomain_2).first.id == id
				true
			else
				false
			end
		else
			false
		end
	end

	def availability_subdomain_3
		if Account.where(:subdomain => generate_subdomain_3).any?
			if Account.where(:subdomain => generate_subdomain_3).first.id == id
				true
			else
				false
			end
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

	def validated_url_dev
		"http://#{subdomain}.lvh.me:3000"
	end

	def validated_url_prod
		"http://#{subdomain}.spekulooz.be"
	end

	def ready_to_start_design
		if prevalidate_sub == true && validate_sub == true && open_check == true
			true
		else
			false
		end
	end

	def ready_for_last_step
		if ready_to_start_design == true && bg_pict_select == true
			true
		else
			false
		end
	end

	def generate_main_menu
		Menu.create(:name => "Menu", :account_id => id, :food => true, :status => "main")
	end

	COUNTRIES = ["BE", "FR", "LU", "NL"]

	def self.countries
    COUNTRIES.map do |country|
      country
    end
	end

end
