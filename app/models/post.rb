class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  # has_many :comments, as: :commentable, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessor :published_at_string

  # acts_as_taggable

  scope :published, -> { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, -> { where('published_at > ?', Time.now.utc) }

  mount_uploader :image, ImageUploader

  before_validation :format_published_at
  validates_presence_of :abstract, :body, :description, :title


  def editable_by?(user)
    return false if user.nil?
    user.admin? or user.id == author_id
  end

  def last_published?
    self == self.class.published.last
  end

  def published_at_formatted
    return "" if published_at.nil?
    published_at.strftime("%m/%d/%Y")
  end

  def published_date
    return "" if published_at.nil?
    published_at.strftime("%d %b %Y")
  end

  def published_status
    return "draft" if published_at.nil?
    published_at <= Time.now.utc ? "published" : "scheduled"
  end

  def should_generate_new_friendly_id?
    new_record?
  end

  # def tag_list_sorted
  #   tag_list.map{ |t| t }.sort
  # end

  private

  def format_published_at
    unless self.published_at_string.nil? or self.published_at_string.empty? or (published_at_formatted == published_at_string)
      date_string = "#{self.published_at_string} 06:00 -0700"
      self.published_at = DateTime.strptime(date_string, '%m/%d/%Y %H:%M %z')
    end
  end

end
