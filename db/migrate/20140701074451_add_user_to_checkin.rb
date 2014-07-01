class AddUserToCheckin < ActiveRecord::Migration
  def change
    add_reference :checkins, :user, index: true
  end
end
