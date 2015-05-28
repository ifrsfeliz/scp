class AddColumnProfessorIdToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :professor
  end
end
