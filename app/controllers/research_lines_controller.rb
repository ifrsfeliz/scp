class ResearchLinesController < ApplicationController
  load_and_authorize_resource

  before_action :set_research_line, only: [:show, :edit, :update, :destroy]

  # GET /research_lines
  # GET /research_lines.json
  def index
    @q = ResearchLine.ransack(params[:q])
    @research_lines = @q.result(distinct: true)
  end

  # GET /research_lines/1
  # GET /research_lines/1.json
  def show
  end

  # GET /research_lines/new
  def new
    @research_line = ResearchLine.new
  end

  # GET /research_lines/1/edit
  def edit
  end

  # POST /research_lines
  # POST /research_lines.json
  def create
    @research_line = ResearchLine.new(research_line_params)

    respond_to do |format|
      if @research_line.save
        format.html { redirect_to @research_line, notice: 'Research line was successfully created.' }
        format.json { render :show, status: :created, location: @research_line }
      else
        format.html { render :new }
        format.json { render json: @research_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_lines/1
  # PATCH/PUT /research_lines/1.json
  def update
    respond_to do |format|
      if @research_line.update(research_line_params)
        format.html { redirect_to @research_line, notice: 'Research line was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_line }
      else
        format.html { render :edit }
        format.json { render json: @research_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_lines/1
  # DELETE /research_lines/1.json
  def destroy
    @research_line.destroy
    respond_to do |format|
      format.html { redirect_to research_lines_url, notice: 'Research line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_line
      @research_line = ResearchLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_line_params
      params.require(:research_line).permit(:nome, :research_group_id)
    end
end
