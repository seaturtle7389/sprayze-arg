class Admin::CryptoCoinsController < AdminController
  before_action :set_crypto_coin, only: %i[ show edit update destroy ]

  # GET /crypto_coins or /crypto_coins.json
  # def index
  #   @crypto_coins = CryptoCoin.all
  # end

  # GET /crypto_coins/1 or /crypto_coins/1.json
  # def show
  # end

  # GET /crypto_coins/new
  # def new
  #   @crypto_coin = crypto_coin.new
  # end

  # GET /crypto_coins/1/edit
  def edit
  end

  # POST /crypto_coins or /crypto_coins.json
  # def create
  #   @crypto_coin = crypto_coin.new(crypto_coin_params)
  #
  #   respond_to do |format|
  #     if @crypto_coin.save
  #       format.html { redirect_to crypto_coin_url(@crypto_coin), notice: "crypto_coin was successfully created." }
  #       format.json { render :show, status: :created, location: @crypto_coin }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @crypto_coin.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /crypto_coins/1 or /crypto_coins/1.json
  def update
    respond_to do |format|
      if @crypto_coin.update(crypto_coin_params)
        format.html { redirect_to admin_url(@crypto_coin), notice: "#{@crypto_coin.name} was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crypto_coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypto_coins/1 or /crypto_coins/1.json
  # def destroy
  #   @crypto_coin.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to admin_crypto_coins_url, notice: "crypto_coin was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto_coin
      @crypto_coin = CryptoCoin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crypto_coin_params
      params.require(:crypto_coin).permit(:admin)
    end
end
