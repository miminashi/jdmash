class AddRatingColumnToMember < ActiveRecord::Migration
  def change
    add_column :members, :rating, :integer, :default => 1000
  end
end
