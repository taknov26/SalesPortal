json.array!(@matters) do |matter|
  json.title matter.name
  json.start matter.fixed_date
  json.url member_matter_path(matter)
end