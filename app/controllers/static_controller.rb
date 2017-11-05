class StaticController < ApplicationController
  def about_us
  end

  def terms_of_service
  end

  def countdown
    render :layout => "blank.html.erb"
  end

  def exception_test
    raise "This endpoint is designed to fail!"
  end

end
