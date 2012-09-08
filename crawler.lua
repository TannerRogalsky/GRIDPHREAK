Crawler = class('Crawler', Enemy)

function Crawler:initialize(pos, radius)
  Enemy.initialize(self, pos, radius)
  self.color = {0,255,0}
  self.score_worth = 1
end

function Crawler:on_collide(dt, shape_one, shape_two, mtv_x, mtv_y)
  local other_object = shape_two.parent

  if instanceOf(Bullet, other_object) then
    game.collider:remove(shape_one, shape_two)
    game.enemies[self.id] = nil
    game.bullets[other_object.id] = nil
    game.player.score = game.player.score + self.score_worth
  elseif instanceOf(Enemy, other_object) then
    self:move(mtv_x / 2, mtv_y / 2)
  end
end
