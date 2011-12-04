class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :slug

      t.timestamps
    end
  end
end
