# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
# Refinery::Pages::Engine.load_seed

# Added by Refinery CMS News engine
# Refinery::News::Engine.load_seed

# Added by Refinery CMS Inquiries engine
# Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Contact Types extension
# Refinery::ContactTypes::Engine.load_seed

# Added by Refinery CMS Venues extension
Refinery::Calendar::Engine.load_seed

# Added by Refinery CMS Employees extension
Refinery::Employees::Engine.load_seed

# Added by Refinery CMS Employers extension
Refinery::Inquiries::Engine.load_seed

Refinery::EmployerInquiries::Engine.load_seed

Refinery::HempTemps::Engine.load_seed
