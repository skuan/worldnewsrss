class CreateUsas < ActiveRecord::Migration
  def change
    create_table :usas do |t|
      t.text :title
      t.string :url
      t.string :author
      t.string :date
      t.text :summary

      t.timestamps
    end
  end
end
