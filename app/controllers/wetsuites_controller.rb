class WetsuitesController < ApplicationController
  before_action :set_wetsuite, only: [:show, :edit, :update, :destroy]

  # GET /wetsuites
  # GET /wetsuites.json
  def index
    @wetsuites = Wetsuite.all
  end

  # GET /wetsuites/1
  # GET /wetsuites/1.json
  def show
  end

  # GET /wetsuites/new
  def new
    @wetsuite = Wetsuite.new
  end

  # GET /wetsuites/1/edit
  def edit
  end

  # POST /wetsuites
  # POST /wetsuites.json
  def create
    @wetsuite = Wetsuite.new(wetsuite_params)

    respond_to do |format|
      if @wetsuite.save
        format.html { redirect_to @wetsuite, notice: 'Wetsuite was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wetsuite }
      else
        format.html { render action: 'new' }
        format.json { render json: @wetsuite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wetsuites/1
  # PATCH/PUT /wetsuites/1.json
  def update
    respond_to do |format|
      if @wetsuite.update(wetsuite_params)
        format.html { redirect_to @wetsuite, notice: 'Wetsuite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wetsuite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wetsuites/1
  # DELETE /wetsuites/1.json
  def destroy
    @wetsuite.destroy
    respond_to do |format|
      format.html { redirect_to wetsuites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wetsuite
      @wetsuite = Wetsuite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wetsuite_params
      params[:wetsuite]
    end
end
