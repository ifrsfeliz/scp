class AddMemberProfessorsTable < ActiveRecord::Migration
  def change
    create_table :member_professors do |t|
      t.references :project
      t.references :professor

      t.timestamps null: false
    end
  end
end
