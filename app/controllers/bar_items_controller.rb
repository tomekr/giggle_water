class BarItemsController < ApplicationController
  before_action :set_bar_item, only: [:show, :edit, :update, :destroy]

  # GET /bar_items
  # GET /bar_items.json
  def index
    @bar_items = BarItem.all
  end

  # GET /bar_items/1
  # GET /bar_items/1.json
  def show
  end

  # GET /bar_items/new
  def new
    @bar_item = BarItem.new
  end

  # GET /bar_items/1/edit
  def edit
  end

  # POST /bar_items
  # POST /bar_items.json
  def create
    @bar_item = BarItem.new(bar_item_params)

    respond_to do |format|
      if @bar_item.save
        format.html { redirect_to @bar_item, notice: 'Bar item was successfully created.' }
        format.json { render :show, status: :created, location: @bar_item }
      else
        format.html { render :new }
        format.json { render json: @bar_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bar_items/1
  # PATCH/PUT /bar_items/1.json
  def update
    respond_to do |format|
      if @bar_item.update(bar_item_params)
        format.html { redirect_to @bar_item, notice: 'Bar item was successfully updated.' }
        format.json { render :show, status: :ok, location: @bar_item }
      else
        format.html { render :edit }
        format.json { render json: @bar_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bar_items/1
  # DELETE /bar_items/1.json
  def destroy
    @bar_item.destroy
    respond_to do |format|
      format.html { redirect_to bar_items_url, notice: 'Bar item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar_item
      @bar_item = BarItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_item_params
      params.require(:bar_item).permit(:ingredient_id, :bar_id)
    end
end
