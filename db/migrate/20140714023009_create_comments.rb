class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.string :commenter
      t.text :body
      t.references :activity
      t.references :user
      t.timestamps
    end
  end
end
