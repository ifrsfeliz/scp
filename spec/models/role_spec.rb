require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'validations' do
    [:name, :display_order].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
