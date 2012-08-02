class Hash
  def roulette_wheel_selection n=nil
    indexes = self.values.roulette_wheel_selection n

    return nil if indexes.nil?
    return self.keys[ indexes ] unless Array === indexes
    self.keys.values_at *indexes
  end
  alias :sample :roulette_wheel_selection
end
