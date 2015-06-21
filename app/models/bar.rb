class Bar < ActiveRecord::Base
  has_many :bar_items, dependent: :destroy

  belongs_to :user
end
