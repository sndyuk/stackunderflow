require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :post_text => "MyText"
      ),
      Answer.create!(
        :post_text => "MyText"
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
