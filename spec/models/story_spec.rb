require "rails_helper"
RSpec.describe Story, type: :model do
  it { should belong_to(:user)}
  it { should have_many(:reviews)}
  it { should have_many(:mentors)}
  it { should validate_presence_of(:name)}

end
