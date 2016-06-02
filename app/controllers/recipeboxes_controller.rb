class RecipeboxesController < ApplicationController

  def index
    @recipeboxes = Recipebox.all
  end

  def show
    @recipebox = Recipebox.find(params[:id])
  end

  def new
    @recipebox = Recipebox.new
  end

  def create
    @recipebox = Recipebox.new(recipebox_params)
    @recipebox.user = User.find(2)

    if @recipebox.save
      flash[:success] = "You have created your recipe successfully!"
      redirect_to recipeboxes_path
    else
      render :new
    end
  end

  private

  def recipebox_params
    params.require(:recipebox).permit(:name, :summary, :description)
  end

end
