class AddJobToWork < ActiveRecord::Migration[5.2]
  def change
    add_reference :service_works, :service_job, foreign_key: true
  end
end
