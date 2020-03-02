require "gosu"
require_relative "grid"

# Window Constants
CELL_SIZE = 64
WINDOW_WIDTH = WINDOW_HEIGHT = CELL_SIZE * 3

# Game Constants
GAME_OVER_STATES = [
    0b0_0000_0111, 0b0_0011_1000, 0b1_1100_0000, # Horizontal Wins
    0b0_0100_1001, 0b0_1001_0010, 0b1_0010_0100, # Vertical Wins
    0b1_0001_0001, 0b0_0101_0100, 0b1_1111_1111  # Diagonal Wins + Draw State
]
CONST_X = :X
CONST_O = :O

# Graphics Constants
GRID_IMAGE = Gosu::Image.new("grid.png")
X_IMAGE = Gosu::Image.new("x.png")
O_IMAGE = Gosu::Image.new("o.png")

class Window < Gosu::Window
    def initialize
        super(WINDOW_WIDTH, WINDOW_HEIGHT)
        self.caption = "Tic-Tac-Toe"

        @game_over = false
        @grid = Grid.new
    end

    def needs_cursor?
        true
    end

    def button_up(id)
        if id == Gosu::MS_LEFT and not @game_over
            @grid.make_move(self.mouse_x, self.mouse_y)
        else
            super
        end
    end

    def draw
        @grid.draw
    end
end

Window.new.show
