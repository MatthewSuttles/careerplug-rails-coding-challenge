require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'requires description' do
    expect(Comment.new).to_not be_valid
  end
  it 'will be associated with a job' do
    com = Comment.new
    expect(com.job).to_not raise_error
  end

end
