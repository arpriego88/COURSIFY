require 'rails_helper'

RSpec.describe Course, :type => :model do
  context 'validation' do
    it "is valid with name and description" do
      expect(build(:course)).to be_valid
    end

    it "is invalid without name" do
      expect(build(:course, :name => nil)).to be_invalid
    end

    it "is invalid without description" do
      expect(build(:course, :description => nil)).to be_invalid
    end
  end

end
