class AddPasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string, first: true
  end
end
