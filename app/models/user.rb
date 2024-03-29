 class User < ActiveRecord::Base

   ratyrate_rater
  # Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books

#  attr_accessor :name, :email #CHECK _ WHY DELETES USER NAME FROM VIEWS

  # User::Roles
  # The available roles
  Roles = [:admin, :default]

  def is?(requested_role)
    self.role == requested_role.to_s
  end
end
