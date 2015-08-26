class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy, :add_to_bar, :remove_from_bar]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.order('drink_items_count DESC').page(params[:page]).per(50)
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @used_in = @ingredient.drinks
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    authorize @ingredient

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    authorize @ingredient

    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    authorize @ingredient

    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_bar
    bar_item = current_user.current_bar.bar_items.build(ingredient: @ingredient)

    respond_to do |format|
      if bar_item.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was added to bar.' }
        format.js { render action: "add_or_remove" }
      else
        format.html { redirect_to ingredients_path }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity}
      end
    end
  end

  def remove_from_bar
    bar_item = current_user.current_bar.bar_items.find_by(ingredient: @ingredient)
    bar_item.destroy
    
    respond_to do |format|
      format.html { redirect_to @ingredient, notice: 'Ingredient was removed from bar' }
      format.js { render action: "add_or_remove" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params[:ingredient]
    end
end
