class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:school_id]
      @school = School.find(params[:school_id])
      @review = @school.reviews.new
    elsif params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @review = @teacher.reviews.new
    end
  end

  def create
    if params[:school_id]
      @school = School.find(params[:school_id])
      @review = @school.reviews.new(review_params)
      @review.user_id = current_user.id
      if @review.save
        redirect_to school_path(@school)
      else
        render :new
      end
    elsif params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @review = @teacher.reviews.new(review_params)
      @review.user_id = current_user.id
      if @review.save
        redirect_to school_path(@teacher.school_id)
      else
        render :new
      end
    end

  end

  def edit
    @school = School.find(params[:school_id])
    @review = Review.find(params[:id])
  end

  def update
    @school = School.find(params[:school_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  def destroy
    @school = School.find(params[:school_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to school_path(@school)
  end

private

  def review_params
    params.require(:review).permit(:title, :content, :user_id)
  end
end
