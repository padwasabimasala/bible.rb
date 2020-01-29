#!/usr/bin/env ruby
require_relative 'bible'

require "test/unit"

class TestBible < Test::Unit::TestCase
  def test_genesis_1v1
    expected = "In the beginning God created the heaven and the earth."
    assert_equal(expected, bible[:Genesis][1][1])
  end

  def test_john_3v16
    expected = "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life."
    assert_equal(expected, bible[:John][3][16])
  end
end
