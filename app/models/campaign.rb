class Campaign < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :goodies, dependent: :destroy
  has_many :supporters, through: :goodies

  validates_presence_of :description
  validates :goal, numericality: true, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date, :is_end_before_start?

  before_save :use_youtube_embedd_url

  before_save :convert_descriptions

  def amount_raised
    goodies.inject(0) do |sum, g|
      sum += g.orders ? g.orders.sum(&:amount) : sum
    end
  end

  def is_active?
    start_date <= Date.today &&
    end_date >= Date.today
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

  def is_end_before_start?
    errors.add(:end_date, "End date has to be after the start date!") if end_date < start_date
  end


end
