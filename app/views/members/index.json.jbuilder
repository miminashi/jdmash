json.array!(@members) do |member|
  json.extract! member, :id, :first_name, :familly_name, :url
  json.url member_url(member, format: :json)
end
