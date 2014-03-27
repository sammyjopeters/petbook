class Pet < ActiveRecord::Base
  belongs_to :user
  # pets have pictures that can be uploaded with paperclip
  has_attached_file :picture, :styles => { :medium => "450x450#", :thumb => "150x150#" }, :default_url => "defam.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :picture, :in => 0.megabytes..2.megabytes

  def age
    dob = self.dob.to_date
    currentyear = Time.now.to_date
    if dob === Time.now
      "who knows"
    elsif dob.year === Time.now.year
      currentyear.month - dob.month
    else
      currentyear.year - dob.year - ((currentyear.month > dob.month || (currentyear.month == dob.month && currentyear.day >= dob.day)) ? 0 : 1)
    end
  end

end
