module Api
  class HerosController < SharedController
    before_action :fetch_heros_from_overwatch, only: %i[index show]
    before_action :find_hero, only: %i[show abilities]
    before_action :fetch_hero_abilities_from_overwatch, only: %i[show abilities]

    def abilities
      abilities_list = @hero.abilities
      render json: {  data: { hero: @hero, abilities: abilities_list },
                      message: message_to_show(abilities_list) }
    end

    private

    def find_hero
      @hero = Hero.find_by(overwatch_id: params[:id])
    end

    def fetch_heros_from_overwatch
      HeroFetcher.new(link: OVERWATCH_HERO_URL)
                 .perform
    end

    def fetch_hero_abilities_from_overwatch
      hero_overwatch_id = @hero.overwatch_id
      link              = OVERWATCH_HERO_URL + hero_overwatch_id.to_s
      HeroAbilitiesFetcher.new(link:              link,
                               hero_overwatch_id: hero_overwatch_id)
                          .perform
    end
  end
end
