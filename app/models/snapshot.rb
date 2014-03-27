class Snapshot < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "800x600>", :thumb => "250x250#" }, :default_url => "desnap.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :in => 0.megabytes..3.megabytes


  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :pets, :posts
end
