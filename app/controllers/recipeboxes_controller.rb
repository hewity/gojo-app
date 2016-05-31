class RecipeboxesController < ApplicationController

def index
  @recipeboxes = Recipebox.all
end

def show
  @recipebox = Recipebox.find(params[:id])
end
#
# def new
#   @recipebox = Recipebox.new
# end
#
#
# def create
#   @recipebox = Recipebox.new(recipebox_params)
#
# end
#
# private
#
# def recipebox_params
#   params.require(:recipebox).permit()
end
