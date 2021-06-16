class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).order(title: :asc).paginate(page: params[:page], per_page: 8)
  end
end