require 'date'
# ['Employee', 'Manager', 'Admin', 'Super', 'View_Access'].each do |role_name|
#       Role.create! name: role_name
#     end

Organization.create(name: 'Thirtysixteen', slug: 'tsg', is_active: false)
Organization.create(name: 'Vandelay Autos', slug: 'vandelay', is_active: true)
Organization.create(name: 'Chacon Autos', slug: 'chacon', is_active: true)
Organization.create(name: 'Auto USA', slug: 'ausa', is_active: false)

Employee.create(first_name: 'Jim', last_name: 'Kratus', email: 'jk@tsg.com', balance: 16, start_date: DateTime.now, location: 'nwhwy', department: 0, region: 'Dallas - Ft. Worth', status: 0, organization_id: 2, permission_level: 3)
Employee.create(first_name: 'Roberto', last_name: 'Firmino', email: 'rf@tsg.com', balance: 12, start_date: DateTime.now, location: 'arlington', department: 2, region: 'Dallas - Ft. Worth', status: 0, organization_id: 4, permission_level: 0)
Employee.create(first_name: 'Peter', last_name: 'Crouch', email: 'pc@tsg.com', balance: 12, start_date: DateTime.now, location: 'arlington', department: 2, region: 'Dallas - Ft. Worth', status: 0, organization_id: 5, permission_level: 2)
Employee.create(first_name: 'John', last_name: 'Terry', email: 'jt@tsg.com', balance: 12, start_date: DateTime.now, location: 'arlington', department: 1, region: 'Dallas - Ft. Worth', status: 0, organization_id: 3, permission_level: 1)
Employee.create(first_name: 'Thomas', last_name: 'Mueller', email: 'tm@tsg.com', balance: 12, start_date: DateTime.now, location: 'arlington', department: 1, region: 'Dallas - Ft. Worth', status: 0, organization_id: 5, permission_level: 0)
Employee.create(first_name: 'Manuel', last_name: 'Neuer', email: 'mn@tsg.com', balance: 12, start_date: DateTime.now, location: 'arlington', department: 1, region: 'Dallas - Ft. Worth', status: 0, organization_id: 3, permission_level: 0)
Employee.create(first_name: 'James', last_name: 'Milner', email: 'jm@tsg.com', balance: 12, start_date: DateTime.now, location: 'arlington', department: 3, region: 'Dallas - Ft. Worth', status: 0, organization_id: 4, permission_level: 0)

User.create!(email: 'jk@tsg.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', organization_id: 2)
[['rf', 4], ['pc', 5], ['jt',3], ['tm', 5], ['mn', 3], ['jm', 4]].each do |user|
  User.create!(email: "#{user[0]}@tsg.com", password: 'asdfasdf', password_confirmation: 'asdfasdf', organization_id: user[1])
end
