MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'mutation for all types'

  field :addCompany, field: AddCompanyMutation.field
end
