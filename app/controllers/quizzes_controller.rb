class QuizzesController < ApplicationController

  load_and_authorize_resource

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      redirect_to @quiz, notice: "Successfully created Quiz."
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(params[:quiz])
      redirect_to @quiz, notice: "Successfully updated Quiz."
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_url, notice: "Successfully destroyed Quiz."
  end
end