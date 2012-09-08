local GameOver = Game:addState('GameOver')

function GameOver:enteredState()
  for i,screen in ipairs(self.screenshots) do
    screen:encode("screen" .. i .. ".png")
  end

  if stats.score > self.highscores[self.settings.difficulty].score then
    self.highscores[self.settings.difficulty].score = stats.score
    self.highscores[self.settings.difficulty].time = math.round(stats.round_time, 1)
    self.new_highscore = true
  else
    self.new_highscore = false
  end

  local json = require('json')
  love.filesystem.write("scores.txt", json.encode(self.highscores))

end

function GameOver:render()
  g.setColor(255,255,255)
  g.print("GAME OVER. Click to return to the game menu.", 100, 100)
  g.print("Score: " .. stats.score, 100, 200)
  g.print("Survived for " .. math.round(stats.round_time, 1) .. " seconds.", 100, 300)

  if self.new_highscore then
    g.setColor(255,0,0)
    g.print("HOLY MOTHER! NEW HIGHSCOOOOOOOORE!", 400, 200)
  end
end

function GameOver:update(dt)
end

function GameOver:exitedState()
end

function GameOver:mousepressed(x, y, button)
  self:gotoState("Menu")
end

return GameOver
