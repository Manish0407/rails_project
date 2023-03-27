class BooksController < ApplicationController
  def index
    @quantity = 0
    @books = Book.all
    @books.each do |book|
      @quantity += book.qty
    end 
    respond_to do |format|
      format.html
      format.json { render json: BookDatatable.new(params, view_context: view_context) }
    end 
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    if params[:q].nil?
      @books = []
    else
      @books = Book.search(params[:q], fields: [:name, :book_author], match: :word_start)
      # @books = Book.search params[:q]
    end
  end

  def book_data
    @books = Book.all
  end

  def hotwire_index
    @books = Book.all.order(created_at: :desc)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path }
        format.json { render :show, status: :created, location: @book }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@book, partial: 'posts/form', locals: { post: @book }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to hotwire_index_path }
        format.json { render :show, status: :created, location: @book }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@book, partial: 'books/form', locals: { book: @book }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def book_params
      params.require(:book).permit(:name, :book_author, :qty)
    end
end
