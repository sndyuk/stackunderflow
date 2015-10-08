require 'rails_helper'
require 'pages/questions_edit_page'

RSpec.feature '質問編集', :type => :feature do
  given(:questions_edit) { QuestionsEditPage.new }
  given(:question) { question = create(:question) }

  around(:each) do |example|
    DatabaseCleaner.start
    begin
      example.run
    ensure
      DatabaseCleaner.clean
    end
  end

  context '未ログイン状態' do
    before(:each) do
      questions_edit.visit_page(question)
    end

    scenario '権限確認' do
      ログインしてなければサインイン画面が開く
    end

    def ログインしてなければサインイン画面が開く
      expect(page.current_path).to eq('/users/sign_in')
    end
  end

  context 'ログイン状態' do
    before(:each) do
      sign_in
      questions_edit.visit_page(question)
    end

    scenario '全項目更新する' do
      expectation = build(:question, name: 'RubyとRailsについて', post_text: 'RubyとRailsについて')
      fill_form(expectation)
      questions_edit.submit
      questions_edit.visit_page(question)

      期待した内容で質問が更新されていること(expectation)
    end

    scenario 'タイトルだけ更新する' do
      expectation = build(:question, name: 'RubyとRailsについて', post_text: question.post_text)
      fill_form(expectation)
      questions_edit.submit
      questions_edit.visit_page(question)

      期待した内容で質問が更新されていること(expectation)
    end

    pending 'タイトルを空にして更新する' do
      expectation = build(:question, name: nil, post_text: question.post_text)
      fill_form(expectation)
      questions_edit.submit
      questions_edit.visit_page(question)

      期待した内容で質問が更新されていること(expectation)
    end

    def fill_form(expectation)
      within('.edit_question') do
        fill_in('question[name]', with: expectation.name)
        fill_in('question[post_text]', with: expectation.post_text)
      end
    end

    def 期待した内容で質問が更新されていること(expectation)
      within('.edit_question') do
        fill_in('question[name]', with: expectation.name)
        fill_in('question[post_text]', with: expectation.post_text)
      end
    end
  end
end