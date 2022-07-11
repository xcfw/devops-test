class CreateShaManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :sha_managers do |t|
      t.string :path
      t.string :sha

      t.timestamps
    end
  end
end
