class AddColumnAreaIdToResearchGroup < ActiveRecord::Migration
  def change
    add_column :research_groups, :area_id, :integer
  end
end
