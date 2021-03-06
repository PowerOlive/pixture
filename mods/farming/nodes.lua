
--
-- Nodes
--

minetest.register_node(
   "farming:wheat_1",
   {
      description = "Wheat Seed",
      drawtype = "plantlike",
      tiles = {"farming_wheat_1.png"},
      inventory_image = "farming_wheat_seed.png",
      wield_image = "farming_wheat_seed.png",
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:wheat"}, rarity = 3}
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:wheat_2",
   {
      description = "Wheat",
      drawtype = "plantlike",
      tiles = {"farming_wheat_2.png"},
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:wheat"}, rarity = 2}
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2, not_in_craftingguide = 1},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:wheat_3",
   {
      description = "Wheat",
      drawtype = "plantlike",
      tiles = {"farming_wheat_3.png"},
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:wheat"}, rarity = 1}
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2, not_in_craftingguide = 1},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:wheat_4",
   {
      description = "Wheat",
      drawtype = "plantlike",
      tiles = {"farming_wheat_4.png"},
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:wheat"}, rarity = 1},
	    {items = {"farming:wheat 2"}, rarity = 4},
	    {items = {"farming:wheat_1"}, rarity = 1},
	    {items = {"farming:wheat_1"}, rarity = 2},
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2, not_in_craftingguide = 1},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:cotton_1",
   {
      description = "Cotton Seed",
      drawtype = "plantlike",
      tiles = {"farming_cotton_1.png"},
      inventory_image = "farming_cotton_seed.png",
      wield_image = "farming_cotton_seed.png",
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:cotton"}, rarity = 3}
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:cotton_2",
   {
      description = "Cotton",
      drawtype = "plantlike",
      tiles = {"farming_cotton_2.png"},
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:cotton"}, rarity = 2}
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2, not_in_craftingguide = 1},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:cotton_3",
   {
      description = "Cotton",
      drawtype = "plantlike",
      tiles = {"farming_cotton_3.png"},
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:cotton"}, rarity = 1}
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2, not_in_craftingguide = 1},
      sounds=default.node_sound_leaves_defaults()
   }
)

minetest.register_node(
   "farming:cotton_4",
   {
      description = "Cotton",
      drawtype = "plantlike",
      tiles = {"farming_cotton_4.png"},
      paramtype = "light",
      waving = 1,
      walkable = false,
      buildable_to = true,
      is_ground_content = true,
      drop = {
	 items = {
	    {items = {"farming:cotton"}, rarity = 1},
	    {items = {"farming:cotton 2"}, rarity = 4},
	    {items = {"farming:cotton_1"}, rarity = 1},
	    {items = {"farming:cotton_1"}, rarity = 2},
	 }
      },
      selection_box = {
	 type = "fixed",
	 fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+(4/16), 0.5}
      },
      groups = {dig_immediate=2, not_in_craftingguide = 1},
      sounds=default.node_sound_leaves_defaults(),
      on_punch = function(pos, node, player)
         local name = player:get_wielded_item():get_name()

         if name == "default:shears" then
            minetest.set_node(pos, {name = "farming:cotton_2"})

            -- Drop some seeds

            if math.random(1, 2) == 1 then
               item_drop.drop_item(pos, "farming:cotton_1")
            end

            -- Drop an extra cotton ball

            for i = 1, 2 do
               if math.random(1, 4) == 1 then -- 25% chance of dropping 2x
                  item_drop.drop_item(pos, "farming:cotton 2")
               else
                  item_drop.drop_item(pos, "farming:cotton")
               end
            end

            -- Keep it growing

            farming.begin_growing_plant(pos)
         end
      end,
   }
)

minetest.register_node(
   "farming:cotton_bale",
   {
      description = "Cotton Bale",
      tiles ={"farming_cotton_bale.png"},
      is_ground_content = false,
      groups = {snappy = 2, oddly_breakable_by_hand = 3,
                fall_damage_add_percent = -15, fuzzy = 1},
      sounds = default.node_sound_leaves_defaults(),
   }
)

minetest.register_alias("farming:cotton_seed", "farming:cotton_1")
minetest.register_alias("farming:wheat_seed", "farming:wheat_1")

default.log("nodes", "loaded")
