require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:sport) }
  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:moving_time) }
end
