# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "integrnum.rb"

require "minitest/autorun"
class TestIntegrnum < Minitest::Test
  def test_rectangular_integration
    assert_in_delta 2.107844, Integrnum.rectangular(
      1.6, 2.4, 1000) { |x| (x + 1) * Math.sin(x) }, 0.001

    assert_in_delta 0.333, Integrnum.rectangular(
      0, 1, 1000) { |x| x**2 }, 0.001

    assert_in_delta -0.0781, Integrnum.rectangular(
      0.4, 2.2, 1000) { |x| Math.sin(x**2 + 2.5)/(x**3 + 3) }, 0.001

    assert_in_delta Math.log(2), Integrnum.rectangular(
      1, 2, 1000) { |x| 1 / x.to_f }, 0.001
  end

  def test_trapezoid_integration
    return 0
  end

  def test_parabola_integration
    return 0
  end
end
