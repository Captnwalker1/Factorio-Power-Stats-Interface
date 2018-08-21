data:extend(
{
  {
		type = "technology",
		name = "PSC-interface",
		icon_size = 128,
		icon = "__PowerStatsCircuit__/graphics/technology/psc-interface.png",
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "PSC-interface",
			},
			
		},
		prerequisites = {"circuit-network"},
		unit = 
		{
			count = 75,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
			},
			time = 10,
		}
  },
------------------------------------------------------------
  {
		type = "recipe",
		name = "PSC-interface",
		enabled = false,
    ingredients = {{"steel-plate", 2},{"copper-plate", 2},{"constant-combinator", 1},{"copper-cable", 5},{"red-wire", 2},{"green-wire", 2}},
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
		icon = "__PowerStatsCircuit__/graphics/icon/psc-interface.png",
		icon_size = 32,
		place_result = "PSC-interface"
  },
------------------------------------------------------------
  {
    type = "electric-pole",
    name = "PSC-interface",
    icon = "__PowerStatsCircuit__/graphics/icon/psc-interface.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.75, result = "PSC-interface"},
    max_health = 300,
    corpse = "small-remnants",
    track_coverage_during_build_by_moving = false,
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
      filename = "__PowerStatsCircuit__/graphics/entity/psc-interface.png",
      priority = "high",
      width = 136,
      height = 122,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {1.4, -1.0}
    },
    connection_points =
    {
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
  }
});

local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "PSC-constant-combinator"
p.flags = {"placeable-off-grid"}
p.minable.result = nil
p.order = "y"

data:extend{p}