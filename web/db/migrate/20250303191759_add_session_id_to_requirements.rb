class AddSessionIdToRequirements < ActiveRecord::Migration[8.0]
  def change
    add_column :requirements, :session_uuid, :string, limit: 36
    add_index :requirements, :session_uuid
    add_foreign_key :requirements, :sessions, column: :session_uuid, primary_key: :uuid, on_delete: :nullify
  end
end
