# frozen_string_literal: true

RSpec.describe LineItem, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:cart) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:title).to(:product).with_prefix }
  end

  describe '#total_price' do
    let!(:product) { create(:product) }
    let!(:line_item) { create(:line_item, product: product) }
    it { expect(line_item.total_price).to eq(product.price * line_item.quantity) }
  end
end
