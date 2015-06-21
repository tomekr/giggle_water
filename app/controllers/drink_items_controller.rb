class DrinkItemsController < ApplicationController
  before_action :set_drink_item, only: [:show, :edit, :update, :destroy]

  # GET /drink_items
  # GET /drink_items.json
  def index
    @drink_items = DrinkItem.all
  end

  # GET /drink_items/1
  # GET /drink_items/1.json
  def show
  end

  # GET /drink_items/new
  def new
    @drink_item = DrinkItem.new
  end

  # GET /drink_items/1/edit
  def edit
  end

  # POST /drink_items
  # POST /drink_items.json
  def create
    @drink_item = DrinkItem.new(drink_item_params)

    respond_to do |format|
      if @drink_item.save
        format.html { redirect_to @drink_item, notice: 'Drink item was successfully created.' }
        format.json { render :show, status: :created, location: @drink_item }
      else
        format.html { render :new }
        format.json { render json: @drink_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drink_items/1
  # PATCH/PUT /drink_items/1.json
  def update
    respond_to do |format|
      if @drink_item.update(drink_item_params)
        format.html { redirect_to @drink_item, notice: 'Drink item was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink_item }
      else
        format.html { render :edit }
        format.json { render json: @drink_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drink_items/1
  # DELETE /drink_items/1.json
  def destroy
    @drink_item.destroy
    respond_to do |format|
      format.html { redirect_to drink_items_url, notice: 'Drink item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink_item
      @drink_item = DrinkItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_item_params
      params.require(:drink_item).permit(:ingredient_id, :drink_id)
    end
end
