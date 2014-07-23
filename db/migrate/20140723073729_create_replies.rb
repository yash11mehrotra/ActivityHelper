class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :message_id
      t.string :text

      t.timestamps
    end
  end
end
