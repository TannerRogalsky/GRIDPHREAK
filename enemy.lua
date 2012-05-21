Enemy = class('Enemy', Character)

function Enemy:initialize(pos, radius)
  Character.initialize(self, {})

  self.pos = pos or {x = 0, y = 0}
  self.pos.incr = function(self, k, v) self[k] = self[k] + v end

  self.radius = radius or 15
  self._physics_body = game.collider:addCircle(self.pos.x, self.pos.y, self.radius)
  self._physics_body.parent = self
  self.angle = 0
  self.speed = 2
  self.color = {255,255,255,255}

  self.image = game.preloaded_image["enemy_grey.png"]
  self.image_dimensions = {width = self.image:getWidth(), height = self.image:getHeight()}
end

function Enemy:update(dt)
  local x, y = game.player.pos.x, game.player.pos.y
  self.angle = math.atan2(y - self.pos.y, x - self.pos.x)
  x = self.pos.x + self.speed * math.cos(self.angle)
  y = self.pos.y + self.speed * math.sin(self.angle)
  self:moveTo(x,y)
end

function Enemy:render()
  local x,y = self:bbox()
  g.draw(self.image, x + self.radius, y + self.radius, self.angle, 1, 1, self.image_dimensions.width / 2, self.image_dimensions.height / 2)

  -- self._physics_body:draw("fill")

  -- love.graphics.setColor(0,0,0,255)
  -- x = self.pos.x + self.radius * math.cos(self.angle)
  -- y = self.pos.y + self.radius * math.sin(self.angle)
  -- love.graphics.line(self.pos.x, self.pos.y, x, y)
end
