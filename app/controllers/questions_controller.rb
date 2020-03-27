class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all.order(updated_at: :desc)
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to :action => "index"
    else
      @questions = Question.all.order(updated_at: :desc)
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
      params.require(:question).permit(:title, :detail)
  end

end
