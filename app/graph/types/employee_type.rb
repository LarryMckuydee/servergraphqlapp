EmployeeType = GraphQL::ObjectType.define do
  name "Employeess"
  description "Get all employees name"

  field :name, types.String, "Name of employee"
  field :age, types.Int, "Age of Employee"
  field :role, types.String, "Role of the Employee"
end
