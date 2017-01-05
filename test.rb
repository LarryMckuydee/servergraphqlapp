EmployeeRolesEnum = GraphQL::EnumType.define do
  name "Employee Roles"
  description "Available roles as a employee"

  Employee.roles.each do |k, v|
    value(k, v)
  end
end

EmployeeType = GraphQL::ObjectType.define do
  name "Employeess"
  description "Get all employees name"

  field :name, types.String, "Name of employee"
  field :age, types.Int, "Age of Employee"
  field :role, types.String, "Role of the Employee"
end

CompanyType = GraphQL::ObjectType.define do
  name "Company"
  description "company information"

  field :name, types.String, "Name of Company"
  # connection :employees, EmployeeType.connection_type
  field :employees, types[EmployeeType], 'employees in this company'
end
# EmployeeType = GraphQL::ObjectType.define do
#   name "Employee"
#   description "This is employee"
#
#   field :employee do
#     type !types.String
#     description "show employee"
#     argument :id, types.ID
#     resolve -> (obj, args, ctx) {
#       if args[:id].blank?
#         Employee.all
#       else
#         Employee.find(args[:id])
#       end
#     }
#   end
# end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "This is query root"

  # field :company do
  #   type types.String
  #   description "company name"
  #   argument :id, types.ID
  #   resolve -> (obj, args, ctx) {
  #     Company.find(args[:id])
  #   }
  # end

  field :employees, types[EmployeeType] do
    resolve -> (obj, args, ctx) {
      Employee.all
    }
  end

  field :company, CompanyType, "Company information for" do
    argument :id, types.ID
    resolve -> (obj, args, ctx) {
      Company.find(args[:id])
    }
  end

  field :companies, types[CompanyType], "Companies information" do
    resolve -> (obj, args, ctx) {
      Company.all
    }
  end


  field :employee_roles, -> { types[String] }, "Available roles as a employee" do
    resolve -> (obj, args, ctx) {
      Employee.roles
    }
  end
end

TestSchema = GraphQL::Schema.define do
  query QueryType
  # mutation EmployeeType
end

TestSchema.execute('{ employee_roles }')
TestSchema.execute('{ employees { roles } }')
TestSchema.execute('{ company(id: 1){ name employees{ name role }}}')
TestSchema.execute('{ company(id: 1){ name employees{ name }}}')
TestSchema.execute('{ companies { name } }')
TestSchema.execute('{ employees { name } }')
TestSchema.execute( '{ employee }')
TestSchema.execute('{ company }')
