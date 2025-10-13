class ToolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_owned_tool, only: [:edit, :update, :destroy]
  before_action :set_public_tool, only: :show

  def index
    @tools = Tool.all
  end

  def show
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

  def set_public_tool
    @tool = Tool.find(params[:id])
  end

  def set_owned_tool
    @tool = current_user.tools.find_by(id: params[:id])
    if @tool.nil?
      redirect_to tools_path, alert: "L'outil n'existe pas"
      return
    end
  end
end
