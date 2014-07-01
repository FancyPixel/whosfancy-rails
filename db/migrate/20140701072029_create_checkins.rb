class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.column :direction, :integer, default: 0

      t.timestamps
    end
  end
end
