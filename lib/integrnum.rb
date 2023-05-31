# frozen_string_literal: true

require_relative "integrnum/version"

module Integrnum
  class Error < StandardError; end

def func(x)
return ( 1 / (1+ x * x))
end

  def self.rectangular(func, min_lim, max_lim, n = 10) # fun через yield
    h = (max_lim - min_lim ) / n
    sum = 0
    for i in 0..n do
      s += h * func.(min_lim + h * (i + 0.5))
end
    return s
end


  def self.trapezoid(min_lim, max_lim, delta)
    return 0
  end

  def self.parabola(min_lim, max_lim, delta)
    return 0
  end

end
