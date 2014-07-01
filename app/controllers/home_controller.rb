class HomeController < ApplicationController
  def index

    @checkins = Checkin.last(20).reverse

  end
end
