class Bar < ActiveRecord::Base
  has_many :bar_items, dependent: :destroy

  belongs_to :user

  def current?
    self == self.user.current_bar
  end
end
