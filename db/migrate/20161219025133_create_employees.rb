class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.string :phone
      t.integer :company_id
      t.integer :department_id

      t.timestamps
    end
  end
end
