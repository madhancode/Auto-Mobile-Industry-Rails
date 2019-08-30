class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :buyer
      t.references :supplier
      t.references :product, foreign_key: true
      t.integer :req_quantity
      t.integer :given_quantity
      t.string :status

      t.timestamps
    end
  end
end
