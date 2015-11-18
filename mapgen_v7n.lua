-- clear default mapgen biomes and decorations
minetest.clear_registered_biomes()
minetest.clear_registered_decorations()

local path = minetest.get_modpath("ethereal").."/schematics/"

-- tree schematics
dofile(path.."apple_tree.lua")
dofile(path.."orange_tree.lua")
dofile(path.."banana_tree.lua")
dofile(path.."bamboo_tree.lua")
dofile(path.."birch_tree.lua")
dofile(path.."bush.lua")
dofile(path.."waterlily.lua")

--= Biomes (Minetest 0.4.13 and above)

if ethereal.glacier == 1 then
	minetest.register_biome({
		name = "glacier",
		node_dust = "default:snowblock",
		node_top = "default:snowblock",
		depth_top = 1,
		node_filler = "default:snowblock",
		depth_filler = 3,
		node_stone = "default:ice",
		node_water_top = "default:ice",
		depth_water_top = 10,
		y_min = -8,
		y_max = 31000,
		heat_point = 0,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "glacier_ocean",
		node_dust = "default:snowblock",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		y_min = -112,
		y_max = -9,
		heat_point = 0,
		humidity_point = 50,
	})
end

if ethereal.bamboo == 1 then
minetest.register_biome({
	name = "bamboo",
	node_top = "ethereal:bamboo_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 71,
	heat_point = 45,
	humidity_point = 75,
})

minetest.register_biome({
	name = "bamboo_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 2,
	heat_point = 45,
	humidity_point = 75,
})
end

if ethereal.mesa == 1 then
minetest.register_biome({
	name = "mesa",
	node_top = "bakedclay:orange",
	depth_top = 1,
	node_filler = "bakedclay:orange",
	depth_filler = 15,
	y_min = 1,
	y_max = 71,
	heat_point = 25,
	humidity_point = 28,
})

minetest.register_biome({
	name = "mesa_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 1,
	heat_point = 25,
	humidity_point = 28,
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "bakedclay:red",
	wherein          = {"bakedclay:orange"},
	clust_scarcity   = 4 * 4 * 4,
	clust_num_ores = 8,
	clust_size       = 6,
	y_min            = -10,
	y_max            = 71,
	noise_params     = {
		offset = 0.35,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -316,
		octaves = 1,
		persist = 0.5
	},
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "bakedclay:grey",
	wherein          = {"bakedclay:orange"},
	clust_scarcity   = 4 * 4 * 4,
	clust_num_ores = 8,
	clust_size       = 6,
	y_min            = -10,
	y_max            = 71,
	noise_params     = {
		offset = 0.35,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -613,
		octaves = 1,
		persist = 0.5
	},
})

end

if ethereal.alpine == 1 then
minetest.register_biome({
	name = "alpine",
	node_top = "default:dirt_with_snow",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	y_min = 40,
	y_max = 140,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.snowy == 1 then
minetest.register_biome({
	name = "snowy",
	node_top = "ethereal:cold_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	y_min = 5,
	y_max = 40,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.frost == 1 then
minetest.register_biome({
	name = "frost",
	node_top = "ethereal:crystal_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.grassy == 1 then
minetest.register_biome({
	name = "grassy",
	node_top = "ethereal:green_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 91,
	heat_point = 13,
	humidity_point = 40,
})
end

if ethereal.caves == 1 then
minetest.register_biome({
	name = "caves",
	node_top = "default:desert_stone",
	depth_top = 3,
	node_filler = "air",
	depth_filler = 8,
	y_min = 4,
	y_max = 41,
	heat_point = 15,
	humidity_point = 25,
})
end

if ethereal.grayness == 1 then
minetest.register_biome({
	name = "grayness",
	node_top = "ethereal:gray_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 2,
	y_max = 41,
	heat_point = 15,
	humidity_point = 30,
})

minetest.register_biome({
	name = "grayness_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 1,
	heat_point = 15,
	humidity_point = 30,
})
end

if ethereal.grassytwo == 1 then
minetest.register_biome({
	name = "grassytwo",
	node_top = "ethereal:green_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 91,
	heat_point = 15,
	humidity_point = 40,
})
end

if ethereal.prairie == 1 then
minetest.register_biome({
	name = "prairie",
	node_top = "ethereal:prairie_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 26,
	heat_point = 20,
	humidity_point = 40,
})
end

if ethereal.jumble == 1 then
minetest.register_biome({
	name = "jumble",
	node_top = "ethereal:green_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 25,
	humidity_point = 50,
})
end

if ethereal.junglee == 1 then
minetest.register_biome({
	name = "junglee",
	node_top = "ethereal:jungle_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 30,
	humidity_point = 60,
})
end

if ethereal.desert ==1 then
minetest.register_biome({
	name = "desert",
	node_top = "default:desert_sand",
	depth_top = 5,
	node_filler = "default:desert_stone",
	depth_filler = 70,
	y_min = 3,
	y_max = 23,
	heat_point = 35,
	humidity_point = 20,
})

minetest.register_biome({
	name = "desert_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 2,
	heat_point = 35,
	humidity_point = 20,
})
end

if ethereal.grove == 1 then
minetest.register_biome({
	name = "grove",
	node_top = "ethereal:grove_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler= 5,
	y_min = 3,
	y_max = 23,
	heat_point = 40,
	humidity_point = 60,
})

minetest.register_biome({
	name = "grove_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 2,
	heat_point = 40,
	humidity_point = 60,
})
end

if ethereal.mushroom == 1 then
minetest.register_biome({
	name = "mushroom",
	node_top = "ethereal:mushroom_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 50,
	heat_point = 45,
	humidity_point = 65,
})

minetest.register_biome({
	name = "mushroom_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 2,
	heat_point = 45,
	humidity_point = 65,
})
end

if ethereal.sandstone == 1 then
minetest.register_biome({
	name = "desertstone",
	node_top = "default:sandstone",
	depth_top = 7,
	node_filler = "default:desert_stone",
	depth_filler = 70,
	y_min = 3,
	y_max = 23,
	heat_point = 50,
	humidity_point = 20,
})

minetest.register_biome({
	name = "sandstone_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 2,
	heat_point = 50,
	humidity_point = 20,
})
end

if ethereal.quicksand == 1 then
minetest.register_biome({
	name = "quicksand",
	node_top = "ethereal:quicksand2",
	depth_top = 3,
	node_filler = "default:gravel",
	depth_filler = 1,
	y_min = 1,
	y_max = 1,
	heat_point = 50,
	humidity_point = 38,
})
end

if ethereal.lake == 1 then
minetest.register_biome({
	name = "lake",
	node_top = "default:sand",
	depth_top = 2,
	node_filler = "default:gravel",
	depth_filler = 1,
	node_water = "default:water_source",
	node_dust_water = "default:water_source",
	y_min = -31000,
	y_max = 3,
	heat_point = 50,
	humidity_point = 40,
})
end

if ethereal.plains == 1 then
minetest.register_biome({
	name = "plains",
	node_top = "ethereal:dry_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 25, -- was 61
	heat_point = 65,
	humidity_point = 25,
})

minetest.register_biome({
	name = "savannah",
	node_top = "default:dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 50,
	heat_point = 55,
	humidity_point = 25,
})

minetest.register_biome({
	name = "plains_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 2,
	heat_point = 55,
	humidity_point = 25,
})
end

if ethereal.fiery == 1 then
minetest.register_biome({
	name = "fiery",
	node_top = "ethereal:fiery_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 5,
	y_max = 20, -- was 65
	heat_point = 80,
	humidity_point = 10,
})

minetest.register_biome({
	name = "fiery_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -192,
	y_max = 4,
	heat_point = 80,
	humidity_point = 10,
})
end

if ethereal.sandclay == 1 then
minetest.register_biome({
	name = "sandclay",
	node_top = "default:sand",
	depth_top = 3,
	node_filler = "default:clay",
	depth_filler = 2,
	y_min = 1,
	y_max = 11,
	heat_point = 65,
	humidity_point = 2,
})
end

--= schematic decorations

-- redwood tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"bakedclay:red", "bakedclay:orange"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"mesa"},
	schematic = path.."redwood.mts",
	flags = "place_center_x, place_center_z",
})

-- banana tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:grove_dirt",
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"grove"},
	schematic = ethereal.bananatree,
	flags = "place_center_x, place_center_z",
})

-- healing tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "default:dirt_with_snow",
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"alpine"},
	y_min = 100,
	y_max = 140,
	schematic = path.."yellowtree.mts",
	flags = "place_center_x, place_center_z",
})

-- crystal frost tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:crystal_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"frost"},
	schematic = path.."frosttrees.mts",
	flags = "place_center_x, place_center_z",
})

-- giant mushroom
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:mushroom_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"mushroom"},
	schematic = path.."mushroomone.mts",
	flags = "place_center_x, place_center_z",
})

-- small lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.012,
	biomes = {"fiery"},
	schematic = path.."volcanom.mts",
	flags = "place_center_x, place_center_z",
})

-- large lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"fiery"},
	schematic = path.."volcanol.mts",
	flags = "place_center_x, place_center_z",
})

-- jungle tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:jungle_dirt",
	sidelen = 80,
	fill_ratio = 0.08,
	biomes = {"junglee"},
	schematic = path.."jungletree.mts",
	flags = "place_center_x, place_center_z",
})

-- willow tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:gray_dirt",
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"grayness"},
	schematic = path.."willow.mts",
	flags = "place_center_x, place_center_z",
})

-- pine tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"snowy", "alpine"},
	schematic = path.."pinetree.mts",
	flags = "place_center_x, place_center_z",
})

-- apple tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassy", "jumble"},
	schematic = ethereal.appletree,
	flags = "place_center_x, place_center_z",
})

-- big old tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.005,
	biomes = {"jumble"},
	schematic = path.."bigtree.mts",
	flags = "place_center_x, place_center_z",
})

-- birch tree (was apple)
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassytwo"},
	schematic = ethereal.birchtree,
	flags = "place_center_x, place_center_z",
})

-- orange tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"prairie"},
	schematic = ethereal.orangetree,
	flags = "place_center_x, place_center_z",
})

-- acacia tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 80,
	fill_ratio = 0.004,
	biomes = {"savannah"},
	schematic = path.."acaciatree.mts",
	flags = "place_center_x, place_center_z",
})

-- large cactus (by Paramat)
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 80,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 5,
	y_max = 31000,
	schematic = path.."large_cactus.mts",
	flags = "place_center_x", --, place_center_z",
	rotation = "random",
})

-- palm tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 80,
	fill_ratio = 0.003,
	biomes = {
		"desert_ocean", "plains_ocean", "sandclay",
		"sandstone_ocean", "mesa_ocean", "grove_ocean", "lake",
	},
	y_min = 1,
	y_max = 1,
	schematic = path.."palmtree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--= simple decorations

-- scorched tree
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:dry_dirt",
	sidelen = 80,
	fill_ratio = 0.006,
	biomes = {"plains"},
	decoration = "ethereal:scorched_tree",
	height_max = 6,
})

-- bamboo tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"bamboo"},
	schematic = ethereal.bambootree,
	flags = "place_center_x, place_center_z",
})

-- bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.08,
	biomes = {"bamboo"},
	schematic = ethereal.bush,
	flags = "place_center_x, place_center_z",
})

-- bamboo sprouts & grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.35,
	biomes = {"bamboo"},
	decoration = {"default:grass_2", "default:grass_3"},
})

-- dry shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:dry_dirt", "default:sand", "default:desert_sand",
		"sandstone", "bakedclay:red", "bakedclay:orange"
	},
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"plains", "lake", "desert", "desertstone", "mesa"},
	decoration = "default:dry_shrub",
})

-- dry grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 80,
	fill_ratio = 0.25,
	biomes = {"savannah"},
	decoration = {
		"default:dry_grass_2", "default:dry_grass_3",
		"default:dry_grass_4", "default:dry_grass_5"
	},
})

-- flowers & strawberry
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassy", "grassy", "grassytwo"},
	decoration = {
		"flowers:dandelion_white", "flowers:dandelion_yellow",
		"flowers:geranium", "flowers:rose", "flowers:tulip",
		"flowers:viola", "ethereal:strawberry_7"
	},
})

-- prairie flowers & strawberry
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:prairie_dirt",
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"prairie"},
	decoration = {
		"flowers:dandelion_white", "flowers:dandelion_yellow",
		"flowers:geranium", "flowers:rose", "flowers:tulip",
		"flowers:viola", "ethereal:strawberry_7"
	},
})

-- crystal spike & crystal grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:crystal_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"frost"},
	decoration = {"ethereal:crystal_spike", "ethereal:crystalgrass"},
})

-- red shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:fiery_dirt", 
	sidelen = 80,
	fill_ratio = 0.20,
	biomes = {"fiery"},
	decoration = {"ethereal:dry_shrub"},
})

-- fire flower
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"fiery"},
	decoration = {"ethereal:fire_flower"},
})

-- snowy grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:gray_dirt", "ethereal:cold_dirt"},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"grayness", "snowy"},
	decoration = "ethereal:snowygrass",
})

-- cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:sandstone",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"desertstone"},
	decoration = "default:cactus",
	height_max = 3,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"desert"},
	decoration = "default:cactus",
	height_max = 4,
})

-- wild mushrooms
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:mushroom_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"mushroom"},
	decoration = "flowers:mushroom_fertile_red",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt",
		"ethereal:prairie_dirt", "ethereal:mushroom_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.009,
		spread = {x = 200, y = 200, z = 200},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"junglee", "grassy", "grassytwo", "prairie", "mushroom"},
	y_min = 1,
	y_max = 120,
	decoration = {"flowers:mushroom_fertile_brown", "flowers:mushroom_fertile_red"},
})

-- jungle grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt", "ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.18,
	biomes = {"junglee", "jumble"},
	decoration = "default:junglegrass",
})

-- grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:green_dirt_top", "ethereal:jungle_dirt",
		"ethereal:prairie_dirt", "ethereal:grove_dirt"
	},
	sidelen = 80,
	fill_ratio = 0.4,
	biomes = {"grassy", "grassytwo", "jumble", "junglee", "prairie", "grove"},
	decoration = {
		"default:grass_2", "default:grass_3",
		"default:grass_4", "default:grass_5"
	},
})

-- ferns
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:grove_dirt",
	sidelen = 80,
	fill_ratio = 0.2,
	biomes = {"grove"},
	decoration = "ethereal:fern",
})

-- snow
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = 0.8,
	biomes = {"snowy", "alpine"},
	decoration = "default:snow",
})

-- wild onion
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.25,
	biomes = {"grassy", "grassytwo", "jumble", "prairie"},
	decoration = "ethereal:onion_4",
})

-- papyrus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"grassy", "junglee"},
	decoration = "default:papyrus",
	height_max = 4,
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

--= Farming Redo plants

if farming.mod and farming.mod == "redo" then

print ("[MOD] Ethereal - Farming Redo detected and in use")

-- potato
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"junglee"},
	decoration = "farming:potato_3",
})

-- carrot, cucumber, potato, tomato, corn, coffee, raspberry, rhubarb
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"grassy", "grassytwo", "prairie", "jumble"},
	decoration = {
		"farming:carrot_7", "farming:cucumber_4", "farming:potato_3",
		"farming:tomato_7", "farming:corn_8", "farming:coffee_5",
		"farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"
	},
})

-- melon and pumpkin
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"grassy", "grassytwo", "junglee", "jumble"},
	decoration = {"farming:melon_8", "farming:pumpkin_8"},
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- green beans
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"grassytwo"},
	decoration = "farming:beanbush",
})

-- grape bushel
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"grassytwo", "grassy", "prairie"},
	decoration = "farming:grapebush",
})

end

-- is waterlily in game?
if minetest.registered_nodes["flowers:waterlily"] then
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand", "default:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			"desert_ocean", "plains_ocean", "sandclay",
			"sandstone_ocean", "mesa_ocean", "grove_ocean", "lake",
		},
		y_min = 0,
		y_max = 0,
		schematic = path.."waterlily.mts",
		rotation = "random",
	})
end
