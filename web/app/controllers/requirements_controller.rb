class RequirementsController < ApplicationController
  before_action :set_requirement, only: %i[ show edit update destroy ]

  # GET /requirements or /requirements.json
  def index
    @requirements = requirements
  end

  # GET /requirements/1 or /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements or /requirements.json
  def create
    @requirement = Requirement.new(**requirement_params, session: Current.session)

    respond_to do |format|
      if @requirement.save
        run_classification

        format.html { redirect_to session_requirements_path(Current.session) }
        format.json { render :show, status: :created, location: @requirement }
      else
        @requirements = requirements

        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirements/1 or /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to [Current.session, @requirement], notice: "Requirement was successfully updated." }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1 or /requirements/1.json
  def destroy
    @requirement.destroy!

    respond_to do |format|
      format.html { redirect_to session_requirements_path(Current.session), status: :see_other, notice: "Requirement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def requirement_params
      params.expect(requirement: [ :content, :ethic ])
    end

    def requirements
      @requirements = Current.session.requirements.order(created_at: :desc).limit(6)
    end

    def run_classification
      ClassifyRequirementJob.perform_later(@requirement.id, params[:requirement][:classification_type])
    end
end
