class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).order(title: :asc)
  end
end