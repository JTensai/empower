class QuizResultsController < ApplicationController

  load_and_authorize_resource :except => :results_page
  before_filter :authorize, only: [:index, :show, :destroy]

  def index
    @quiz_results = QuizResult.all
  end

  def show
    @quiz_result = QuizResult.find(params[:id])
    @quiz_taken = Quiz.find(@quiz_result.quiz_id)
    @the_results = JSON.parse(@quiz_result.result, :symbolize_names => true)
  end

  def results_page
    @quiz_result = QuizResult.find(params[:id])
    @quiz_taken = Quiz.find(@quiz_result.quiz_id)
    @the_results = JSON.parse(@quiz_result.result, :symbolize_names => true)
    @score = 0
    @the_results.each do |r|
      unless r[:weight] == nil
        @score = @score + r[:weight]
      end
    end
  end

  def ad_page
    @quiz_taken = Quiz.find(@quiz_result.quiz_id)
  end

  def new
    @quiz_result = QuizResult.new
    @quiz_given = Quiz.find(params[:id])
  end

  def create
    @quiz_result = QuizResult.new(params[:quiz_result])
    @quiz_result.quiz_id = params[:quiz_taken].to_i
    @quiz_taken = Quiz.find(@quiz_result.quiz_id)
    
    @result_array = []
    c = params[:question_count].to_i                  # Determines number of questions on the survey
    1.upto(c) do |i|                                  # Loops through each question
      p = params["question_#{i}"]
      unless p == nil
        eval = eval(p)                                  # Changes param from a sting to a hash
        @result_array << eval                           # Adds the hash to the results array
      end
    end

    @quiz_result.result = @result_array.to_json

    respond_to do |format|
      if @quiz_result.save
        if @quiz_taken.ad_url != ""
          format.html { redirect_to ad_page_path(@quiz_result) }
        elsif @quiz_taken.image_result == true
          format.html { redirect_to results_page_path(@quiz_result) }
        else
          format.html { redirect_to @quiz_result }
          # first need to create quiz_thank_you_path before below line will work
          #format.html { redirect_to quiz_thank_you_path }
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @quiz_result = QuizResult.find(params[:id])
    @quiz_result.destroy

    respond_to do |format|
      format.html { redirect_to quiz_results_url }
    end
  end

end
