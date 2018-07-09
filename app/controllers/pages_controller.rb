class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :appartment, :boat]

  def home
    @page = "home"
  end

  def appartment
    @page = "appartment"
  end

  def boat
    @page = "boat"
  end
end
