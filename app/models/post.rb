class Post < ActiveRecord::Base

  validates :title, :content, presence: true
  validates :title, length: {maximum: 100}
  validates :content, length: {minimum: 10}

  before_save :add_text_to_content

  private
  def add_text_to_content
    self.short_content = content[0..100]
  end

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :categories
end
