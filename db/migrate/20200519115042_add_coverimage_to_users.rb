class AddCoverimageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :coverimage, :string
  end
end
