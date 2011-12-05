# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

account1 = Factory.create(:account, subdomain: 'test')
account2 = Factory.create(:account, subdomain: 'test2')
Factory.create(:user, email: "test1@email.com", account: account1)
Factory.create(:user, email: "test2@email.com", account: account2)
