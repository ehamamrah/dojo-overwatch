RSpec.describe Hero, type: :model do
  describe '#Validations' do
    it { should have_and_belong_to_many(:abilities) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:real_name) }
    it { is_expected.to validate_presence_of(:health) }
    it { is_expected.to validate_presence_of(:armour) }
    it { is_expected.to validate_presence_of(:shield) }

    it { is_expected.to validate_numericality_of(:health) }
    it { is_expected.to validate_numericality_of(:armour) }
    it { is_expected.to validate_numericality_of(:shield) }
  end
end
