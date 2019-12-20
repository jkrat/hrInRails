require 'faker'

class FakeDataGenerator

  def create_employees
    regions_list = []
    ['North', 'East', 'West',].each do |reg|
      locations = []
      4.times do |n|
        locations.push(Faker::Address.city)
      end
      regions_list.push( reg: locations)
    end
    organization_list = Organization.where.not(name: 'Thirtysixteen').select(:id)
    100.times do |n|
      first_name = Faker::Name.first_name
      region = regions_list.shuffle.first.key
      e = Employee.new()
      e.first_name = first_name
      e.last_name = Faker::Name.last_name
      e.email = Faker::Internet.email(name: first_name)
      e.start_date = Faker::Date(from: 10.years.ago, to: 10.days.ago)
      e.location = regions[region].shuffle.first
      e.region = region
      e.department = [0,1,2].shuffle.first
      e.status = 0
      e.permission_level = 0
      e.organization_id = organization_list.shuffle.first
    end
  end
end


