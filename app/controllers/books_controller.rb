class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
     @book = Book.new(book_params)
    if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
    else
        #indexアクションと同じ
        @books = Book.all
        render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) #（）内の指定の意味はprivate内のbook_paramsのtitle とbobyを引き出している
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(@book)
    else
        @books = Book.all
        render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
