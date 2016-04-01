
local S = ethereal.intllib

-- override default dirt (to stop caves cutting away dirt)
minetest.override_item("default:dirt", {is_ground_content = ethereal.cavedirt})

-- green dirt
minetest.register_node("ethereal:green_dirt", {
	description = S("Green Dirt"),
	tiles = {
		"default_grass.png",
		"default_dirt.png",
		"default_dirt.png^default_grass_side.png"
	},
	is_ground_content = ethereal.cavedirt,
	groups = {crumbly = 3, soil = 1, ethereal_grass = 1},
	soil = {
		base = "ethereal:green_dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults()
})

-- dry dirt
minetest.register_node("ethereal:dry_dirt", {
	description = S("Dried Dirt"),
	tiles = {"ethereal_dry_dirt.png"},
	is_ground_content = ethereal.cavedirt,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
	type = "cooking",
	output = "ethereal:dry_dirt",
	recipe = "default:dirt",
	cooktime = 3,
})

local dirts = {
	"Bamboo", "Jungle", "Grove", "Prairie", "Cold",
	"Crystal", "Mushroom", "Fiery", "Gray"
}

for n = 1, #dirts do

	local desc = dirts[n]
	local name = desc:lower()

	minetest.register_node("ethereal:"..name.."_dirt", {
		ddescription = S(desc.." Dirt"),
		tiles = {
			"ethereal_grass_"..name.."_top.png",
			"default_dirt.png",
			"default_dirt.png^ethereal_grass_"..name.."_side.png"
		},
		is_ground_content = ethereal.cavedirt,
		groups = {crumbly = 3, soil = 1, ethereal_grass = 1},
		soil = {
			base = "ethereal:"..name.."_dirt",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		},
		drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults()
	})

end

-- re-register dirt types for abm
dirts = {
	"ethereal:bamboo_dirt", "ethereal:jungle_dirt", "ethereal:grove_dirt",
	"ethereal:prairie_dirt", "ethereal:cold_dirt", "ethereal:crystal_dirt",
	"ethereal:mushroom_dirt", "ethereal:fiery_dirt", "ethereal:gray_dirt",
	"default:dirt_with_dry_grass"
}

-- check surrounding grass and change dirt to same colour
minetest.register_abm({
	nodenames = {"default:dirt_with_grass", "default:dirt"},
	neighbors = {"air"},
	interval = 6,
	chance = 65,
	catch_up = false,

	action = function(pos, node)

		-- not enough light
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}

		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- water above grass
		local name = minetest.get_node(above).name
		local nodef = minetest.registered_nodes[name]

		if name == "ignore" or not nodef or nodef.liquidtype ~= "none" then
			return
		end

		local curr_max, num  = 0
		local curr_type = "ethereal:green_dirt" -- fallback
		local positions, grasses = minetest.find_nodes_in_area(
			{x = (pos.x - 2), y = (pos.y - 2), z = (pos.z - 2)},
			{x = (pos.x + 2), y = (pos.y + 2), z = (pos.z + 2)},
			"group:ethereal_grass")

		-- count new grass nodes
		for n = 1, #dirts do

			num = grasses[dirts[n]] or 0

			if num > curr_max then
				curr_max = num
				curr_type = dirts[n]
			end
		end

		minetest.swap_node(pos, {name = curr_type})
	end
})

-- have dirt with dry grass spreads like ethereal grasses
minetest.override_item("default:dirt_with_dry_grass", {
	groups = {crumbly = 3, soil = 1, ethereal_grass = 1},
})

-- if grass devoid of light, change to dirt
minetest.register_abm({
	nodenames = {"group:ethereal_grass"},
	interval = 8,
	chance = 40, -- 50
	catch_up = false,
	action = function(pos, node)

		local name = minetest.get_node({
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}).name

		local nodedef = minetest.registered_nodes[name]

		if name ~= "ignore" and nodedef
		and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
		and nodedef.liquidtype == "none") then

			minetest.swap_node(pos, {name = "default:dirt"})
		end
	end
})

-- If Baked Clay mod not active, make Red, Orange and Grey nodes
if not minetest.get_modpath("bakedclay") then

	minetest.register_node(":bakedclay:red", {
		description = S("Red Baked Clay"),
		tiles = {"baked_clay_red.png"},
		groups = {cracky = 3},
		is_ground_content = ethereal.cavedirt,
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node(":bakedclay:orange", {
		description = S("Orange Baked Clay"),
		tiles = {"baked_clay_orange.png"},
		groups = {cracky = 3},
		is_ground_content = ethereal.cavedirt,
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node(":bakedclay:grey", {
		description = S("Grey Baked Clay"),
		tiles = {"baked_clay_grey.png"},
		groups = {cracky = 3},
		is_ground_content = ethereal.cavedirt,
		sounds = default.node_sound_stone_defaults(),
	})

end

-- Quicksand (old style, sinking inside shows black instead of yellow effect,
-- works ok with noclip enabled though)
minetest.register_node("ethereal:quicksand", {
	description = S("Quicksand"),
	tiles = {"default_sand.png"},
	drop = "default:sand",
	liquid_viscosity = 15,
	liquidtype = "source",
	liquid_alternative_flowing = "ethereal:quicksand",
	liquid_alternative_source = "ethereal:quicksand",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 1,
	walkable = false,
	climbable = false,
	post_effect_color = {r = 230, g = 210, b = 160, a = 245},
	groups = {crumbly = 3, sand = 1, liquid = 3, disable_jump = 1},
	sounds = default.node_sound_sand_defaults(),
})

-- Quicksand (new style, sinking inside shows yellow effect with or without noclip,
-- but old quicksand is shown as black until block placed nearby to update light)
minetest.register_node("ethereal:quicksand2", {
	description = S("Quicksand"),
	tiles = {"default_sand.png"},
	drawtype = "glasslike",
	paramtype = "light",
	drop = "default:sand",
	liquid_viscosity = 15,
	liquidtype = "source",
	liquid_alternative_flowing = "ethereal:quicksand2",
	liquid_alternative_source = "ethereal:quicksand2",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 1,
	walkable = false,
	climbable = false,
	post_effect_color = {r = 230, g = 210, b = 160, a = 245},
	groups = {crumbly = 3, sand = 1, liquid = 3, disable_jump = 1},
	sounds = default.node_sound_sand_defaults(),
})
