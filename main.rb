require "gosu"

CELL_SIZE = 64
WINDOW_WIDTH = WINDOW_HEIGHT = CELL_SIZE * 3 

class Window < Gosu::Window
    def initialize
        super(WINDOW_WIDTH, WINDOW_HEIGHT)
        self.caption = "Tic-Tac-Toe"
    end

    def update

    end

    def draw
        
    end
end

Window.new.show
