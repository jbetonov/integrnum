# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "integrnum.rb"

require "minitest/autorun"
class TestIntegrnum < Minitest::Test
  def test_rectangular_integration
    # Проверяем интегрирование функции x^2 от 0 до 1
    assert_in_delta 0.333, Integrnum.rectangular(0, 1, 1000) { |x| x**2 }, 0.001
    # Проверяем интегрирование функции sin(x) от 0 до π
    assert_in_delta 1.0, Integrnum.rectangular(0, Math::PI, 1000) { |x| Math.sin(x) }, 0.001
    # Проверяем интегрирование функции 1/x от 1 до 2
    assert_in_delta Math.log(2), Integrnum.rectangular(1, 2, 1000) { |x| 1 / x.to_f }, 0.001
  end

  def test_trapezoid_integration
    return 0
  end
  
  def test_parabola_integration
    return 0
  end
end
