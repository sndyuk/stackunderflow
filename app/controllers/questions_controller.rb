class QuestionsController < ApplicationController

  def index
    @questions = Question.search(params[:q]).order(created_at: :desc, id: :asc).includes(:owner_with_deleted).page(params[:page])

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end