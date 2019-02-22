module Api
  class AbilitiesController < SharedController
    before_action :fetch_abilities_from_overwatch
    before_action :find_ability, only: %i[show]

    private

    def find_ability
      @ability = Ability.find_by(overwatch_id: params[:id])
    end

    def fetch_abilities_from_overwatch
      AbilityFetcher.new(link: OVERWATCH_ABILITY_URL).perform
    end
  end
end
