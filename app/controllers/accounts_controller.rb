class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    if Account.where(subdomain: request.subdomain).any?
      @account = Account.where(subdomain: request.subdomain).first
    else
      @account = Account.find(params[:id])
    end
    @items = @account.items
    @user = @account.user
    
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end

  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    if Account.where(subdomain: request.subdomain).any?
      @account = Account.where(subdomain: request.subdomain).first
    else
      @account = Account.find(params[:id])
    end
    @user = @account.user

    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end

    @countries = Account.countries
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to edit_account_path(@account), notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    if Account.where(subdomain: request.subdomain).any?
      @account = Account.where(subdomain: request.subdomain).first
    else
      @account = Account.find(params[:id])
    end
        
    respond_to do |format|
      if @account.update(account_params)
        if @account.prevalidate_sub == false && @account.validate_sub == nil
          format.html { redirect_to edit_account_path(@account), notice: 'Account was successfully updated.' }
          format.json { render :show, status: :ok, location: @account }
        elsif @account.prevalidate_sub == true && @account.validate_sub == nil
          format.html { redirect_to edit_account_path(@account), notice: 'Account was successfully updated.' }
          format.json { render :show, status: :ok, location: @account }
        elsif @account.prevalidate_sub == true && @account.validate_sub == true && @account.open_check.blank?
          format.html { redirect_to edit_account_path(@account), notice: 'Account was successfully updated.' }
          format.json { render :show, status: :ok, location: @account }
        elsif @account.ready_to_start_design == true
          format.html { redirect_to edit_account_path(@account), notice: 'Account was successfully updated.' }
          format.json { render :show, status: :ok, location: @account }
        else 
          format.html { redirect_to :back, notice: 'Account was successfully updated.' }
          format.json { render :show, status: :ok, location: @account }
        end        
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      if Rails.env.production?
        @account = Account.find(params[:id])
      else
        if Account.where(subdomain: request.subdomain).any?
          @account = Account.where(subdomain: request.subdomain).first
        else
          @account = Account.find(params[:id])
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:subdomain, :resto_name, :user_id,
                                      :select_sub_one, :select_sub_two, :select_sub_three, :prevalidate_sub, :validate_sub,
                                      :already_open, :open_on, :open_check,
                                      :bg_pict_select, :bg_pict_number, :bg_pict_one,
                                      :address, :city, :zipcode, :country, :phone, :fax, :mobile, :email,
                                      :facebook, :twitter, :instagram, :google, :snapchat, :youtube, :vimeo,
                                      :mon_am_start, :mon_am_end, :mon_pm_start, :mon_pm_end, :mon_am_closed, :mon_pm_closed, 
                                      :tue_am_start, :tue_am_end, :tue_pm_start, :tue_pm_end, :tue_am_closed, :tue_pm_closed,
                                      :wed_am_start, :wed_am_end, :wed_pm_start, :wed_pm_end, :wed_am_closed, :wed_pm_closed,
                                      :thu_am_start, :thu_am_end, :thu_pm_start, :thu_pm_end, :thu_am_closed, :thu_pm_closed,
                                      :fri_am_start, :fri_am_end, :fri_pm_start, :fri_pm_end, :fri_am_closed, :fri_pm_closed,
                                      :sat_am_start, :sat_am_end, :sat_pm_start, :sat_pm_end, :sat_am_closed, :sat_pm_closed,
                                      :sun_am_start, :sun_am_end, :sun_pm_start, :sun_pm_end, :sun_am_closed, :sun_pm_closed)
    end
end
