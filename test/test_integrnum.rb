# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "integrnum.rb"

require "minitest/autorun"
class TestIntegrnum < Minitest::Test
  def test_rectangular_integration
    assert_in_delta 2.107844, Integrnum.rectangular(
      lambda{ |x| (x + 1) * Math.sin(x) }, 1.6, 2.4, 0.0001), 0.001

    assert_in_delta 0.333, Integrnum.rectangular(
      lambda{ |x| x**2 }, 0, 1, 0.0001), 0.001

    assert_in_delta -0.0781, Integrnum.rectangular(lambda{ |x| Math.sin(x**2 + 2.5) / (x**3 + 3) },
      0.4, 2.2, 0.0001), 0.001
  end

  def test_trapezoid_integration
    assert_in_delta -0.0271, Integrnum.trapezoid(
      lambda{ |x| Math.cos(x) / (2 + Math.sin(x)) }, 2, 8, 0.0001), 0.001
    assert_in_delta 2.107844, Integrnum.trapezoid(
      lambda{ |x| (x + 1) * Math.sin(x) }, 1.6, 2.4, 0.0001), 0.001
  end

  def test_parabola_integration
    assert_in_delta 2.107110, Integrnum.parabola(
      lambda{ |x| (x + 1) * Math.sin(x) }, 1.6, 2.4, 0.0001), 0.001
    assert_in_delta -0.0271, Integrnum.parabola(
      lambda{ |x| Math.cos(x) / (2 + Math.sin(x)) }, 2, 8, 0.0001), 0.001
  end
end
