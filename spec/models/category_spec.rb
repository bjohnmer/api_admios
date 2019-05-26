require 'rails_helper'

RSpec.describe Category, type: :model do

  subject { build(:category) }
  it "to be valid" do
    expect(subject).to be_valid
  end

  # Validations
  it { is_expected.to validate_presence_of(:name) }
  it { expect(subject.name).to be_instance_of(String) }

  # Relations
  it { should have_many(:items)  }
end
