class AddColumnStudentIdToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :student, index: true
    add_foreign_key :documents, :students
  end
end
