class BookIssuesController < ApplicationController
  def index
    @book_issues = BookIssue.where(status: [0,3])
  end

  def record
    @book_issues = BookIssue.where(status: [1,2,4])
  end

  
  def myrecord
    @myrecords = BookIssue.where(user_id: current_user.id)
  end

  def student
    @student = BookIssue.where(user_id: params[:id])
  end  

  # def new
  #   @book_issue = BookIssue.new(user_id: current_user.id, book_id: params[:id])
  # end

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

  # def edit
  #   @book_issue = BookIssue.find(params[:id])
  # end

  def update
    @book_issue = BookIssue.find(params[:id])
    updation = @book_issue.update(status: params[:status])
    if updation
      redirect_back(fallback_location: root_path) 
      flash.notice = "status changed"
    else
      flash.alert = @book_issue.errors.messages
      redirect_to homes_path
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
