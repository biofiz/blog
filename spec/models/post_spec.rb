require "rails_helper"

describe 'Post' do
  let(:post) { FactoryGirl.create(:post) }

  subject { post }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user) }

  it { should validate_length_of(:title).is_at_least(3).is_at_most(250) }
  it { should validate_length_of(:body).is_at_least(50) }

end
