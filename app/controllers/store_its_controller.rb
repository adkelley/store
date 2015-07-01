class StoreItsController < ApplicationController
  before_action :set_store_it, only: [:show, :edit, :update, :destroy]

  # GET /store_its
  # GET /store_its.json
  def index
    @store_its = StoreIt.all
  end

  # GET /store_its/1
  # GET /store_its/1.json
  def show
    @token = ApiToken.find_by(store_id: params[:id])
  end

  # GET /store_its/new
  def new
    @store_it = StoreIt.new
  end

  # GET /store_its/1/edit
  def edit
  end

  # POST /store_its
  # POST /store_its.json
  def create
    @store_it = StoreIt.new(store_it_params)

    respond_to do |format|
      if @store_it.save
        set_token(@store_it.id)
        format.html { redirect_to @store_it, notice: 'Store it was successfully created.' }
        format.json { render :show, status: :created, location: @store_it }
      else
        format.html { render :new }
        format.json { render json: @store_it.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_its/1
  # PATCH/PUT /store_its/1.json
  def update
    respond_to do |format|
      if @store_it.update(store_it_params)
        format.html { redirect_to @store_it, notice: 'Store it was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_it }
      else
        format.html { render :edit }
        format.json { render json: @store_it.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_its/1
  # DELETE /store_its/1.json
  def destroy
    @store_it.destroy
    respond_to do |format|
      format.html { redirect_to store_its_url, notice: 'Store it was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_it
      @store_it = StoreIt.find(params[:id])
    end

    def set_token(id)
      token = ApiToken.new
      uuid = UUID.new
      token.hex_value = uuid.generate
      token.store_id = id
      token.save
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def store_it_params
      params.require(:store_it).permit(:name, :email, :password, :password_confirmation)
    end
end
