module GoodiesHelper

  def is_goody_active?(goody)
    if (goody.remaining_quantity != 0) and goody.campaign.is_active?
      ''
    else
      'disabled'
    end
  end

end
