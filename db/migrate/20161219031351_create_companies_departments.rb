class CreateCompaniesDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :companies_departments do |t|
      t.integer :company_id
      t.integer :department_id
    end
  end
end
