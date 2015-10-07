require 'rails_helper'
require 'pages/questions_index_page'

RSpec.feature '質問一覧表示', :type => :feature do
  given(:questions_index) { QuestionsIndexPage.new }

  around(:each) do |example|
    DatabaseCleaner.start
    begin
      example.run
    ensure
      DatabaseCleaner.clean
    end
  end


  scenario '初期表示確認' do
    create_list(:question, 3)
    questions_index.visit_page

    必要な要素があること
    不要な要素がないこと
    質問が全件表示されていること
  end

  def 必要な要素があること
    expect(page).to have_link('Sign Up', href: '/users/sign_up')
    expect(page).to have_link('Log In', href: '/users/sign_in')
    expect(page).to have_field('q', type: 'text', visible: true)
  end

  def 不要な要素がないこと
    expect(page).to_not have_link('Log Out')
  end

  def 質問が全件表示されていること
    expect(page.all('#questions-list tr')).to have(3).items
  end


  scenario 'ページング確認' do
    create_list(:question, 31)
    questions_index.visit_page

    質問が全件表示されず1ページの上限である30件表示されていること
    次のページに遷移したとき残りの1件が表示されること
    前のページに遷移したとき30件が表示されること
  end

  def 質問が全件表示されず1ページの上限である30件表示されていること
    expect(page.all('#questions-list tr')).to have(30).items
  end

  def 次のページに遷移したとき残りの1件が表示されること
    questions_index.select_next_page
    expect(page.all('#questions-list tr')).to have(1).item
  end

  def 前のページに遷移したとき30件が表示されること
    questions_index.select_first_page
    expect(page.all('#questions-list tr')).to have(30).item
  end
end