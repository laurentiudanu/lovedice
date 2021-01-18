local Dice = {}
Dice.__index = Dice

local Die = {}
Die.__index = Die

-- Seed the random number generator
math.randomseed(os.time())

-- The number of sides on our default die
local DEFAULT_SIDES = 6

-- Roll a die (with self.sides sides) and get the result
-- Example: print("You rolled a " .. die:roll())
function Die:roll()
	return (math.floor(math.random() * self.sides) + 1)
end

-- Roll a die and check if one of the arguments is the result
-- Example: if die:rolled(1, 4) print "You rolled 1 or 4" end
function Die:rolled(...)
	local rolled = self:roll()
	for i = 1, select('#', ...) do
		if select(i, ...) == rolled then
			return true
		end
	end
	return false
end

-- Create a new die with the chosen number of sides
-- Example: local die = Dice.newDie(6)
function Dice.newDie(sides)
	if not sides then
		sides = DEFAULT_SIDES
	else
		assert(type(sides) == "number", "sides must be a number (or omit it for a 6-sided die)")
		assert(sides > 0, "sides must be at least 1")
	end
	local self = {sides = sides}
	setmetatable(self, Die)
	return self
end

-- The default die to use for convenience
local default_die = Dice.newDie(DEFAULT_SIDES)

-- Roll the default die
function Dice.roll()
	return default_die:roll()
end


local roomA, roomB, roomC

local die20 = Dice.newDie(20)

roomA = "Square room"
roomB = "Rectangle room"
roomC = "Round room"

print("You rolled a " .. die20:roll())
