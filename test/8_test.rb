# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/8'

class GiantWhaleTest < Minitest::Test
  def setup
    @seven_segment = SevenSegment.new
    @test_data = File.read("#{File.dirname(__FILE__)}/input.txt")
  end

  
end
