class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :snapshot
  belongs_to :user
end
