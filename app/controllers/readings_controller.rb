class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  def index
    @readings = Reading.all
  end

  def show
  end

  def new
    @reading = Reading.new(name: params[:name], price: params[:price])
  end

  def edit
  end

  def create
    @reading = Reading.new(reading_params)

    respond_to do |format|
      if @reading.save
        format.html { redirect_to @reading, notice: 'Reading was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url, notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def doya
    @price = Reading.sum(:price)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:name, :price)
    end
end
