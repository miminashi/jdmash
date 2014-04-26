class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :familly_name
      t.string :url

      t.timestamps
    end
  end
end
