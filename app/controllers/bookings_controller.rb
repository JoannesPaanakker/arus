class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    @page = "bookings"
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @newbookingstart = @booking.start_time.strftime("%m-%d-%Y")
    @newbookingend = @booking.end_time.strftime("%m-%d-%Y")


    @books = Booking.all
    @booking_exists = false
    @bookingstart_in_booked_period = false
    @bookingend_in_booked_period = false
    @books.each do |book|
      @bookstart = book.start_time.strftime("%m-%d-%Y")
      @bookend = book.end_time.strftime("%m-%d-%Y")
      if @bookstart == @newbookingstart || @bookend == @newbookingend
        @booking_exists = true
      end
      if @booking.start_time > book.start_time && @booking.start_time < book.end_time
         @bookingstart_in_booked_period = true
      end
      if @booking.end_time > book.start_time && @booking.end_time < book.end_time
         @bookingend_in_booked_period = true
      end
    end




    if @booking.end_time <= @booking.start_time
      redirect_to new_booking_path, alert: 'End date must be after start date.'
    elsif @booking_exists
      redirect_to new_booking_path, alert: 'Booking with start or end date exists.'
    elsif @bookingstart_in_booked_period
      redirect_to new_booking_path, alert: 'Booking start in booked period.'
    elsif @bookingend_in_booked_period
      redirect_to new_booking_path, alert: 'Booking end in booked period.'
    elsif
      respond_to do |format|
        if @booking.save
          format.html { redirect_to bookings_path, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to bookings_path, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:name, :start_time, :end_time)
    end
end
