class AddStatusToReportsFix < ActiveRecord::Migration
  def change
    add_column :reports, :status, :integer, default: 0
  end
end
