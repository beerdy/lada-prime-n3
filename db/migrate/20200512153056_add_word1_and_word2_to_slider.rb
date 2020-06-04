class AddWord1AndWord2ToSlider < ActiveRecord::Migration[5.2]
  def change
    add_column :sliders, :word1, :string
    add_column :sliders, :word2, :string
  end
end
