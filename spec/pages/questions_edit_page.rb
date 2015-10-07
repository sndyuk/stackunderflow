class QuestionsEditPage
  include Capybara::DSL

  def visit_page(question)
    visit "/questions/#{question.id}/edit"
    self
  end
end