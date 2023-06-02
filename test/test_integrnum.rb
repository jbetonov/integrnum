# frozen_string_literal: true

require "integrnum"

require "minitest/autorun"

class TestIntegrnum < Minitest::Test
  def test_rectangular_integration
    assert_in_delta 2.107, Integrnum.rectangular(
      ->(x) { (x + 1) * Math.sin(x) }, 1.6, 2.4, 0.0001), 0.001

    assert_in_delta 0.333, Integrnum.rectangular(
      ->(x) { x**2 }, 0, 1, 0.0001), 0.001

    assert_in_delta (-0.078).abs, Integrnum.rectangular(
      ->(x) { Math.sin(x**2 + 2.5) / (x**3 + 3) }, 0.4, 2.2, 0.0001), 0.001
  end

  def test_trapezoid_integration
    assert_in_delta (-0.027).abs, Integrnum.trapezoid(
      ->(x) { Math.cos(x) / (2 + Math.sin(x)) }, 2, 8, 0.0001), 0.01
    assert_in_delta 2.107, Integrnum.trapezoid(
      ->(x) { (x + 1) * Math.sin(x) }, 1.6, 2.4, 0.0001), 0.01
  end

  def test_parabola_integration
    assert_in_delta 2.107, Integrnum.parabola(
      ->(x) { (x + 1) * Math.sin(x) }, 1.6, 2.4, 0.0001), 0.001
    assert_in_delta (-0.027).abs, Integrnum.parabola(
      ->(x) { Math.cos(x) / (2 + Math.sin(x)) }, 2, 8, 0.0001), 0.001
  end
end
