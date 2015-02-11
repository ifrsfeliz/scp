class AddAdminAuthorizationColumnToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :admin_authorization, :boolean, default: false
  end
end
