# frozen_string_literal: true

RSpec.describe Product, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:orders).through(:line_items) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to validate_uniqueness_of(:title) }

    it { is_expected.to allow_values('abc.gif', 'abc.jpg', 'abc.png').for(:image_url) }
    it { is_expected.not_to allow_values('abc.txt').for(:image_url) }
  end
end
