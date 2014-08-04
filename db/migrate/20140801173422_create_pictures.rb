class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.string :image_url
      t.boolean :favorite

      t.timestamps
    end
  end
end
