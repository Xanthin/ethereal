
-- Waterlily (built column by column, bottom to top)
local s = "default:sand"
local w = "default:water_source"
local l = "flowers:waterlily"


ethereal.waterlily = {
	size = {x=1, y=3, z=1},
	data = {

		{name=s, param1=255, force_place=true},
		{name=w, param1=255, force_place=true},
		{name=l, param1=255},

	},
	yslice_prob = {
		{ypos=1, prob=127},
	},
}
