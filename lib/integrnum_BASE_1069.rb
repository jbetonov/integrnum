# frozen_string_literal: true

require_relative "integrnum/version"

  require 'matrix'

module Integrnum
  class Error < StandardError; end


  def get_i
    Math.exp(1) - Math.exp(0)
  end

#метод прямоугольников
#pectangular(lambda { |x| Math.sin(x) }, 0, Math::PI, 0.0001)
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


#метод трапеций
def self.trapezoid(func, min_lim, max_lim, delta)
    def self.integrate(func, min_lim, max_lim, n)
        integral = 0.0
        step = (max_lim - min_lim) / n
        (min_lim...max_lim-step).step(step) do |x|
            integral += step*(func.call(x) + func.call(x + step)) / 2
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
    puts 'Trapezium:'
    puts "\t#{n}\t#{a}\t#{b}"
end

#метод парабол
def self.parabola(func, min_lim, max_lim, delta)
    def self.integrate(func, min_lim, max_lim, n)
        integral = 0.0
        step = (max_lim - min_lim) / n
        (min_lim + step / 2..max_lim - step / 2).step(step) do |x|
            integral += step / 6 * (func.call(x - step / 2) + 4 * func.call(x) + func.call(x + step / 2))
        end
integral
end

    d, n = 1, 1
    while d.abs > delta
        d = (integrate(func, min_lim, max_lim, n * 2) - integrate(func, min_lim, max_lim, n)) / 15
        n *= 2
      end

    a = (integrate(func, min_lim, max_lim, n)).abs
    b = (integrate(func, min_lim, max_lim, n)).abs + d

        a, b = b, a if a>b
    puts 'Parabola:'
    puts "\t#{n}\t#{a}\t#{b}"
end

end
