class DataGetter

  def initialize
    @loc_data = Faraday.new(:url => 'https://api.instagram.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def denver_pics(token)
    response = @loc_data.get do |loc_data|
      loc_data.url "/v1/media/search/"
      loc_data.params["lat"] = "39.737567"
      loc_data.params["lng"] = "104.984717"
      loc_data.params["access_token"] = token
  end
      JSON.parse(response.body)
  end


  def search_by_tag(token, searchterm)
    response = @loc_data.get do |loc_data|
      loc_data.url "/v1/tags/#{searchterm}/media/recent/"
      loc_data.params["access_token"] = token
  end
      JSON.parse(response.body)
  end

end
