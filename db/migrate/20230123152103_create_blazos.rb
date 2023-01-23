class CreateBlazos < ActiveRecord::Migration[7.0]
  def change
    create_table :blazos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :abstract
      t.text :content

      t.timestamps
    end
  end
end
