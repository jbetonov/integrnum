# frozen_string_literal: true

require "test_helper"
class TestIntegrnum < Minitest::Test
  def test_gaussian
    f = -> x { Math.exp(-x**2/2) / Math.sqrt(2 * Math::PI) }
    expected = 0.49996832875817
    actual = RombergIntegral.new.integral 0, 4, &f
    assert_in_delta expected, actual.value, 1e-10
  end
end
