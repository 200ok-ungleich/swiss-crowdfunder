module CampaignsHelper

  def campaign_percentage(campaign)
    number_to_percentage(100*(campaign.amount_raised.to_f / campaign.goal),
                         precision: 1,
                         separator: '.')
    .delete(' ') # In some localizations there's whitespace between the number and the percent
  end

  def is_campaign_active?(campaign)
    campaign.is_active? ? '' : 'disabled'
  end

end
