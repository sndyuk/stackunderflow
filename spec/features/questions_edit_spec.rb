require 'rails_helper'
require 'pages/questions_edit_page'

RSpec.feature '質問編集', :type => :feature do
  given(:questions_edit) { QuestionsEditPage.new }

  around(:each) do |example|
    DatabaseCleaner.start
    begin
      example.run
    ensure
      DatabaseCleaner.clean
    end
  end

  scenario '権限確認' do
    question = create(:question)
    questions_edit.visit_page(question)

    ログインしてなければサインイン画面が開く
  end

  def ログインしてなければサインイン画面が開く
    expect(page.current_path).to eq('/users/sign_in')
  end


  scenario '初期表示確認' do
    sign_in
    question = create(:question)
    questions_edit.visit_page(question)
  end
end