class ToolsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_tool, only: [:edit, :update, :destroy]

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool), notice: "Outil créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tool.update(tool_params)
      redirect_to tool_path(@tool), notice: "Outil mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tool.destroy
    redirect_to tools_path, notice: "Outil supprimé avec succès."
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :category, :price, :condition, :is_available, photos: [])
  end

  def set_tool
    @tool = current_user.tools.find_by(id: params[:id])
    unless @tool.user == current_user
      redirect_to root_path, alert: "Tu n'as pas accès à cet outil."
    end
  end

end
