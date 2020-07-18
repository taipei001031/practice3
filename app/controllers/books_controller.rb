class BooksController < ApplicationController
  def index
  	@books=Book.all.order(id: "ASC")
  	@book=Book.new
  end

  def create
  	@books=Book.all.order(id: "DESC")
  	@book=Book.new(book_params)
  	if @book.save
  	flash[:notice]="Book was successfully created"
  	   redirect_to book_path(@book.id)
  	else
       render action: :index
  	end
  end

  def edit
  	 @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice]="update was successfully"
      redirect_to book_path(@book.id)
      else
      flash[:notice]="update was error"
      render :edit
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:notice]="delete was successfully"
      redirect_to books_path
  end


  def show
  	@book=Book.find(params[:id])
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
