ActiveAdmin.register Hero do
  permit_params %i[name real_name health armour shield overwatch_id]
end
