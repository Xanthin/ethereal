-- Raw Fish (Thanks to Altairas for her Fish image on DeviantArt)
minetest.register_craftitem("ethereal:fish_raw", {
	description = "Raw Fish",
	inventory_image = "fish_raw.png",
	on_use = minetest.item_eat(2),
})

-- Cooked Fish
minetest.register_craftitem("ethereal:fish_cooked", {
	description = "Cooked Fish",
	inventory_image = "fish_cooked.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	output = "ethereal:fish_cooked",
	recipe = "ethereal:fish_raw",
	cooktime = 2,
})

-- Sashimi (Thanks to Natalia Grosner for letting me use the sashimi image)
minetest.register_craftitem("ethereal:sashimi", {
	description = "Sashimi",
	inventory_image = "sashimi.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = "ethereal:sashimi 2",
	recipe = {
		{'ethereal:seaweed','ethereal:fish_raw','ethereal:seaweed'},
	}
})

-- Worm
minetest.register_craftitem("ethereal:worm", {
	description = "Worm",
	inventory_image = "worm.png",
})

-- Fishing Rod
minetest.register_craftitem("ethereal:fishing_rod", {
	description = "Fishing Rod",
	inventory_image = "fishing_rod.png",
})

minetest.register_craft({
	output = "ethereal:fishing_rod",
	recipe = {
			{"","","default:stick"},
			{"", "default:stick", "farming:string"},
			{"default:stick", "", "farming:string"},
		}
})

-- Sift through 2 Dirt Blocks to find Worm
minetest.register_craft({
	output = "ethereal:worm",
	recipe = {
		{"default:dirt","default:dirt"},
	}
})

-- Fishing Rod (Baited)
minetest.register_craftitem("ethereal:fishing_rod_baited", {
	description = "Baited Fishing Rod",
	inventory_image = "fishing_rod_baited.png",
	wield_image = "fishing_rod_wield.png",
	stack_max = 1,
	liquids_pointable = true,
	on_use = function (itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then return end
		
		local node = minetest.get_node_or_nil(pointed_thing.under)
		if node then node = node.name else return end

		if (node == "default:water_source"
		or node == "default:river_water_source")
		and math.random(1, 100) < 5 then
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name = "ethereal:fish_raw"}) then
				inv:add_item("main", {name = "ethereal:fish_raw"})
				return {name = "ethereal:fishing_rod"}
			else
				minetest.chat_send_player(user:get_player_name(), "Inventory full, Fish Got Away!")
			end
		end
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "ethereal:fishing_rod_baited",
	recipe = {"ethereal:fishing_rod", "ethereal:worm"},
})