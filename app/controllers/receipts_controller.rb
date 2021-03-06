class ReceiptsController < ApplicationController
  include StoreItsHelper

  #before_filter :restrict_access
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  # GET /receipts
  # GET /receipts.json
  # curl http://localhost:3000/reciepts -H 'Authorization: Token token="230d43b0-03d0-0133-90ab-2886dda44ec3"'
  def index
    #@receipts = Receipt.all
    #token = ApiToken.find_by(hex_value: @token_string )
    @receipts = Receipt.where(store_id: current_user.id)
    render json: @receipts
    # respond_to do |format|
    #   format.json { render json: @receipts }
    #end
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:transaction_number, :payment_method, :amount, :tip, :total)
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        @token_string = token
        ApiToken.exists?(hex_value: token)
      end
    end

end
