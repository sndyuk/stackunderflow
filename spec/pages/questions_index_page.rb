class QuestionsIndexPage
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end


  def select_next_page
    find('a', text: 'Next').click
  end

  def select_first_page
    find('.first a').click
  end
end