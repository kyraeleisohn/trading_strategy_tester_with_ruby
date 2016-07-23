class TradeIdGenerator
  def get
    SecureRandom.uuid
  end
end