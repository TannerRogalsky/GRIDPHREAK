-- Helper assignments and erata
g = love.graphics
GRAVITY = 800
math.tau = math.pi * 2

-- The pixel grid is actually offset to the center of each pixel. So to get clean pixels drawn use 0.5 + integer increments.
g.setPoint(2.5, "rough")
function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end
function math.clamp(low, n, high) return math.min(math.max(low, n), high) end
function pointInCircle(circle, point) return (point.x-circle.x)^2 + (point.y - circle.y)^2 < circle.radius^2 end
globalID = 0
function generateID() globalID = globalID + 1 return globalID end

-- Put any game-wide requirements in here
require 'lib/middleclass'
Stateful = require 'lib/stateful'
skiplist = require "lib/skiplist"
HC = require 'lib/HardonCollider'
inspect = require 'lib/inspect'
cron = require 'lib/cron'

-- Game classes
require 'base'
require 'game'
require 'level'
require 'character'
require 'player_character'
require 'bullet'
require 'gun'
require 'torch'

require 'enemy'
require 'crawler'
require 'shooter'
require 'boss'

-- Game states
require 'states.loading'
require 'states.main'
require 'states.menu'
require 'states.game_over'

