RSpec.describe Ability, type: :model do
  describe '#Validations' do
    it { should have_and_belong_to_many(:heros) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
