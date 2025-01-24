if @island.persisted?
  json.form render(partial: "islands/form", formats: :html, locals: {island: Island.new})
  json.inserted_item render(partial: "islands/card", formats: :html, locals: {island: @island})
else
  json.form render(partial: "islands/form", formats: :html, locals: {island: @Island})
end
