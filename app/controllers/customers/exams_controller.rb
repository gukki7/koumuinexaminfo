class Customers::ExamsController < ApplicationController
  def show
  @exam = Exam.find(params[:id])
  end

  def index
  @exams = Exam.all
  end
end
