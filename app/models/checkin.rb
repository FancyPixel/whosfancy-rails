class Checkin < ActiveRecord::Base

  belongs_to :user
  
  enum direction: { in: 0, out: 1 }

end
