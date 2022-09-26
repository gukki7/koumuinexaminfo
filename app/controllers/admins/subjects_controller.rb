class Admins::SubjectsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def show
    @subject = Subject.find(params[:id])
  end

  def index
    @subjects = Subject.all
  end

  def new
    @subjects = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to admins_subject_path(@subject)
    else
      redirect_to new_admins_subject_path
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to admins_subject_path(@subject)
    else
      redirect_to edit_admins_subject_path(@subject)
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :introduction, :method)
  end
end
