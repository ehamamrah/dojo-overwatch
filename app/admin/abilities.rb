ActiveAdmin.register Ability do
  permit_params %i[name description is_ultimate overwatch_id]
end
