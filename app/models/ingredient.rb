class Ingredient < ActiveRecord::Base
  has_many :bar_items
  has_many :drink_items

  # Validations
  validates :name, uniqueness: true, presence: true

  before_destroy :ensure_not_referenced_by_any_bar_item
  before_destroy :ensure_not_referenced_by_any_drink_item

  private

    def ensure_not_referenced_by_any_bar_item
      if bar_items.empty?
        return true
      else
        errors.add(:base, 'Bar items present')
        return false
      end
    end

    def ensure_not_referenced_by_any_drink_item
      if drink_items.empty?
        return true
      else
        errors.add(:base, 'Drink items present')
        return false
      end
    end
end
