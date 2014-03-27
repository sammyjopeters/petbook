class User < ActiveRecord::Base
  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :snapshots, dependent: :destroy

  serialize :following

  # users have pictures that can be uploaded with paperclip
  has_attached_file :picture, :styles => { :medium => "450x450#", :thumb => "150x150#" }, :default_url => "/images/defav.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :picture, :in => 0.megabytes..2.megabytes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
