class SolutionsController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @solution = Solution.new(solution_params)
    # binding.pry
    if @solution.save!
      redirect_to question_path(@question)
    else
      render template: "questions/show"
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:detail)
  end
end