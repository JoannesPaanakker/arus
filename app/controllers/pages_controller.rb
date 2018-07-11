class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :appartment, :boat, :contact]

  def home
    @page = "home"
  end

  def appartment
    @page = "appartment"
  end

  def boat
    @page = "boat"
  end

  def contact
    @page = "contact"
  end

end
