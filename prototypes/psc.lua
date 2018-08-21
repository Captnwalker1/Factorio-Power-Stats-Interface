data:extend(
{
  {
		type = "recipe",
		name = "PSC-interface",
		enabled = true,
    -- ingredients = {{"decider-combinator", 1},{"constant-combinator", 5},{"steel-plate", 10},{"red-wire", 50},{"green-wire", 50}},
    ingredients = {{"steel-plate", 10},{"copper-cable", 5},{"red-wire", 5},{"green-wire", 5}},
		result = "PSC-interface",
		energy_required = 2,
	},
------------------------------------------------------------
	{
		type = "item",
		name = "PSC-interface",
	
		subgroup = "circuit-network",
		flags = {"goes-to-quickbar"},
		stack_size = 30,
		subgroup = "circuit-network",
		icon = "__base__/graphics/icons/medium-electric-pole.png",
		icon_size = 32,
		place_result = "PSC-interface"
  },
------------------------------------------------------------
  {
    type = "electric-pole",
    name = "PSC-interface",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "PSC-interface"},
    max_health = 150,
    corpse = "small-remnants",
    track_coverage_during_build_by_moving = true,
    -- fast_replaceable_group = "electric-pole",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = 7,
    supply_area_distance = 0,
    pictures =
    {
      filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
      priority = "high",
      width = 136,
      height = 122,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {1.4, -1.0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.55, 0.4},
          green = {2.0, 0.4},
          red = {3.05, 0.4}
        },
        wire =
        {
          copper = {-0.03, -2.5},
          green = {-0.35,-2.5},
          red = {0.25,-2.5}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.1},
          green = {2.6, -0.15},
          red = {3.25, 0.35}
        },
        wire =
        {
          copper = {0.05, -2.75},
          green = {-0.15, -2.9},
          red = {0.25, -2.55}
        }
      },
      {
        shadow =
        {
          copper = {1.5, -0.2},
          green = {1.5, -0.55},
          red = {1.5, 0.1}
        },
        wire =
        {
          copper = {-0.43, -2.4},
          green = {-0.43, -2.63},
          red = {-0.43, -2.2}
        }
      },
      {
        shadow =
        {
          copper = {2.88, 0.2},
          green = {3.2, -0.1},
          red = {2.45, 0.4}
        },
        wire =
        {
          copper = {0, -2.7},
          green = {0.22, -2.85},
          red = {-0.24, -2.55}
        }
      }
    },
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    }
  },

  -- {
	-- 	type = "constant-combinator",
	-- 	name = "PSC-constant-combinator",
		
	-- 	--placeable_by = {item = "CW-power-combinator", count = 1},
  --   collision_box = {{0,0},{0,0}},
  --   collision_mask = {},
	-- 	selection_box = {{0.2,-0.5},{1.2,0.5}},
  --   flags = {"placeable-off-grid","player-creation"},--{"placeable-neutral","player-creation"},
  --   order = "y",

	-- 	icon = "__base__/graphics/icons/decider-combinator.png",
  --   icon_size = 32,

  --   item_slot_count = 18,
    
  --   fast_replaceable_group  = "PSC-output",

	-- 	corpse = "small-remnants",
		
	-- 	--draw_circuit_wires = false,
		
	-- 	activity_led_light = {
	-- 	color = {b = 1,g = 1,r = 1},
	-- 		intensity = 0.8,
	-- 		size = 1
	-- 	},
	-- 	activity_led_light_offsets = {{0,0},{0,0},{0,0},{0,0},},
	-- 	activity_led_sprites = {
	-- 		filename = "__core__/graphics/empty.png",
	-- 		frame_count = 1,
	-- 		height = 1,
  --           width = 1
  --   },
        
	-- 	circuit_wire_connection_points = {
	-- 		{
	-- 			shadow = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 			wire = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 		},
	-- 		{
	-- 			shadow = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 			wire = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 		},
	-- 		{
	-- 			shadow = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 			wire = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 		},
	-- 		{
	-- 			shadow = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 			wire = {
	-- 				green = {0.5,0.5},
	-- 				red = {0.5,0.5}
	-- 			},
	-- 		},
        
	-- 	},
      
	-- 	sprites = {
	-- 		filename = "__base__/graphics/entity/combinator/decider-combinator.png",
	-- 		frame_count = 1,
	-- 		height = 66,
	-- 		priority = "high",
	-- 		scale = 1,
	-- 		shift = {0.4, 0.4},
	-- 		width = 78,
	-- 		x = 78,
	-- 	}
  --   },
});

local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "PSC-constant-combinator"
p.minable.result = nil
p.order = "y"

data:extend{p}