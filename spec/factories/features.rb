FactoryGirl.define do
  factory :user, aliases: [:owner] do
    display_name 'Takashi'
    sequence(:email) { |n| "takashi.#{n}.@example.com" }
    password 'takashi1234'
  end

  factory :question do
    name 'RubyとRailsの違いを教えてください！'
    post_text 'Pearlとなにが違うんでしょうか？'
    association :owner
  end
end
