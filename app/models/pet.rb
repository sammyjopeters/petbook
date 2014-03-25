class Pet < ActiveRecord::Base
  belongs_to :user
  # pets have pictures that can be uploaded with paperclip
  has_attached_file :picture, :styles => { :medium => "350x350>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def age
    dob = self.dob.to_date
    currentyear = Time.now.to_date
    currentyear.year - dob.year - ((currentyear.month > dob.month || (currentyear.month == dob.month && currentyear.day >= dob.day)) ? 0 : 1)
  end

end
