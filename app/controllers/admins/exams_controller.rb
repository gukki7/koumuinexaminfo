class Admins::ExamsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def show
    @exam = Exam.find(params[:id])
  end

  def index
    @exams = Exam.all
  end

  def new
    @exams = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to admins_exam_path(@exam)
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
      redirect_to new_admins_exam_path
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update(exam_params)
      redirect_to admins_exam_path(@exam)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admins_exam_path(@item)
    end
  end

  private
  def exam_params
    params.require(:exam).permit(:genre_id, :name, :introduction, :level)
  end
end
