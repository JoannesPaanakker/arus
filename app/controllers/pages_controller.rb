class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :appartment, :boat, :bookings]

  def home
    @page = "home"
  end

  def appartment
    @page = "appartment"
  end

  def boat
    @page = "boat"
  end

  def bookings
    @page = "bookings"
  end

end
