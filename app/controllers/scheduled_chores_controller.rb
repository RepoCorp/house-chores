class ScheduledChoresController < ApplicationController
  before_action :set_scheduled_chore, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_chores
  # GET /scheduled_chores.json
  def index
    @scheduled_chores = ScheduledChore.all
  end

  # GET /scheduled_chores/1
  # GET /scheduled_chores/1.json
  def show
  end

  # GET /scheduled_chores/new
  def new
    @scheduled_chore = ScheduledChore.new
  end

  # GET /scheduled_chores/1/edit
  def edit
  end

  # POST /scheduled_chores
  # POST /scheduled_chores.json
  def create
    @scheduled_chore = ScheduledChore.new(scheduled_chore_params)

    respond_to do |format|
      if @scheduled_chore.save
        format.html { redirect_to @scheduled_chore, notice: 'Scheduled chore was successfully created.' }
        format.json { render :show, status: :created, location: @scheduled_chore }
      else
        format.html { render :new }
        format.json { render json: @scheduled_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_chores/1
  # PATCH/PUT /scheduled_chores/1.json
  def update
    respond_to do |format|
      if @scheduled_chore.update(scheduled_chore_params)
        format.html { redirect_to @scheduled_chore, notice: 'Scheduled chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduled_chore }
      else
        format.html { render :edit }
        format.json { render json: @scheduled_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_chores/1
  # DELETE /scheduled_chores/1.json
  def destroy
    @scheduled_chore.destroy
    respond_to do |format|
      format.html { redirect_to scheduled_chores_url, notice: 'Scheduled chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_chore
      @scheduled_chore = ScheduledChore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduled_chore_params
      params.require(:scheduled_chore).permit(:chore_id, :user_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end
end
