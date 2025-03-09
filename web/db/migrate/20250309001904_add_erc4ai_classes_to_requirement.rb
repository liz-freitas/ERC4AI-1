class AddErc4aiClassesToRequirement < ActiveRecord::Migration[8.0]
  def change
    add_column :requirements, :erc4ai_classes, :string
  end
end
