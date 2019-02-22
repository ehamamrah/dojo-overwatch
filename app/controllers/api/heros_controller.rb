module Api
  class HerosController < SharedController
    before_action :fetch_heros_from_overwatch, only: %i[index show]
    before_action :find_hero, only: %i[show]

    def index
      @heros = Hero.all
      render json: {  name: 'Heros List', data: @heros,
                      message: message_to_show(@heros) }
    end

    private

    def find_hero
      @hero = Hero.find_by(overwatch_id: params[:id])
    end

    def fetch_heros_from_overwatch
      HeroFetcher.new(link: OVERWATCH_HERO_URL).perform
    end
  end
end
