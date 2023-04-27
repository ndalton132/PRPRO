class AddAttributeToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :one, :integer
    add_column :projects, :two, :integer
  end
end
