class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  #def new
    # não existe porque a pagina new não existe, o form está na pagina inicial junto com index
  #end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      @lists = List.all
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :image_url)
    # params.require(:nomeDoModel).permit(:camposQuePermiteAcesso)
  end
end
