class CreateModificationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :modification_images do |t|

      t.timestamps
    end
  end
end
