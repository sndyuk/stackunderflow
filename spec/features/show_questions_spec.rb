require 'rails_helper'

RSpec.feature '質問一覧表示', :type => :feature do

  let(:locale) { 'en' }

  context 'ユーザーがindexページを開く' do
    before(:all) do
      create_list(:question, 3)
    end

    before(:each) do
      visit('/') # FIXME 本当はこの visit を before(:all) 側に置きたいけど表示されるまでたまに待機しなくてテストに失敗するので一旦ここにおく
    end

    scenario '必要な要素があること' do
      expect(page).to have_link('Sign Up', href: '/users/sign_up')
      expect(page).to have_link('Log In', href: '/users/sign_in')
      expect(page).to have_field('q', type: 'text', visible: true)
    end

    scenario '不要な要素がないこと' do
      expect(page).to_not have_link('Log Out')
    end

    scenario '質問が表示されていること' do
      expect(page.all('#questions-list tr')).to have(3).item
    end
  end
end