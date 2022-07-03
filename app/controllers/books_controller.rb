class BooksController < ApplicationController



  def create
    @book= Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      flash[:alret] = "Book could not be posted."
      redirect_to edit_book_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book.id)
  end


  private
  def book_params
    params.permit(:title,:body)
  end


end
