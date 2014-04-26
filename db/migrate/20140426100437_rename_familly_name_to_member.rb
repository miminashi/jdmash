class RenameFamillyNameToMember < ActiveRecord::Migration
  def change
    rename_column :members, :familly_name, :family_name
  end
end
