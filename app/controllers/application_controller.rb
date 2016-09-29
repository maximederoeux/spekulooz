class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#   before_filter :get_account

# private
#   def get_account

#     @account = Account.where(subdomain: request.subdomain).first

#   end

  def default_url_options
    if Rails.env.production?
      {:host => "spekulooz.be"}
    else  
      {}
    end
  end
end
