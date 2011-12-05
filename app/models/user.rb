class User < ActiveRecord::Base
  belongs_to :account
  has_many :notes
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.find_for_authentication(conditions={})
    conditions[:account_id] = Account.find_by_subdomain(conditions.delete(:subdomain)).id
    super(conditions)
  end

end
