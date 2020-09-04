class CreateServiceJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :service_jobs do |t|
      t.string :title
      t.text :description
      t.text :slave
      t.string :link
      t.string :url
      t.integer :sort
      t.boolean :show

      t.timestamps
    end
  end
end
