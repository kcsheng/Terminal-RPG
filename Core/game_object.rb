# frozen_string_literal: true

# Class for any sprite/animation on the screen
# Contains an x and y position and a sprite/graphic/animation
# and methods to manipulate and draw the object
class GameObject
  attr_accessor :animation
  attr_accessor :pos
  attr_accessor :old

  # initialize the gameobject with an animation and a position
  def initialize(animation, pos)
    @animation = animation
    @pos = pos
    @old = pos
  end

  # draw the game objects current animation at a position
  def draw(win, pos = Vector.new(:x => 0, :y => 0))
    @animation.draw(win, @pos + pos)
  end

  # moves the object forwards but keeps track of the
  # previous position for collision purposes
  def move(direction)
    @old = @pos
    @pos += direction
  end

  # returns the width of the game object
  def width
    @animation.width
  end

  # returns the height of the game object
  def height
    @animation.height
  end

  # returns a copy of the game object so animations aren't shared
  def copy
    GameObject.new(@animation.dup, @pos.dup)
  end

  # returns true if the game object collides with
  # the given game object
  def collides?(other)
    !(
      @pos.x + width <= other.pos.x ||
      @pos.x >= other.pos.x + other.width ||
      @pos.y + height <= other.pos.y ||
      @pos.y >= other.pos.y + other.height
    )
  end

  # default functions so that objects without an update done crash the program
  def update; end
end
