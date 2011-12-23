class AddId < ActiveRecord::Migration
  def up
    add_column :buildings, :id, :integer
  end

  def down
  end
end
