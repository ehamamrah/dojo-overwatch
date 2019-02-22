RSpec.describe AbilityHero, type: :model do
  describe '#Validations' do
    it { should belong_to(:hero) }
    it { should belong_to(:ability) }
  end
end
