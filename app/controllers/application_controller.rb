class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_sub_account
  before_action :set_locale
  before_action :set_root_page


  def default_url_options
    if Rails.env.production?
      {:host => "spekulooz.be"}
    else  
      {}
    end
  end

  def set_root_page
    if Rails.env.development?
      @root_page = "http://www.lvh.me:3000"
    else
      @root_page = "http://www.spekulooz.be"
    end  
  end

  def set_sub_account
  	@sub_accounts = Account.where(subdomain: request.subdomain).all
  	@sub_account = @sub_accounts.first  	
  end

  def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => nil }
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

end
