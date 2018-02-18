class AddPhotoUrlToShoes < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :photo_url, :string
  end
end
