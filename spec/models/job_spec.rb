require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) {Job.new(description: 'I am a job', status: :active, name: 'job', employment_type: :full_time) }

  it 'is invalid without a name' do
    expect (Job.new(description: 'I am a job', status: :active, employment_type: :full_time)).should_not be_valid
  end
  it 'invalid without a description'do
    expect (Job.new(name: 'job', status: :active, employment_type: :full_time)).should_not be_valid
  end
  it 'is invalid without a status' do
    expect (Job.new(description: 'I am a job', name: 'job', employment_type: :full_time)).should_not be_valid
  end
  it 'is invalid without an employment type' do
    expect (Job.new(description: 'I am a job', status: :active, name: 'job')).should_not be_valid
  end

  describe 'associations' do
    it 'has comments' do
     expect{job.comments}.to_not raise_error
    end
    it 'has no comments when created' do
      expect(job.comments).to be_empty
    end

  end

end