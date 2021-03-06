class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
    @accounts = current_user.accounts
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])
    @new_menu = Menu.new
    @account = @menu.account
    @menu_categories = @menu.menu_categories
    @new_item_category = ItemCategory.new
    @new_item = Item.new
    @categories = @account.categories
    @new_category = Category.new
    @statuses = Menu.statuses
    @new_menu_category = MenuCategory.new
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    @statuses = Menu.statuses
  end

  # GET /menus/1/edit
  def edit
    @statuses = Menu.statuses
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    @statuses = Menu.statuses

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        if @sub_accounts.any?
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @menu }
        else
        format.html { redirect_to @menu }
        format.json { render :show, status: :ok, location: @menu }
        end         
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :description,
                                    :visible, :start_date, :end_date,                                 
                                    :food, :drink, 
                                    :period_quantity, :period, :promote, 
                                    :price, 
                                    :active, :status, :account_id,
                                    :menu_design)
    end
end
