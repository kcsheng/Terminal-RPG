# frozen_string_literal: true

# Class to keep track of which sprite in an animation is currently being shown
# and how often the animation should change
class Animation
  attr_accessor :fps, :sprites, :current_sprite_index, :sprite_positions, :freeze

  @@frame_rate = 30.0

  def initialize(sprites, sprite_positions, fps = 0)
    @sprite_positions = sprite_positions
    @sprites = sprites
    @current_sprite_index = 0
    @fps = fps.to_f
    @freeze = false
  end

  def draw(win, pos)
    index = @current_sprite_index.floor % @sprites.length
    @sprites[index].draw(win, pos + @sprite_positions[index])
    @current_sprite_index += (@fps / @@frame_rate.to_f) unless freeze
  end

  def current_sprite
    @sprites[@current_sprite_index.floor % @sprites.length]
  end

  def width
    index = @current_sprite_index.floor % @sprites.length
    @sprites[index].width + @sprite_positions[index].x
  end

  def height
    index = @current_sprite_index.floor % @sprites.length
    @sprites[index].height + @sprite_positions[index].y
  end

  def ==(other)
    @sprites == other.sprites &&
      @sprite_positions == other.sprite_positions &&
      @fps == other.fps
  end

  class << self
    def get_frame_rate
      @@frame_rate
    end

    def set_frame_rate(frame_rate)
      @@frame_rate = frame_rate.to_f
    end
  end
end
