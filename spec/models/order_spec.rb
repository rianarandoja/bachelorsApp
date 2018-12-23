# frozen_string_literal: true

RSpec.describe Order, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:line_items).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to define_enum_for(:pay_type).with(['Check', 'Credit card', 'Purchase order']) }
  end

  describe '#summa' do
    let!(:order) { create(:order) }
    let!(:line_item) { create(:line_item, quantity: 2, order: order) }

    it { expect(order.summa).to eq(line_item.product.price * line_item.quantity) }
  end
end
