class AddThingIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :thing_id, :integer
  end
end
