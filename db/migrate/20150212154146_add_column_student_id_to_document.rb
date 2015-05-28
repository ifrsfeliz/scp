class AddColumnStudentIdToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :student
  end
end
