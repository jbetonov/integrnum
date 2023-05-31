# frozen_string_literal: true

require_relative "integrnum/version"

  require 'matrix'

module Integrnum
  class Error < StandardError; end


  def get_i
    Math.exp(1) - Math.exp(0)
  end

  def self.rectangular(func, min_lim, max_lim, delta)
    def self.integrate(func, min_lim, max_lim, n)
      integral = 0.0
      step = (max_lim - min_lim) / n
      (min_lim...max_lim-step).step(step) do |x|
        integral += step * func.call(x + step / 2)
      end
      integral
    end

    d, n = 1, 1
    while d.abs > delta
      d = (integrate(func, min_lim, max_lim, n * 2) - integrate(func, min_lim, max_lim, n)) / 3
      n *= 2
    end

    a = integrate(func, min_lim, max_lim, n).abs
    b = integrate(func, min_lim, max_lim, n).abs + d
    a, b = b, a if a > b
    puts 'Rectangles:'
    puts "\t#{n}\t#{a}\t#{b}"
  end


def self.trapezoid(min_lim, max_lim, delta)
    return 0
end

def self.parabola(min_lim, max_lim, delta)
    return 0
end

end
