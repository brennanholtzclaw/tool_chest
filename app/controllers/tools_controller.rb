class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    find_tool
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "Tool Successfully Created!"
      current_user.tools << @tool if current_user
      session[:most_recent_tool_id] = current_user.tools.last.id if current_user
      # session[:most_recent_tool_id] = @tool.id
      redirect_to tool_path(@tool.id)
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    find_tool
  end
  #
  def update
    find_tool
    if @tool.update(tool_params)
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
  end

  def destroy
    find_tool
    @tool.destroy
    # Tool.destroy(params[:id])
    redirect_to tools_path
  end

  private

  def find_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    # binding.pry
    params.require(:tool).permit(:name, :price, :quantity, :category_id)
  end
end
