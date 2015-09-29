require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :name => "MyString",
      :post_text => "MyText"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_name[name=?]", "question[name]"

      assert_select "textarea#question_post_text[name=?]", "question[post_text]"
    end
  end
end
