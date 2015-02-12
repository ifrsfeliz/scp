class AddColumnProfessorIdToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :professor, index: true
    add_foreign_key :documents, :professors
  end
end
