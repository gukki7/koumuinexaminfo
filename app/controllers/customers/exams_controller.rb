class Customers::ExamsController < ApplicationController
  def show
  @exam = Exam.find(params[:id])
  @genres = Genre.all
  end

  def index
  @exams = Exam.all
  end
end
