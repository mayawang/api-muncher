class HomepagesController < ApplicationController
  def index
  end

  def search
    @term = params[:term]
    @page = params[:page] || 1
    @page = @page.to_i
    results = RecipeSearchApiWrapper.search(@term, @page)
    @recipes = results[:recipes]
    @count = results[:count]
    @more = results[:more]
    puts "#{} #{results[:more]}"
  end
end
