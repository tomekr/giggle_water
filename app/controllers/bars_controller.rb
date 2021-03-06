class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy, :make_current]

  # GET /bars
  # GET /bars.json
  def index
    @bars = current_user.bars
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = current_user.bars.build(bar_params)

    respond_to do |format|
      if @bar.save
        # Set current_user's current_bar_id to this bar if their current_bar_id
        # is nil

        current_user.set_current_bar(@bar.id) if current_user.current_bar_id.nil?
        format.html { redirect_to bars_path, notice: 'Bar was successfully created.' }
        format.json { render :show, status: :created, location: @bar }
      else
        format.html { render :new }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @bar }
      else
        format.html { render :edit }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    # If this bar was the current bar, set
    current_user.set_current_bar(nil) if @bar == current_user.current_bar

    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: 'Bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_current
    current_user.set_current_bar(@bar.id)

    #TODO There should probably be a flash message here if there was an error

    redirect_to bars_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = current_user.bars.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:name)
    end
end
