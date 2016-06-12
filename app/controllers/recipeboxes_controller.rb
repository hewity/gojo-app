class RecipeboxesController < ApplicationController

  def index
    @recipeboxes = Recipebox.paginate(page: params[:page], per_page: 4)
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

def like
   @recipebox = Recipebox.find(params[:id])
   like = Like.create(like: params[:like], user: User.first, recipebox: @recipebox)
   if like.valid?
     flash[:success] = "Your selection was succesful"
     redirect_to :back
   else
     flash[:danger] = "You can only like/dislike a recipe once"
     redirect_to :back
   end
 end

  private

  def recipebox_params
    params.require(:recipebox).permit(:name, :summary, :description, :paperclip_image)
  end

end
