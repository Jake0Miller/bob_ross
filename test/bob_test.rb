require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/bob'

class BobTest < Minitest::Test
  def test_it_exists
    bob = Bob.new
    assert_instance_of Bob, bob
  end

  def test_it_starts_with_no_paints
    bob = Bob.new
    assert_equal [], bob.paints
  end

  def test_it_can_have_paint
    bob = Bob.new
    paint_1 = mock("Alizarin Crimson")
    paint_2 = mock("Van Dyke Brown")

    bob.add_paint(paint_1)
    bob.add_paint(paint_2)

    assert_equal [paint_1, paint_2], bob.paints
  end

  def test_it_can_return_colors
    bob = Bob.new
    paint_1 = mock("Alizarin Crimson")
    paint_1.stubs(:name).returns("Alizarin Crimson")
    paint_2 = stub(name: "Van Dyke Brown")
    bob.add_paint(paint_1)
    bob.add_paint(paint_2)

    assert_equal ["Alizarin Crimson", "Van Dyke Brown"], bob.paint_colors
  end

  def test_it_can_total_paint_amount
    bob = Bob.new

    paint_1 = stub(name: "Alizarin Crimson", amount: 42)
    paint_2 = stub(name: "Van Dyke Brown", amount: 25)

    bob.add_paint(paint_1)
    bob.add_paint(paint_2)

    assert_equal 67, bob.total_paint_amount
  end
end
