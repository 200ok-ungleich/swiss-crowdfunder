class GoodiesController < ApplicationController
  before_action :set_goodies, only: [:index]

  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goodies
      @campaign = Campaign.friendly.find(params[:campaign_id])
      @goodies  = @campaign.goodies
    end
end
