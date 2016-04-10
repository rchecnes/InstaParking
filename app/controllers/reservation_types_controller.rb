class ReservationTypesController < ApplicationController
  before_action :set_reservation_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  layout "home"
  # GET /reservation_types
  # GET /reservation_types.json
  def index
    @reservation_types = ReservationType.all
  end

  # GET /reservation_types/1
  # GET /reservation_types/1.json
  def show
  end

  # GET /reservation_types/new
  def new
    @reservation_type = ReservationType.new
  end

  # GET /reservation_types/1/edit
  def edit
  end

  # POST /reservation_types
  # POST /reservation_types.json
  def create
    @reservation_type = ReservationType.new(reservation_type_params)

    respond_to do |format|
      if @reservation_type.save
        format.html { redirect_to @reservation_type, notice: 'Reservation type was successfully created.' }
        format.json { render :show, status: :created, location: @reservation_type }
      else
        format.html { render :new }
        format.json { render json: @reservation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation_types/1
  # PATCH/PUT /reservation_types/1.json
  def update
    respond_to do |format|
      if @reservation_type.update(reservation_type_params)
        format.html { redirect_to @reservation_type, notice: 'Reservation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation_type }
      else
        format.html { render :edit }
        format.json { render json: @reservation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_types/1
  # DELETE /reservation_types/1.json
  def destroy
    @reservation_type.destroy
    respond_to do |format|
      format.html { redirect_to reservation_types_url, notice: 'Reservation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_type
      @reservation_type = ReservationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_type_params
      params.require(:reservation_type).permit(:name, :description)
    end
end
