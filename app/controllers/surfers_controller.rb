class SurfersController < ApplicationController
  before_action :set_surfer, only: [:show, :edit, :update, :destroy]

  # GET /surfers
  # GET /surfers.json
  def index
    @surfers = Surfer.all
  end

  # GET /surfers/1
  # GET /surfers/1.json
  def show
  end

  # GET /surfers/new
  def new
    @surfer = Surfer.new
  end

  # GET /surfers/1/edit
  def edit
  end

  # POST /surfers
  # POST /surfers.json
  def create
    @surfer = Surfer.new(surfer_params)

    respond_to do |format|
      if @surfer.save
        format.html { redirect_to @surfer, notice: 'Surfer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @surfer }
      else
        format.html { render action: 'new' }
        format.json { render json: @surfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surfers/1
  # PATCH/PUT /surfers/1.json
  def update
    respond_to do |format|
      if @surfer.update(surfer_params)
        format.html { redirect_to @surfer, notice: 'Surfer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @surfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surfers/1
  # DELETE /surfers/1.json
  def destroy
    @surfer.delete
    respond_to do |format|
      format.html { redirect_to surfers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surfer
      @surfer = Surfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surfer_params
      params.require(:surfer).permit(:nickname, :home_spot, :goofy_regular, :style, :best_trick)
    end
end
