class Campaign < ApplicationRecord
  has_many :goodies

  before_save :use_youtube_embedd_url

  private

  # Regular Youtube URLs cannot be embedded into an iframe
  def use_youtube_embedd_url
    if youtube_url.include? "watch"
      youtube_url.sub!("watch?v=", "embed/")
    end
  end
end
