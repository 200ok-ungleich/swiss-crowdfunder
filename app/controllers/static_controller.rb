class StaticController < ApplicationController
  http_basic_authenticate_with name: "letme", password: "in", only: :exception_test

  def about_us
  end

  def terms_of_service
  end

  def countdown
    campaign = Campaign.find(1)
    render :layout => "blank.html.erb", :locals => {:campaign => campaign}
  end

  def exception_test
    raise "This endpoint is designed to fail!"
  end

end
