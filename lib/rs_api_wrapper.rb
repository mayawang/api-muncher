require 'httparty'


class Rs_Api_Wrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = "f8c6af19"
  APP_KEY = "3e974f32b9b7c425a0a6e4bae6e5e131"

  def self.search(term)
    url = BASE_URL + "search?" + "q=#{term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"

    response = HTTParty.get(url)

  end
end
