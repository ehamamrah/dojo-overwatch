module Api
  class AbilitiesController < SharedController
    before_action :fetch_abilities_from_overwatch
    before_action :find_ability, only: %i[show]

    def index
      @abilities = Ability.all
      render json: {  name: 'abilities List', data: @abilities,
                      message: message_to_show(@abilities) }
    end

    def show
      render json: {  data: @ability,
                      message: message_to_show(@ability) }
    end

    private

    def find_ability
      @bility = Ability.find_by(overwatch_id: params[:id])
    end

    def fetch_abilities_from_overwatch
      AbilityFetcher.new(link: OVERWATCH_ABILITY_URL).perform
    end
  end
end
