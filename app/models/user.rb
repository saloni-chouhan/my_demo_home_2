class User < ApplicationRecord
belongs_to :airport
# has_one :flight
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

    enum role: [:employee, :admin]
    
end
