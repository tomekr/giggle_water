class IngredientPolicy
  attr_reader :current_user, :ingredient

  def initialize(current_user, ingredient)
    @current_user = current_user
    @ingredient = ingredient
  end

  def update?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end
end
