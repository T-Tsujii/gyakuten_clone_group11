class SolutionsController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @solution = Solution.new
    if @solution.save(solution_params)
      redirect_to question_path(@question)
    else
      render template: "questions/show"
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:detail, :question_id)
  end
end