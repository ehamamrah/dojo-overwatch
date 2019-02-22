class HeroFetcher
  attr_reader :link

  def initialize(attributes = {})
    @link = attributes[:link]
  end

  def perform
    overwatch_request = Net::HTTP.get(URI(link))
    records           = JSON.parse(overwatch_request)
    fetched_records   = records['data']
    saved_records     = Hero.all
    return saved_records if fetched_records.count.eql?(saved_records.count)
    start_fetching_heros(records['data'])
  end

  private

  def start_fetching_heros(records)
    records.map { |hero| hero_parsed_details(hero) }
  end

  def hero_parsed_details(hero_details)
    hero_details.delete('url')
    hero_api_id = hero_details.delete('id')
    hero = Hero.find_or_initialize_by(overwatch_id: hero_api_id)
    save_hero_details(hero, hero_details, hero_api_id)
  end

  def save_hero_details(hero, details, id)
    return hero unless hero.new_record?
    hero.assign_attributes(name:        details['name'],
                           real_name:   details['real_name'],
                           armour:      details['armour'],
                           health:      details['health'],
                           shield:      details['shield'],
                           overwatch_id: id)
    hero.save
    hero
  end
end
