class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :address, :string
    add_column :users, :address_alt, :string
    add_column :users, :city, :string
    add_column :users, :state, :string, :default => "NY"
    add_column :users, :zip, :integer
  end
end
