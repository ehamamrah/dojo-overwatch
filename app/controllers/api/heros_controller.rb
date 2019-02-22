module Api
  class HerosController < ApplicationController
    before_action :find_hero, only: %i[show]

    def index
      heros = HeroFetcher.new(link: OVERWATCH_HERO_URL).perform
      render json: {  name: 'Heros List', data: heros,
                      message: message_to_show(heros) }
    end

    def show
      render json: {  data: @hero,
                      message: message_to_show(@hero) }
    end

    private

    def find_hero
      @hero = Hero.find_by(overwatch_id: params[:id])
    end

    def message_to_show(targeted_object)
      targeted_object.present? ? 'Success' : 'No Details to Show'
    end
  end
end
