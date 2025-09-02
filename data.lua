
local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")

local graphics = "__snouz_better_asteroid_collector__/graphics"
local ENTITYPATH = graphics .. "/entity/"

if data.raw["asteroid-collector"]["asteroid-collector"] then

  data:extend(
  {
    {
      type = "item",
      name = "snouz_better_asteroid_collector",
      icon = graphics .. "/icons/snouz_better_asteroid_collector.png",
      subgroup = "space-platform",
      order = "de[asteroid-collector2]",
      inventory_move_sound = item_sounds.mechanical_inventory_move,
      pick_sound = item_sounds.mechanical_inventory_pickup,
      drop_sound = item_sounds.mechanical_inventory_move,
      place_result = "snouz_better_asteroid_collector",
      stack_size = 10,
      random_tint_color = item_tints.iron_rust,
      weight = 100 * kg
    },

    {
      type = "recipe",
      name = "snouz_better_asteroid_collector",
      energy_required = 10,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "asteroid-collector", amount = 2},
        {type = "item", name = "quantum-processor", amount = 3},
        {type = "item", name = "electric-engine-unit", amount = 6};
      },
      results = {{type="item", name="snouz_better_asteroid_collector", amount=1}}
    },

    {
      type = "technology",
      name = "snouz_better_asteroid_collector",
      icon = graphics .. "/technology/snouz_better_asteroid_collector_tech.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "snouz_better_asteroid_collector"
        }
      },
      prerequisites = {"quantum-processor"},
      unit =
      {
        count = 1700,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          --{"military-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"electromagnetic-science-pack", 1},
          {"agricultural-science-pack", 1},
          {"cryogenic-science-pack", 1},
          --{"promethium-science-pack", 1}
          
        },
        time = 60
      },
    },
  })
 
  local ascolgraphics = {
    animation =
    {
      north =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-north",
          {
            frame_count = 16,
            scale = 0.5,
            animation_speed = 3,
            width = 236,
            height = 266,
            --shift = util.by_pixel( 0.0, -11.0),
            line_length = 4,
          }),
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
          {
            draw_as_shadow = true,
            frame_sequence = {1,1,1,1},
            frame_count = 4,
            repeat_count = 4,
            scale = 0.5,
          }),
          {
            filename = ENTITYPATH .. "asteroid-collector/asteroid-collector-topper-north.png",
            scale = 0.5,
            width = 300,
            height = 300,
            repeat_count = 16,
            shift = {0,0},
          }
        }
      },
      east =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-east",
          {
            frame_count = 16,
            scale = 0.5,
            animation_speed = 3,
            width = 280,
            height = 228,
            --shift = util.by_pixel( 10.5, 2.0),
            line_length = 4,
          }),
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
          {
            draw_as_shadow = true,
            frame_sequence = {2,2,2,2},
            frame_count = 4,
            repeat_count = 4,
            scale = 0.5,
          }),
          {
            filename = ENTITYPATH .. "asteroid-collector/asteroid-collector-topper-east.png",
            scale = 0.5,
            width = 300,
            height = 300,
            repeat_count = 16,
            shift = {0,0},
          }
        }
      },
      south =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-south",
          {
            frame_count = 16,
            scale = 0.5,
            animation_speed = 3,
            width = 238,
            height = 254,
            --shift = util.by_pixel( 0.5, 6.0),
            line_length = 4,
          }),
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
          {
            draw_as_shadow = true,
            frame_sequence = {3,3,3,3},
            frame_count = 4,
            repeat_count = 4,
            scale = 0.5,
          }),
          {
            filename = ENTITYPATH .. "asteroid-collector/asteroid-collector-topper-south.png",
            scale = 0.5,
            width = 300,
            height = 300,
            repeat_count = 16,
            shift = {0,0},
          }
        }
      },
      west =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-top-west",
          {
            frame_count = 16,
            scale = 0.5,
            animation_speed = 3,
          }),
          util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-shadow",
          {
            draw_as_shadow = true,
            frame_sequence = {4,4,4,4},
            frame_count = 4,
            repeat_count = 4,
            scale = 0.5,
          }),
          {
            filename = ENTITYPATH .. "asteroid-collector/asteroid-collector-topper-west.png",
            scale = 0.5,
            width = 300,
            height = 300,
            repeat_count = 16,
            shift = {0,0},
          }
        }
      }
    },
    status_lamp_picture_on =util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-status-lamp",
    {
      tint = {0,1,0,1},
      blend_mode = "additive",
      draw_as_glow = true,
      direction_count = 4,
      scale = 0.5,
    }),
    status_lamp_picture_full = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-status-lamp",
    {
      tint = {1,0.5,0,1},
      blend_mode = "additive",
      draw_as_glow = true,
      direction_count = 4,
      scale = 0.5,
    }),
    status_lamp_picture_off = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-status-lamp",
    {
      tint = {0.7,0,0,1},
      blend_mode = "additive",
      draw_as_glow = true,
      direction_count = 4,
      scale = 0.5,
    }),
    below_arm_pictures =
    {
      layers =
      {
        util.sprite_load(ENTITYPATH .. "asteroid-collector/asteroid-collector-middle",
        {
          direction_count = 4,
          scale = 0.5,
        }),
      }
    },
    below_ground_pictures =
    {
      layers =
      {
        util.sprite_load(ENTITYPATH .. "asteroid-collector/asteroid-collector-bottom",
        {
          direction_count = 4,
          scale = 0.5,
        }),
      }
    },
    arm_head_animation = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-head",
    {
      frame_count = 5,
      direction_count = 32,
      scale = 0.5,
    }),
    arm_head_top_animation = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-head-top",
    {
      frame_count = 5,
      direction_count = 32,
      scale = 0.5,
    }),
    arm_link = util.sprite_load("__space-age__/graphics/entity/asteroid-collector/asteroid-collector-link",
    {
      --frame_count = 1,
      direction_count = 64,
      scale = 0.5,
    })
  }



  local ascol = table.deepcopy(data.raw["asteroid-collector"]["asteroid-collector"])

  ascol.name = "snouz_better_asteroid_collector"
  ascol.icon = graphics .. "/icons/snouz_better_asteroid_collector.png"
  ascol.graphics_set = ascolgraphics


  ascol.inventory_size = 78 --39
  ascol.inventory_size_quality_increase = 10 --5
  ascol.arm_inventory_size = 7 --5
  ascol.arm_inventory_size_quality_increase = 1 --0
  ascol.max_health = 600 --300


  ascol.passive_energy_usage = "400J" --200
  ascol.arm_energy_usage = "1500J" --1000
  --ascol.arm_slow_energy_usage = "600J" --300
  ascol.energy_usage_quality_scaling = 0.1 --0.1,
  ascol.head_collection_radius = 0.8 --0.6
  ascol.arm_count_base = 2 --1
  ascol.arm_count_quality_scaling = 2 --1,
  ascol.arm_speed_base = 0.6 --0.2,
  ascol.arm_speed_quality_scaling = 0.15 --0.05,
  ascol.arm_angular_speed_cap_base = 0.3 -- 0.2,
  ascol.arm_angular_speed_cap_quality_scaling = 0.08 --0.05,
  --ascol.tether_size = 0.35 --0.35,
  ascol.unpowered_arm_speed_scale = 0.1 --0.3;
  --ascol.held_items_offset = 0.6 --0.6,
  ascol.collection_radius = 12.5--7.5
  ascol.collection_box_offset = 9.0 --5.0
  --ascol.deposit_radius = --1.5
  data:extend({ascol})
end

--if mods["space-age"] then
--  table.insert(data.raw["technology"]["electric-energy-distribution-2-big"].prerequisites, "electromagnetic-science-pack")
--  table.insert(data.raw["technology"]["electric-energy-distribution-2-big"].unit.ingredients, {"electromagnetic-science-pack", 1})
--  table.insert(data.raw["recipe"]["big-substation"].ingredients, {type = "item", name = "supercapacitor", amount = 10})
--end
  