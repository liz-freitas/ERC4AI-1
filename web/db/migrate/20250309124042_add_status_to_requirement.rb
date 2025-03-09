class AddStatusToRequirement < ActiveRecord::Migration[8.0]
  def change
    add_column :requirements, :status, :integer, default: 0
  end
end
