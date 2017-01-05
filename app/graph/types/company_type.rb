CompanyType = GraphQL::ObjectType.define do
  name "Company"
  description "company information"

  field :name, types.String, "Name of Company"
  field :employees, types[EmployeeType], 'employees in this company'
end
