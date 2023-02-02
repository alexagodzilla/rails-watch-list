class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new
  end

# Empty instance just to send to rails to say what the form needs to do
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id), notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end

end
