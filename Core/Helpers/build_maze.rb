require_relative '../maze'
require_relative '../vector'

# This is a helper function that 
# uses the maze class to create and maze
# and then generates the terrain for said maze
# with the type of wall specified

def build_maze(x, y, wall, cell_size)
  terrain = []
  maze = Maze.new(x, y)

  wall_tiling = (cell_size / wall.width.to_f).ceil

  maze.grid.each.with_index do |row, i|
    row.each.with_index do |cell, j|
      wall_tiling.times do |k|
        if cell.walls[0]
          new_wall = wall.copy
          new_wall.pos = Vector.new(:x => i * cell_size + k * wall.width, :y => j * cell_size)
          terrain << new_wall
        end
        if cell.walls[1] && !(i == maze.grid.length-1 && j == maze.grid[0].length-1)
          new_wall = wall.copy
          new_wall.pos = Vector.new(:x => i * cell_size + cell_size - wall.width, :y => j * cell_size + k * wall.width)
          terrain << new_wall
        end
        if cell.walls[2]
          new_wall = wall.copy
          new_wall.pos = Vector.new(:x => i * cell_size + k * wall.width, :y => j * cell_size + cell_size - wall.width)
          terrain << new_wall
        end
        if cell.walls[3]
          new_wall = wall.copy
          new_wall.pos = Vector.new(:x => i * cell_size, :y => j * cell_size + k * wall.width)
          terrain << new_wall
        end
      end
    end
  end

  # returns the terrain that was generated
  terrain
end
