# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create([
  {
    name: 'Nestle'
  },
  {
    name: 'Spotify'
  },
  {
    name: 'Berita Harian'
  },
  {
    name: 'KFC'
  }
])

Department.create([
  {
    name: 'Human Resource'
  },
  {
    name: 'Finance'
  },
  {
    name: 'Marketing'
  },
  {
    name: 'Sales'
  },
  {
    name: 'Operation'
  },
  {
    name: 'Research & Analysis'
  },
  {
    name: 'Tech'
  }
])

Company.first.departments << Department.first
Company.first.departments << Department.second
Company.first.departments << Department.third

Company.second.departments << Department.first
Company.second.departments << Department.second
Company.second.departments << Department.third
Company.second.departments << Department.fourth

Company.third.departments << Department.second
Company.third.departments << Department.third
Company.third.departments << Department.fifth

Employee.create([
  {
    name: 'Andy',
    age: '26',
    role: 0,
    company_id: Company.first.id,
    department_id: Company.first.departments.first.id
  },
  {
    name: 'Lily',
    age: '21',
    role: 1,
    company_id: Company.first.id,
    department_id: Company.first.departments.first.id
  },
  {
    name: 'Matt',
    age: '30',
    role: 2,
    company_id: Company.first.id,
    department_id: Company.first.departments.first.id
  },
  {
    name: 'Brandon',
    age: '19',
    role: 1,
    company_id: Company.first.id,
    department_id: Company.first.departments.second.id
  },
  {
    name: 'Lars',
    age: '40',
    role: 2,
    company_id: Company.second.id,
    department_id: Company.second.departments.first.id
  }
])
