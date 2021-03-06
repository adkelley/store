class StoreItsController < ApplicationController
  include StoreItsHelper

  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :index]
  before_action :correct_user, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_store_account, only: [:show, :edit, :update, :destroy, :index]

  
  # GET /store_its
  # GET /store_its.json
  def index
    @stores = StoreIt.all
  end

  # GET /store_its/1
  # GET /store_its/1.json
  def show
    #@token = ApiToken.find_by(store_id: params[:id])
    respond_to do |f|
      f.html 
      f.json { render json: current_user }
    end

  end

  # GET /store_its/new
  def new
    @store = StoreIt.new
  end

  # GET /store_its/1/edit
  def edit
  end

  # POST /store_its
  # POST /store_its.json
  def create
    @store = StoreIt.new(store_it_params)

    respond_to do |format|
      if @store.save
        set_token(@store.id)
        log_in(@store)
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        flash[:danger] = "Invalid data, a new store was not created"
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_its/1
  # PATCH/PUT /store_its/1.json
  def update
    respond_to do |format|
      if @store.update(store_it_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_its/1
  # DELETE /store_its/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to store_its_url, notice: 'Store it was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store_account
    @store = StoreIt.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_it_params
    params.require(:store_it).permit(:name, :email, :password, :password_confirmation)
  end

end
