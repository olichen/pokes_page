class PokesController < ApplicationController
  before_action :set_poke, only: [:show, :edit, :update, :destroy]

  # GET /pokes
  # GET /pokes.json
  def index
    @pokes = Poke.all.order(:order)
  end

  # GET /pokes/1
  # GET /pokes/1.json
  def show
  end

  # GET /pokes/new
  def new
    @poke = Poke.new
  end

  # GET /pokes/1/edit
  def edit
  end

  # POST /pokes
  # POST /pokes.json
  def create
#    @poke = Poke.new(poke_params)
#
#    respond_to do |format|
#      if @poke.save
#        format.html { redirect_to @poke, notice: 'Poke was successfully created.' }
#        format.json { render :show, status: :created, location: @poke }
#      else
#        format.html { render :new }
#        format.json { render json: @poke.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /pokes/1
  # PATCH/PUT /pokes/1.json
  def update
#    respond_to do |format|
#      if @poke.update(poke_params)
#        format.html { redirect_to @poke, notice: 'Poke was successfully updated.' }
#        format.json { render :show, status: :ok, location: @poke }
#      else
#        format.html { render :edit }
#        format.json { render json: @poke.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # DELETE /pokes/1
  # DELETE /pokes/1.json
  def destroy
#    @poke.destroy
#    respond_to do |format|
#      format.html { redirect_to pokes_url, notice: 'Poke was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poke
      @poke = Poke.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poke_params
      params.require(:poke).permit(:name, :weight, :order)
    end
end
