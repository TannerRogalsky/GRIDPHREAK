Crawler = class('Crawler', Enemy)

function Crawler:initialize(pos, radius)
  Enemy.initialize(self, pos, radius)
  self.color = {0,255,0}
end
