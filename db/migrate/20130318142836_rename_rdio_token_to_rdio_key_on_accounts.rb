class RenameRdioTokenToRdioKeyOnAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |table|
      table.rename :rdio_token, :rdio_key
    end
  end
end
