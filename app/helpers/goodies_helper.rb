module GoodiesHelper
  def image_url(entity)
    entity.image ? entity.image : "http://via.placeholder.com/200x50"
  end
end
