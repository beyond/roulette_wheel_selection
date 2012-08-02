class Array
  def roulette_wheel_selection n=nil
    return nil if self.empty? && n.nil?
    return [] if self.empty?

    n1 = n
    n1 = 1 if n.nil?
    n1 = n1.to_int
  rescue Exception => e
    raise TypeError, "Coercion error: #{n.inspect}.to_int => Integer failed:\n(#{e.message})"
  else
    cumulative = self.inject( [0] ) { |s,i| s << s.last + i.to_i }
    cumulative.shift
    result = Array.new(n1).map! {
      r = rand( cumulative.last )
      cumulative.find_index { |t| r < t }
    }
    return result.first if n.nil?
    result
  end
end
