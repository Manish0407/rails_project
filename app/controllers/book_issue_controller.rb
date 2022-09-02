class BookIssueController < ApplicationController
  def index
    @book_issues = BookIssue.all
  end

  # def show
  #   @book_issue_issue = BookIssue.find(params[:id])
  # end
  
  def new
    @book_issue = BookIssue.new
  end

  def create
    @book_issue = BookIssue.new(book_issue_params)

    if @book_issue.save
      redirect_to @book_issue
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   @book_issue = BookIssue.find(params[:id])
  # end

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

  # private
  #   def book_issue_params
  #     params.require(:book_issue).permit(:book_name, :author, :qty, :status)
  #   end
end
