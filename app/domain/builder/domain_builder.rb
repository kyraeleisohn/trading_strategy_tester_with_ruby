class DomainBuilder
  protected
  def generate_id
    id_generator = IdGenerator.new
    id_generator.get
  end
end