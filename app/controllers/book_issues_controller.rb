class BookIssuesController < ApplicationController
  def index
    @book_issues = BookIssue.all
  end

  def show
    @book_issue = BookIssue.find(params[:id])
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

  # def update
  #   @book_issue = BookIssue.find(params[:id])

  #   if @book_issue.update(book_issue_params)
  #     redirect_to @book_issue
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  #  def destroy
  #   @book_issue = BookIssue.find(params[:id])
  #   @book_issue.destroy

  #   redirect_to root_path, status: :see_other
  # end

  private
    def book_issue_params
      params.permit( :user_id, :book_id )
    end
end
