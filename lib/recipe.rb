class Recipe
  attr_reader :uri, :label, :image
  def initialize(hash)
    hash.each do |k,v|
      self.instance_variable_set("@#{k}", v)
    end
  end
end