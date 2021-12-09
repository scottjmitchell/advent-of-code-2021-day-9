# frozen_string_literal: true

class SmokeBasin
  
  def pull_heightmap(data)
  	rows = data.split("\n")
  	heightmap = Array.new
  	
  	rows.each do |row| 
  		heightmap_row = Array.new
  		row.chars.each { |char| heightmap_row << char.to_i }
  		heightmap << heightmap_row
  	end

  	heightmap
  end

  def get_low_points(data)
	heightmap = pull_heightmap(data)

  	row_number = 0
  	column_number = 0
  	low_points = Array.new
  	is_low_point = true

  	heightmap.each do |row|

  		row.each do |col|
  			is_low_point = true
  			
  			if row_number < heightmap.length - 1
  				is_low_point = check_down(
  								heightmap, 
  								row_number, 
  								column_number
  							) && is_low_point
  			end

  			if column_number < row.length - 1
  				is_low_point = check_right(
  								heightmap, 
  								row_number, 
  								column_number
  							) && is_low_point
  			end

  			if row_number > 0
  				is_low_point = check_up(
  								heightmap, 
  								row_number, 
  								column_number
  							) && is_low_point
  			end

  			if column_number > 0
  				is_low_point = check_left(
  								heightmap, 
  								row_number, 
  								column_number
  							) && is_low_point
  			end


  			low_points << col if is_low_point == true
  			column_number += 1
  			is_low_point = true
  		end
 
  		row_number += 1
  		column_number = 0
  	end

  	low_points
  end

  def check_right(heightmap, row_number, col_number)
  	heightmap[row_number][col_number] < heightmap[row_number][col_number + 1]
  end

  def check_down(heightmap, row_number, col_number)
  	heightmap[row_number][col_number] < heightmap[row_number + 1][col_number]
  end

  def check_left(heightmap, row_number, col_number)
  	heightmap[row_number][col_number] < heightmap[row_number][col_number - 1]
  end

  def check_up(heightmap, row_number, col_number)
  	heightmap[row_number][col_number] < heightmap[row_number - 1][col_number]
  end   

  def get_risk_score(data) 
  	get_low_points(data).collect { |lp| lp + 1 }.sum
  end
end

data = File.read("#{File.dirname(__FILE__)}/input.txt")
sb = SmokeBasin.new

puts sb.get_risk_score(data)


