require "rails_helper"
RSpec.describe Story, type: :model do
  it { should belong_to(:user)}
  it { should have_many(:reviews)}
  it { should have_many(:mentors)}
  it { should validate_presence_of(:name)}

  describe ".search" do
    before do
      @user = create(:user)
    end

    it "finds a searched story by it's name" do
      story = create(:story, user: @user, name: "Nav bar")
      result = Story.search("Nav bar")
      expect(result).to include(story)
    end

    it "finds all stories if argument is not given" do
      story = create(:story, user: @user, name: "Nav bar")
      result = Story.search(nil)
      expect(result).to include(story)
    end
  end

end
