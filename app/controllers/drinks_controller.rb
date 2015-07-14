class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]

  # GET /drinks
  # GET /drinks.json
  def index
    @drinks = Drink.order('name asc').page(params[:page])
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
  end

  # GET /drinks/new
  def new
    @drink = Drink.new
  end

  # GET /drinks/1/edit
  def edit
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorite
    respond_to do |format|
      if FavoriteDrink.create(drink_id: @drink.id, user_id: current_user.id)
        format.html { redirect_to @drink, notice: 'Drink favorited' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { redirect_to @drink }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def unfavorite
    binding.pry
    current_user.favorite_drinks.destroy(current_user.favorite_drinks.where(drink_id: @drink.id))
    respond_to do |format|
      format.html { redirect_to @drink, notice: 'Drink unfavorited' }
      format.json { head :no_content }
    end
  end
    
  def makeable_drinks
    @drinks_missing_hash = current_user.makeable_drinks.sort_by{|count, _| count}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :glass, :directions, :source)
    end
end
