class AbilityFetcher < MainFetcher
  private

  def save_record_details(ability, details, id)
    return ability unless ability.new_record?
    ability.assign_attributes(name:         details['name'],
                              description:  details['description'],
                              is_ultimate:  details['is_ultimate'],
                              overwatch_id: id)
    ability.save
    ability
  end
end
