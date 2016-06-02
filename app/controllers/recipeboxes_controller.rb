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

  def edit
    @recipebox = Recipebox.find(params[:id])
  end
  def update
    @recipebox = Recipebox.find(params[:id])
    if @recipebox.update(recipebox_params)
      flash[:success] = "Recipe updated successfully!"
      redirect_to recipebox_path(@recipebox)
    else
      render :edit

  end
end
  private

  def recipebox_params
    params.require(:recipebox).permit(:name, :summary, :description)
  end

end
