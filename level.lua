Level = class('Level', Base)

function Level:initialize()
  Base.initialize(self)
end

function Level:update(dt)
end

function Level:render()
end

function Level:wave(class, number)
end

function Level:spawn(class, location, ...)
  assert(subclassOf(Enemy, class), "You must specify an enemy subclass to instantiate.")
  location = location or self.get_random_point_offscreen()
  return class:new(location, ...)
end

function Level.get_random_point_offscreen(padding)
  assert(type(padding) == "number", "You probably called this with a colon.")
  padding = padding or 90
  local x, y = math.random(0, g.getWidth()), math.random(0, g.getHeight())
  if math.random(0,1) == 0 then
    if x > g.getWidth() / 2 then
      x = g.getWidth() + padding
    else
      x = 0 - padding
    end
  else
    if y > g.getHeight() / 2 then
      y = g.getHeight() + padding
    else
      y = 0 - padding
    end
  end
  return {x = x, y = y}
end
