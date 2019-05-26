require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { build(:item) }

  # Validations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:aquisition_date) }

  it { expect(subject.name).to be_instance_of(String) }
  it { expect(subject.description).to be_instance_of(String) }
  it { expect(subject.category).to be_instance_of(Category) }
  it { expect(subject.aquisition_date).to be_instance_of(Date) }

  it 'be created' do 
    item = create(:item)
    expect(item).to be_valid
  end

  it 'not be valid' do 
    item = build(:item_no_valid_aquisition_date)
    expect(item).not_to be_valid
  end

  # Relations
  it { should belong_to(:category)  }
end
