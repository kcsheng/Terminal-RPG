# frozen_string_literal: true

require_relative './Helpers/paint_color'

# Class for any graphics draw to the screen
# Contains a color and the graphic to be drawn
class Graphic
  # just an abstract class
  # errors for unimplemented classes will be added later
  def draw(win, pos)
  end

  def width
  end

  def height
  end
end
