# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/9'

class SmokeBasinTest < Minitest::Test
  def setup
    @smoke_basin = SmokeBasin.new
    @test_data = File.read("#{File.dirname(__FILE__)}/input.txt")
  end

  def test_the_number_of_rows_in_heightmap_is_correct
    assert @smoke_basin.pull_heightmap(@test_data).length == 5
  end

  def test_the_number_of_columns_in_heightmap_is_correct
    assert @smoke_basin.pull_heightmap(@test_data)[0].length == 10
  end

  def test_that_we_can_correctly_identify_corner_low_points
    assert @smoke_basin.get_low_points(@test_data) == [0]
  end
end
