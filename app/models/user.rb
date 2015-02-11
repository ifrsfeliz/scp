class User < ActiveRecord::Base

  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles

  def role?( role )
    !roles.find_by_name( role.to_s ).nil?
  end

  def list_roles
    roles.map(&:name).join(', ')
  end

  private
  def set_default_role
    if self.roles.empty? 
      self.roles << Role.find_by_name('comum')
    end
  end
end
