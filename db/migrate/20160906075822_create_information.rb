class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
