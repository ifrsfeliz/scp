class StudentProjectAssociation < ActiveRecord::Migration
  def change
    create_table :member_students do |t|
      t.references :project
      t.references :student
      t.string :tipo_vinculo

      t.timestamps null: false
    end
  end
end
