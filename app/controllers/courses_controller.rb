class CoursesController < ApplicationController
  skip_before_action :require_user
  before_action :find_course, only: [:edit, :update, :show, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "This new course has been saved"
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice] = 'You have successfully updated the course'
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    flash[:danger] = 'This course has been deleted'
    redirect_to courses_path
  end 


  private

  def course_params
    params.required(:course).permit(:short_name, :name, :description)
  end

  def find_course
    @course = Course.find(params[:id])
  end





end
