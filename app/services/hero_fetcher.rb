class HeroFetcher < MainFetcher
  private

  def save_record_details(hero, details, id)
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
