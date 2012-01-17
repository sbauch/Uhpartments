class CreateSubways < ActiveRecord::Migration
  def change
    create_table :subways do |t|
      t.string :name
      t.float :lat
      t.float :lon
      t.string :train1
      t.string :train2
      t.string :train3
      t.string :train4
      t.string :train5

      t.timestamps
    end
  end
end
