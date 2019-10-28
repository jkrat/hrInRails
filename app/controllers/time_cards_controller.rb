class TimeCardsController < ApplicationController
  before_action :set_time_card, only: [:show, :edit, :update, :destroy]
  before_action :set_employee, only: [:create]

  # GET /time_cards
  def index
    @time_cards = TimeCard.all
  end

  # GET /time_cards/1
  def show
  end


    # @employee.time_cards << @time_card
    # if @employee.save
    #   redirect_to @time_card, notice: 'Time card was successfully created.' 
    #   else
    #     render :index
    #   end

  # POST /time_cards
  def add
    @time_card = TimeCard.new
    console.log('add')
    redirect_to employees

  end

  # PATCH/PUT /time_cards/1
  # PATCH/PUT /time_cards/1.json
  def update
    respond_to do |format|
      if @time_card.update(time_card_params)
        format.html { redirect_to @time_card, notice: 'Time card was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_card }
      else
        format.html { render :edit }
        format.json { render json: @time_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_cards/1
  # DELETE /time_cards/1.json
  def destroy
    @time_card.destroy
    respond_to do |format|
      format.html { redirect_to time_cards_url, notice: 'Time card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_card
      @time_card = TimeCard.find(params[:id])
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_card_params
      params.fetch(:time_card, {})
    end
end
