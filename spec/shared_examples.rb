RSpec.shared_examples 'length of' do |field, min, max|
  it do
      should validate_length_of(field).
      is_at_least(min).is_at_most(max)
  end
end
