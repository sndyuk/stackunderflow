class QuestionsEditPage
  include Capybara::DSL

  def visit_page(question)
    visit("/questions/#{question.id}/edit")
    self
  end

  def submit
    find('input[type="submit"]').click
    self
  end
end