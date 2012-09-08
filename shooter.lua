Shooter = class('Shooter', Enemy)

function Shooter:initialize(pos, radius)
  Enemy.initialize(self, pos, radius)

  self.speed = 1
  self.time_of_last_fire = 0
  self.color = {255,255,0}
  self.score_worth = 3

  self.delta_to_player = {0,0}
end

function Shooter:update(dt)
  local player_x, player_y = game.player.pos.x, game.player.pos.y
  self.angle = math.atan2(player_y - self.pos.y, player_x - self.pos.x)
  local x = self.pos.x + self.speed * math.cos(self.angle)
  local y = self.pos.y + self.speed * math.sin(self.angle)
  self:moveTo(x,y)

  local t = love.timer.getMicroTime()
  if t - self.time_of_last_fire > 0.8 then
    self:fire(t)
  end

  local dx = player_x - self.pos.x
  local dy = self.pos.y - player_y
  self.delta_to_player = {dx, dy}
end

function Shooter:fire(current_time)
  self.time_of_last_fire = current_time

  local x = self.pos.x + self.radius * math.cos(self.angle)
  local y = self.pos.y + self.radius * math.sin(self.angle)
  local bullet = Bullet:new({x = x, y = y}, self.angle)
  game.bullets[bullet.id] = bullet
end

function Shooter:on_collide(dt, shape_one, shape_two, mtv_x, mtv_y)
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
