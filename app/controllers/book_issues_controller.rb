class BookIssuesController < ApplicationController
  def index
    @book_issues = BookIssue.all
  end

  def show
    @book_issues = BookIssue.where(params[:user_id])
  end

  def record
    @book_issues = BookIssue.all
  end
  
  def new
    @book_issue = BookIssue.new(user_id: current_user.id, book_id: params[:id])
  end

  def create
    @book_issue = BookIssue.new(book_issue_params)

    if @book_issue.save
      redirect_to books_path
      flash.notice = "Book Issue request Successfully created."
    else
      flash.alert = @book_issue.errors.messages
      redirect_to books_path
    end
  end

  def edit
    @book_issue = BookIssue.find(params[:id])
  end

  def update
    @book_issue = BookIssue.find(params[:id])
    if params[:status] == "allot"
      @book_issue.update(status: "allot")
      book_id = BookIssue.find(params[:id]).book_id
      @book = Book.find(book_id)
      qty = @book.qty
      @book.update(qty: qty-1)
    elsif params[:status] == "cancel"
      @book_issue.update(status: "cancel")
    elsif params[:status] == "return"
      @book_issue.update(status: "return")
    elsif params[:status] == "deposit"
      @book_issue.update(status: "deposit")
      book_id = BookIssue.find(params[:id]).book_id
      @book = Book.find(book_id)
      qty = @book.qty
      @book.update(qty: qty+1)
    end     
    if @book_issue.save
      redirect_to book_issues_path
      flash.notice = "status changed"
    else
      flash.alert = @book_issue.errors.messages
      redirect_to book_issues_path
    end
  end

  #  def destroy
  #   @book_issue = BookIssue.find(params[:id])
  #   @book_issue.destroy

  #   redirect_to root_path, status: :see_other
  # end

  private
    def book_issue_params
      params.permit( :user_id, :book_id)
    end
end
