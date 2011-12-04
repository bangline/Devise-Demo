class Account < ActiveRecord::Base
  has_many :users
  has_many :notes, :through => :users
end
