class AddTokenToReports < ActiveRecord::Migration
  def change
    add_column :reports, :access_token, :string
  end
end
