class AddPositionToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :x, :integer, default: 0
    add_column :characters, :y, :integer, default: 0
  end
end
