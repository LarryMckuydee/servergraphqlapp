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
    # make it compulsory to have ID else will run into cannot find Company with 'id'=
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Company.find(args[:id])
    }
  end

  field :companies, types[CompanyType], "Companies information" do
    resolve -> (obj, args, ctx) {
      Company.all
    }
  end

end
