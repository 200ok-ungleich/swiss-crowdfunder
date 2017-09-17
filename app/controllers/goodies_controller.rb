class GoodiesController < ApplicationController
  before_action :set_goodies, only: [:index]

  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goodies
      @goodies = Campaign.find(params[:campaign_id]).goodies
    end
end
