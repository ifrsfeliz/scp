class ResearchGroupsController < ApplicationController
  before_action :set_research_group, only: [:show, :edit, :update, :destroy]

  # GET /research_groups
  # GET /research_groups.json
  def index
    @research_groups = ResearchGroup.all
  end

  # GET /research_groups/1
  # GET /research_groups/1.json
  def show
  end

  # GET /research_groups/new
  def new
    @research_group = ResearchGroup.new
  end

  # GET /research_groups/1/edit
  def edit
  end

  # POST /research_groups
  # POST /research_groups.json
  def create
    @research_group = ResearchGroup.new(research_group_params)

    respond_to do |format|
      if @research_group.save
        format.html { redirect_to @research_group, notice: 'Research group was successfully created.' }
        format.json { render :show, status: :created, location: @research_group }
      else
        format.html { render :new }
        format.json { render json: @research_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_groups/1
  # PATCH/PUT /research_groups/1.json
  def update
    respond_to do |format|
      if @research_group.update(research_group_params)
        format.html { redirect_to @research_group, notice: 'Research group was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_group }
      else
        format.html { render :edit }
        format.json { render json: @research_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_groups/1
  # DELETE /research_groups/1.json
  def destroy
    @research_group.destroy
    respond_to do |format|
      format.html { redirect_to research_groups_url, notice: 'Research group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_group
      @research_group = ResearchGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_group_params
      params.require(:research_group).permit(:nome, :professor_id, :ultima_verificacao)
    end
end
