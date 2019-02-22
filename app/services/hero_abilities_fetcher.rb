class HeroAbilitiesFetcher < MainFetcher
  attr_reader :link, :hero

  def initialize(attributes = {})
    @link = attributes[:link]
    @hero = Hero.find_by(overwatch_id: attributes[:hero_overwatch_id])
  end

  def perform
    overwatch_request = Net::HTTP.get(URI(link))
    records           = JSON.parse(overwatch_request)
    fetched_records   = records['abilities']
    saved_records     = hero.abilities
    return if fetched_records.count.eql?(saved_records.count)
    start_fetching_records(fetched_records)
  end

  private

  def record_parsed_details(record_details)
    record_details.delete('url')
    record_api_id = record_details.delete('id')
    record = Ability.find_or_initialize_by(overwatch_id: record_api_id)
    save_ability_details(record, record_details, record_api_id)
  end

  def save_ability_details(ability, details, id)
    if ability.new_record?
      ability.assign_attributes(name:         details['name'],
                                description:  details['description'],
                                is_ultimate:  details['is_ultimate'],
                                overwatch_id: id)
      ability.save
    end
    save_matched_ability_with_hero(ability.id)
  end

  def save_matched_ability_with_hero(ability_id)
    matched_record = AbilityHero.new(hero_id: hero.id, ability_id: ability_id)
    matched_record.save
  end
end
