# frozen_string_literal: true

RSpec.shared_examples 'length of' do |field, min, max|
  it do
    should validate_length_of(field)
      .is_at_least(min).is_at_most(max)
  end
end

RSpec.shared_examples 'set not empty controller instance variable' do |variable_name|
  it "should set #{variable_name}" do
    variable = assigns(variable_name)
    expect(variable).not_to be_empty
  end
end