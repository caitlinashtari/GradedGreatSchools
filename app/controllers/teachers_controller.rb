class TeachersController < ApplicationController
  def new
    @school = School.find(params[:school_id])
    @teacher = @school.teachers.new
  end

  def create
    @school = School.find(params[:school_id])
    @teacher = @school.teachers.new(teacher_params)
    @teacher.user_id = current_user.id
    @teacher.school_id = params[:school_id]
    if @teacher.save
      redirect_to school_path(@school)
    else
      render :new
    end
  end

  def edit
    @school = School.find(params[:school_id])
    @teacher = Teacher.find(params[:id])
  end

  def update
    @school = School.find(params[:school_id])
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  def show
    @school = School.find(params[:school_id])
    @teacher = Teacher.find(params[:id])
  end

private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :grade_level, :subject, :school_id, :user_id)
  end
end
