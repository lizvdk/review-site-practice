class TreesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @trees = Tree.all.order(updated_at: :desc)
  end

  def show
    @tree = Tree.find(params[:id])
  end

  def new
    @tree = Tree.new
  end

  def create
    @tree = current_user.trees.new(tree_params)
    if @tree.save
      redirect_to tree_path(@tree), notice: 'Tree submitted successfully'
    else
      render :new
    end
  end

  private

  def tree_params
    params.require(:tree).permit(:title, :description, :image)
  end
end
