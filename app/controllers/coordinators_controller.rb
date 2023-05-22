class CoordinatorsController < ApplicationController
  before_action :set_coordinator, only: %i[ show edit update destroy export_participants]

  # GET /coordinators or /coordinators.json
  def index
    @coordinators = Coordinator.all
  end

  # GET /coordinators/1 or /coordinators/1.json
  def show
  end

  # GET /coordinators/new
  def new
    @coordinator = Coordinator.new
  end

  # GET /coordinators/1/edit
  def edit
  end

  # POST /coordinators or /coordinators.json
  def create
    @coordinator = Coordinator.new(coordinator_params)

    respond_to do |format|
      if @coordinator.save
        format.html { redirect_to coordinator_url(@coordinator), notice: "Coordinator was successfully created." }
        format.json { render :show, status: :created, location: @coordinator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coordinators/1 or /coordinators/1.json
  def update
    respond_to do |format|
      if @coordinator.update(coordinator_params)
        format.html { redirect_to coordinator_url(@coordinator), notice: "Coordinator was successfully updated." }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinators/1 or /coordinators/1.json
  def destroy
    @coordinator.destroy

    respond_to do |format|
      format.html { redirect_to coordinators_url, notice: "Coordinator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_participants
    @enrollments = @coordinator.enrollments
    respond_to do |format|
      format.csv { send_data @enrollments.export_csv, filename: "participants-#{Date.today}.csv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = Coordinator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :phone_number, registry_ids: [])
    end
end
