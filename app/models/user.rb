class User < ApplicationRecord
belongs_to :airport
has_many :bookings,dependent: :destroy
has_many :tickets, dependent: :destroy
after_create :set_default_role
belongs_to :role, optional: true
# has_one :flight
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: [ employee: 0, admin: 1 ]

  validates :phone, numericality: { only_integer: true },length: { is:10 } 

  validates :name, presence: true, length: { minimum: 5 }

  validates :age, numericality: { only_integer: true }

  validates_each :name do |record, attr, value|
      record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

    def full_name
      "#{name} #{age}"
    end

    private 
    def set_default_role
      self.update(role_id: Role.find_by(code: 'employee').id)
    end
    
end
