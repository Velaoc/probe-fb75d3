class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      # Guestbook entry: name is optional, the message itself is required
      # and capped short so the wall stays scannable.
      t.string :name
      t.text :body, null: false

      t.timestamps
    end
  end
end
