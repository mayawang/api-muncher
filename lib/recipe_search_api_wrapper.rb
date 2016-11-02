require 'httparty'
#require 'recipe'
require_relative './recipe'

class RecipeSearchApiWrapper
  # scheme => https/http/ftp
  # host => api.edamam.com
  # path => /search
  # query parameters => "q=#{term}" + "&app_id=#{APP_ID}"
  BASE_URL = "https://api.edamam.com"
  APP_ID = "f8c6af19"
  APP_KEY = "3e974f32b9b7c425a0a6e4bae6e5e131"
  PAGE_SIZE = 10

  def self.search(term, page)
    page ||= 1
    page = page.to_i

    from = (page - 1) * PAGE_SIZE
    to = from + PAGE_SIZE


    url = BASE_URL + "/search?" + "q=#{term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&from=#{from}&to=#{to}"

    response = HTTParty.get(url)

    recipes = []
    hits = response['hits']
    hits.each do |hit|
      recipes << Recipe.new(hit['recipe'])
    end
    return {
      :recipes => recipes,
      :count => response['count'],
      :more => response['more'],
    }
  end
end
