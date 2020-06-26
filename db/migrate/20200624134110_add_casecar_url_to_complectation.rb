class AddCasecarUrlToComplectation < ActiveRecord::Migration[5.2]
  def change
    add_column :complectations, :casecar_url, :string
  end
end
