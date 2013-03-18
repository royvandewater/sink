class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :rdio_token
      t.string :rdio_secret

      t.timestamps
    end
  end
end
