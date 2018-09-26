class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

end
