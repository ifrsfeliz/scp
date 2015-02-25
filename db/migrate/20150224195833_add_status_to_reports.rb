class AddStatusToReports < ActiveRecord::Migration
  def change
    add_column :reports, :entregue, :boolean
  end
end
