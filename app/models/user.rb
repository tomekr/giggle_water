class User < ActiveRecord::Base
  has_many :bars

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_bar
    self.bars.find(self.current_bar_id)
  end

  def set_current_bar(bar_id)
    self.current_bar_id = bar_id
    self.save
  end
end
