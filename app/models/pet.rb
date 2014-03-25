class Pet < ActiveRecord::Base
  belongs_to :user


  def age
    dob = self.dob.to_date
    currentyear = Time.now.to_date
    currentyear.year - dob.year - ((currentyear.month > dob.month || (currentyear.month == dob.month && currentyear.day >= dob.day)) ? 0 : 1)
  end

end
