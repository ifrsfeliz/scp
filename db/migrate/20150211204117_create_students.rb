class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :nome
      t.string :cpf
      t.string :rg
      t.string :email
      t.string :telefone
      t.string :celular

      t.timestamps null: false
    end
  end
end
