class CreateRequirements < ActiveRecord::Migration[8.0]
  def change
    create_table :requirements do |t|
      t.string :content
      t.boolean :ethic

      t.timestamps
    end
  end
end
