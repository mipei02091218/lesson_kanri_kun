class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true


  enum role: { student: 'student', teacher: 'teacher', admin: 'admin' }

  after_initialize :set_default_role, if: :new_record?
  before_validation :restrict_role_assignment, on: :create 

  private
       
  def set_default_role
    self.role ||= "student"
  end

  def restrict_role_assignment
    if User.count > 0
      self.role = 'student'
    end
  end

end
