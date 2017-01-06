AddCompanyMutation = GraphQL::Relay::Mutation.define do
  name "Add Company"

  input_field :companyName, !types.String

  return_field :company, CompanyType

  resolve ->(object, inputs, ctx) {
    company = Company.new
    company.name = inputs[:companyName]
    company.save
    {
      company: company
    }
  }
end
