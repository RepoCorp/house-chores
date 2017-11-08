class ExecutedChoresController < ApplicationController
  before_action :set_executed_chore, only: [:show, :edit, :update, :destroy]

  # GET /executed_chores
  # GET /executed_chores.json
  def index
    @executed_chores = ExecutedChore.all
  end

  # GET /executed_chores/1
  # GET /executed_chores/1.json
  def show
  end

  # GET /executed_chores/new
  def new
    @executed_chore = ExecutedChore.new
  end

  # GET /executed_chores/1/edit
  def edit
  end

  # POST /executed_chores
  # POST /executed_chores.json
  def create
    @executed_chore = ExecutedChore.new(executed_chore_params)

    respond_to do |format|
      if @executed_chore.save
        format.html { redirect_to @executed_chore, notice: 'Executed chore was successfully created.' }
        format.json { render :show, status: :created, location: @executed_chore }
      else
        format.html { render :new }
        format.json { render json: @executed_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /executed_chores/1
  # PATCH/PUT /executed_chores/1.json
  def update
    respond_to do |format|
      if @executed_chore.update(executed_chore_params)
        format.html { redirect_to @executed_chore, notice: 'Executed chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @executed_chore }
      else
        format.html { render :edit }
        format.json { render json: @executed_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executed_chores/1
  # DELETE /executed_chores/1.json
  def destroy
    @executed_chore.destroy
    respond_to do |format|
      format.html { redirect_to executed_chores_url, notice: 'Executed chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_executed_chore
      @executed_chore = ExecutedChore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def executed_chore_params
      params.require(:executed_chore).permit(:chore_id, :user_id)
    end
end
