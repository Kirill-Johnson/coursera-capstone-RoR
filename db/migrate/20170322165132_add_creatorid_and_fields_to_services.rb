class AddCreatoridAndFieldsToServices < ActiveRecord::Migration
  def change
    add_column :services, :creator_id, :integer
    add_column :services, :description, :text
    add_column :services, :p_note, :text
  end
end
