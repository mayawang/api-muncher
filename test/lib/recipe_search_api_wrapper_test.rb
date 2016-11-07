require 'test_helper'
require 'recipe_search_api_wrapper'

class RecipeSearchApiWrapperTest < ActionController::TestCase
  test "search term will be in API q query param" do
    VCR.use_cassette("search-fish-recipe") do
      results = RecipeSearchApiWrapper.search('fish', 10, [], [])
      assert results[:recipes].length > 0
    end
  end

  test "check search filter checkbox will return according recipe" do
    VCR.use_cassette("search-fish-recipe") do
      results = RecipeSearchApiWrapper.search('fish', 10, [], [])
      assert results[:recipes].length > 0
    end
  end

  test "find term will be in API q query param" do
    VCR.use_cassette("find-fish-recipe") do
      recipe = RecipeSearchApiWrapper.find('fish', 10, [], [])
      assert recipe[:recipe].length > 0
    end
  end
end
