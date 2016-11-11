class IdGenerator
  def get
    SecureRandom.hex(32)
  end
end