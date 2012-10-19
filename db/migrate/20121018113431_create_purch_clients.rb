class CreatePurchClients < ActiveRecord::Migration
  def change
    create_table :purch_clients do |t|
      t.string :name

      t.timestamps
    end
  end
end
