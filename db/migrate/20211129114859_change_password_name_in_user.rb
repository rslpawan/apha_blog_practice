class ChangePasswordNameInUser < ActiveRecord::Migration[6.1]
  def change

  end

  def up
    change_column :user, :password_digest, :string
  end

  def down
    change_column :user, :password, :string
  end
end
