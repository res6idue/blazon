class BlazosController < ApplicationController
  before_action :set_blazo, only: %i[ show edit update destroy ]

  # GET /blazos or /blazos.json
  def index
    @blazos = Blazo.all.order(created_at: :desc)
  end

  # GET /blazos/1 or /blazos/1.json
  def show
  end

  # GET /blazos/new
  def new
    @blazo = Blazo.new
  end

  # GET /blazos/1/edit
  def edit
  end

  # POST /blazos or /blazos.json
  def create

    @blazo = Blazo.new(blazo_params)
    @blazo.user = current_user
    
    respond_to do |format|
      if @blazo.save
        format.html { redirect_to blazo_url(@blazo), notice: "Blazo was successfully created." }
        format.json { render :show, status: :created, location: @blazo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blazo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blazos/1 or /blazos/1.json
  def update
    respond_to do |format|
      if @blazo.update(blazo_params)
        format.html { redirect_to blazo_url(@blazo), notice: "Blazo was successfully updated." }
        format.json { render :show, status: :ok, location: @blazo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blazo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blazos/1 or /blazos/1.json
  def destroy
    @blazo.destroy

    respond_to do |format|
      format.html { redirect_to blazos_url, notice: "Blazo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blazo
      @blazo = Blazo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blazo_params
      params.require(:blazo).permit(:user_id, :abstract, :content)
    end
end
