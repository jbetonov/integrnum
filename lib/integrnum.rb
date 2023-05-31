# frozen_string_literal: true

require_relative "integrnum/version"

module Integrnum
  class Error < StandardError; end


  def self.rectangular(min_lim, max_lim, n=1000, &block)
    return 0
  end

  def self.trapezoid(min_lim, max_lim, delta)
    return 0
  end

  def self.parabola(min_lim, max_lim, delta)
    return 0
  end

end
