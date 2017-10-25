class Campaign < ApplicationRecord
  has_many :goodies, dependent: :destroy

  validates_presence_of :description

  before_save :use_youtube_embedd_url

  before_save :convert_descriptions

  def amount_raised
    goodies.inject(0) do |sum, g|
      sum += g.orders ? g.orders.sum(&:amount) : sum
    end
  end

  private

  # Regular Youtube URLs cannot be embedded into an iframe
  def use_youtube_embedd_url
    if youtube_url =~ /watch/
      youtube_url.sub!("watch?v=", "embed/")
    end
  end

  def convert_descriptions
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new,
                                       fenced_code_blocks: true)
    self.description_html = renderer.render(description) if description
    self.order_description_html = renderer.render(order_description) if order_description
  end
end
