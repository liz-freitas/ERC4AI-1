class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    # uuid primary key
    create_table :sessions, id: false do |t|
      t.string :uuid, null: false, index: { unique: true }, primary_key: true, limit: 36
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
