class Campaign < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :image, CampaignImageUploader

  default_scope { where(active: true) }

  has_many :goodies, dependent: :destroy
  has_many :supporters, through: :goodies
  has_many :orders, through: :goodies

  validates_presence_of :description
  validates :goal, numericality: true, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
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
    self.order_success_html = renderer.render(order_success) if order_success
  end

  def is_end_before_start?
    if end_date and start_date
      errors.add(:end_date, "End date has to be after the start date!") if end_date < start_date
    end
  end


end
