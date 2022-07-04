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

RSpec.shared_examples "graphql request shouldn't to be empty" do |result_scope|
  it "should return #{result_scope}" do
    result = PersonalAutoAssitatntSchema.execute(query)
    expect(result['data'][result_scope]).not_to be_empty
  end
end

RSpec.shared_examples 'graphql query result should to be' do |result_scope|
  it "should return #{result_scope}" do
    result = PersonalAutoAssitatntSchema.execute(query)
    expect(result['data'][result_scope]).to be
  end
end

RSpec.shared_examples 'mutation return response' do 
  it description do
    result = PersonalAutoAssitatntSchema.execute(mutation,
                                                 variables: input_variables)
                                                 
    expect(result['data'][mutation_resolver]).not_to be_empty
  end
end
