class AddSrcToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :src, :string
  end
end
