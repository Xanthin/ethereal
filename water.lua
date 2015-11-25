-- Ice Brick
minetest.register_node("ethereal:icebrick", {
	description = "Ice Brick",
	tiles = {"brick_ice.png"},
	paramtype = "light",
	freezemelt = "default:water_source",
	is_ground_content = false,
	groups = {cracky = 3, melts = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = 'ethereal:icebrick 4',
	recipe = {
		{'default:ice', 'default:ice'},
		{'default:ice', 'default:ice'},
	}
})

-- Snow Brick
minetest.register_node("ethereal:snowbrick", {
	description = "Snow Brick",
	tiles = {"brick_snow.png"},
	paramtype = "light",
	freezemelt = "default:water_source",
	is_ground_content = false,
	groups = {crumbly = 3, melts = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain = 0.25},
		dug = {name="default_snow_footstep", gain = 0.75},
	}),
})

minetest.register_craft({
	output = 'ethereal:snowbrick 4',
	recipe = {
		{'default:snowblock', 'default:snowblock'},
		{'default:snowblock', 'default:snowblock'},
	}
})

-- Over time Cobble placed in water changes to Mossy Cobble
minetest.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"group:water"},
	interval = 17,
	chance = 100,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:mossycobble"})
	end
})

-- If Crystal Spike, Crystal Dirt, Snow near Water, change Water to Ice
minetest.register_abm({
	nodenames = {
		"ethereal:crystal_spike", "default:snow", "default:snowblock",
		"ethereal:snowbrick"
	},
	neighbors = {"default:water_source", "default:river_water_source"},
	interval = 15,
	chance = 4,
	catch_up = false,
	action = function(pos, node)
		local water = minetest.find_nodes_in_area_under_air(
			{x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
			{"default:water_source", "default:river_water_source"})

		if water and #water > 0 then
			minetest.set_node(water[1], {name = "default:ice"})
		end
	end,
})

-- If Heat Source near Ice or Snow then melt
minetest.register_abm({
	nodenames = {
		"default:ice", "default:snowblock", "default:snow",
		"default:dirt_with_snow", "ethereal:snowbrick", "ethereal:icebrick"
	},
	neighbors = {
		"fire:basic_fire", "default:lava_source", "default:lava_flowing",
		"default:furnace_active", "default:torch"
	},
	interval = 5,
	chance = 4,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if node.name == "default:ice"
		or node.name == "default:snowblock"
		or node.name == "ethereal:icebrick"
		or node.name == "ethereal:snowbrick" then
			minetest.set_node(pos, {name = "default:river_water_source"})
		elseif node.name == "default:snow" then
			minetest.set_node(pos, {name = "default:river_water_flowing"})
		elseif node.name == "default:dirt_with_snow" then
			minetest.set_node(pos, {name = "default:dirt_with_grass"})
		end
		nodeupdate(pos)
	end,
})

-- If Water Source near Dry Dirt, change to normal Dirt
minetest.register_abm({
	nodenames = {"ethereal:dry_dirt", "default:dirt_with_dry_grass"},
	neighbors = {"group:water"},
	interval = 15,
	chance = 2,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if node == "ethereal:dry_dirt" then
			minetest.set_node(pos, {name = "default:dirt"})
		else
			minetest.set_node(pos, {name = "ethereal:green_dirt"})
		end
	end,
})

-- If torch touching water then drop as item
minetest.register_abm({
	nodenames = {"default:torch"},
	neighbors = {"group:water"},
	interval = 5,
	chance = 1,
	catch_up = false,
	action = function(pos, node)
		local num = #minetest.find_nodes_in_area(
			{x = pos.x - 1, y = pos.y, z = pos.z},
			{x = pos.x + 1, y = pos.y, z = pos.z},
			{"group:water"})
		num = num + #minetest.find_nodes_in_area(
			{x = pos.x, y = pos.y, z = pos.z - 1},
			{x = pos.x, y = pos.y, z = pos.z + 1},
			{"group:water"})
		num = num + #minetest.find_nodes_in_area(
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{"group:water"})
		if num > 0 then
			minetest.set_node(pos, {name = "default:water_flowing"})
			minetest.add_item(pos, {name = node.name})
		end
	end,
})