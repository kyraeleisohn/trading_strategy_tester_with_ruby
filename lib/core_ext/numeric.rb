class Numeric
  def percent_of(n)
    (n.equal? 0) ? 0 : (self.to_f / n.to_f)
  end
end