class DrinkPolicy
  attr_reader :current_user, :drink

  def initialize(current_user, drink)
    @current_user = current_user
    @drink = drink
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
