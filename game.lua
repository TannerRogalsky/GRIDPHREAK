Game = class('Game', Base):include(Stateful)

function Game:initialize()
  Base.initialize(self)

  local Camera = require 'lib/camera'
  camera = Camera:new()

  self.settings = {}

  self.highscores = {}
  local json = require('json')
  if love.filesystem.isFile("scores.txt") then
    local raw = love.filesystem.read("scores.txt")
    self.highscores = json.decode(raw)
  else
    --  setup empty highscores because scores file doesn't exist
    local difficulties = {"easy", "hard", "insane"}
    for _,difficulty in ipairs(difficulties) do
      self.highscores[difficulty] = {time = 0, score = 0}
    end
  end

  self:gotoState("Loading")
end

function Game:update(dt)
end

function Game:render()
end

function Game.mousepressed(x, y, button)
end

function Game.mousereleased(x, y, button)
end

function Game.keypressed(key, unicode)
end

function Game.keyreleased(key, unicode)
end

function Game.joystickpressed(joystick, button)
  print(joystick, button)
end

function Game.joystickreleased(joystick, button)
  print(joystick, button)
end
