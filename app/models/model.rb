class Model
  def to_hash
    {}
  end

  def to_json(options = {})
    to_hash.to_json options
  end
end