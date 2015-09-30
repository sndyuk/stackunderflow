class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.search(params[:q]).order(created_at: :desc, id: :asc).includes(:owner_with_deleted).page(params[:page])

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)

    @question.save!
    redirect_to @question, notice: 'Question was successfully created.'
  end

  def update
    respond_to do |format|
      @question.update!(question_params)
      format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:name, :post_text, images_files: [])
  end
end
