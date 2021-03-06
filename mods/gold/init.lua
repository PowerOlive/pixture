--
-- Gold and NPC Trading
-- By Kaadmy, for Pixture
--

gold = {}

gold.pr = PseudoRandom(minetest.get_mapgen_params().seed+8732)

gold.trades = {}
gold.trade_names = {}

if minetest.get_modpath("mobs") ~= nil then
   gold.trades["farmer"] = {
      -- plants
      {"gold:ingot_gold", "", "farming:wheat_1 6"},
      {"gold:ingot_gold 3", "", "farming:cotton_1 4"},
      {"gold:ingot_gold 5", "", "farming:cotton_1 8"},
      {"gold:ingot_gold", "", "default:papyrus 4"},
      {"gold:ingot_gold 4", "", "default:cactus 2"},

      -- crafts
      {"gold:ingot_gold 7", "", "farming:cotton_bale 3"},

      -- materials
      {"default:planks 3", "farming:cotton_bale 3", "bed:bed"},

      -- tool repair
      {"gold:ingot_gold 6", "default:shovel_stone", "default:shovel_stone"},
      {"gold:ingot_gold 8", "default:shovel_steel", "default:shovel_steel"},
      {"gold:ingot_gold 10", "default:shovel_carbonsteel", "default:shovel_carbonsteel"},
   }
   gold.trades["tavernkeeper"] = {
      -- materials
      {"gold:ingot_gold 2", "", "default:planks 12"},
      {"gold:ingot_gold 2", "", "default:planks_birch 8"},

      -- useables
      {"gold:ingot_gold 9", "", "bed:bed"},
      {"gold:ingot_gold 5", "", "default:chest"},
      {"default:planks_birch 3", "mobs:wool 3", "bed:bed"},

      -- filling buckets
      {"gold:ingot_gold", "default:bucket", "default:bucket_water"},
   }
   gold.trades["blacksmith"] = {
      -- smeltables
      {"gold:ingot_gold", "", "default:lump_coal"},
      {"gold:ingot_gold 3", "", "default:lump_iron"},
      {"gold:ingot_gold 5", "", "default:dust_carbonsteel"},

      -- materials
      {"gold:ingot_gold 2", "", "default:cobble 10"},
      {"gold:ingot_gold 3", "", "default:stone 10"},
      {"gold:ingot_gold 5", "", "default:reinforced_cobble 10"},
      {"gold:ingot_gold 25", "", "default:block_steel"},
      {"gold:ingot_gold 6", "", "default:glass 5"},

      -- usebles
      {"gold:ingot_gold 7", "", "default:furnace"},

      -- ingots
      {"gold:ingot_gold 5", "", "default:ingot_steel"},
      {"gold:ingot_gold 8", "", "default:ingot_carbonsteel"},

      -- auto smelting
      {"gold:ingot_gold 2", "default:lump_iron", "default:ingot_steel"},
      {"gold:ingot_gold 4", "default:dust_carbonsteel", "default:ingot_carbonsteel"},

      -- tool repair
      {"gold:ingot_gold 8", "default:pick_stone", "default:pick_stone"},
      {"gold:ingot_gold 12", "default:pick_steel", "default:pick_steel"},
      {"gold:ingot_gold 16", "default:pick_carbonsteel", "default:pick_carbonsteel"},
   }
   gold.trades["butcher"] = {
      -- materials
      {"gold:ingot_gold 3", "", "default:planks_oak 10"},

      -- cooked edibles
      {"gold:ingot_gold 2", "", "mobs:meat"},
      {"gold:ingot_gold 3", "", "mobs:pork"},

      -- raw edibles
      {"gold:ingot_gold 2", "", "mobs:meat_raw 2"},
      {"gold:ingot_gold 3", "", "mobs:pork_raw 2"},

      -- cooking edibles
      {"gold:ingot_gold 1", "mobs:meat_raw", "mobs:meat"},
      {"gold:ingot_gold 2", "mobs:pork_raw", "mobs:pork"},

      -- tool repair
      {"gold:ingot_gold 5", "default:spear_stone", "default:spear_stone"},
      {"gold:ingot_gold 7", "default:spear_steel", "default:spear_steel"},
      {"gold:ingot_gold 11", "default:spear_carbonsteel", "default:spear_carbonsteel"},

   }
   -- trading currency
   if minetest.get_modpath("jewels") ~= nil then -- jewels/gold
      --farmer
      table.insert(gold.trades["farmer"], {"gold:ingot_gold 16", "", "jewels:jewel"})
      table.insert(gold.trades["farmer"], {"gold:ingot_gold 22", "", "jewels:jewel 2"})
      table.insert(gold.trades["farmer"], {"gold:ingot_gold 34", "", "jewels:jewel 4"})

      table.insert(gold.trades["farmer"], {"jewels:jewel", "", "gold:ingot_gold 14"})
      table.insert(gold.trades["farmer"], {"jewels:jewel 2", "", "gold:ingot_gold 20"})
      table.insert(gold.trades["farmer"], {"jewels:jewel 4", "", "gold:ingot_gold 32"})

      table.insert(gold.trades["farmer"], {"default:planks 6", "", "gold:ingot_gold"})

      -- tavern keeper
      table.insert(gold.trades["tavernkeeper"], {"gold:ingot_gold 14", "", "jewels:jewel"})
      table.insert(gold.trades["tavernkeeper"], {"gold:ingot_gold 20", "", "jewels:jewel 2"})
      table.insert(gold.trades["tavernkeeper"], {"gold:ingot_gold 32", "", "jewels:jewel 4"})

      -- blacksmith
      table.insert(gold.trades["blacksmith"], {"default:ingot_steel 14", "", "jewels:jewel"})
      table.insert(gold.trades["blacksmith"], {"default:ingot_steel 20", "", "jewels:jewel 2"})
      table.insert(gold.trades["blacksmith"], {"default:ingot_steel 32", "", "jewels:jewel 4"})
   end

   -- butcher(no mod check)
   table.insert(gold.trades["butcher"], {"mobs:meat_raw 3", "", "gold:ingot_gold"})
   table.insert(gold.trades["butcher"], {"mobs:meat_raw 4", "", "gold:ingot_gold 2"})
   table.insert(gold.trades["butcher"], {"mobs:meat_raw 5", "", "gold:ingot_gold 4"})

   gold.trade_names["farmer"] = "Farmer"
   gold.trade_names["tavernkeeper"] = "Tavern Keeper"
   gold.trade_names["blacksmith"] = "Blacksmith"
   gold.trade_names["butcher"] = "Butcher"
end

local form_trading = ""

form_trading = form_trading .. default.ui.get_page("default:2part")

form_trading = form_trading .. "list[current_player;gold_trade_out;3.75,2.25;1,1;]"
form_trading = form_trading .. "listring[current_player;gold_trade_out]"

form_trading = form_trading .. default.ui.get_hotbar_itemslot_bg(3.75, 2.25, 1, 1)

form_trading = form_trading .. "list[current_player;main;0.25,4.75;8,4;]"
form_trading = form_trading .. default.ui.get_hotbar_itemslot_bg(0.25, 4.75, 8, 1)
form_trading = form_trading .. default.ui.get_itemslot_bg(0.25, 5.75, 8, 3)

form_trading = form_trading .. "list[current_player;gold_trade_in;6.25,1.25;1,2;]"
form_trading = form_trading .. "listring[current_player;gold_trade_in]"
form_trading = form_trading .. default.ui.get_itemslot_bg(6.25, 1.25, 1, 2)

form_trading = form_trading .. "image[2.5,1.25;1,1;ui_arrow_bg.png^[transformR270]"
form_trading = form_trading .. "image[5,2.25;1,1;ui_arrow.png^[transformR90]"

form_trading = form_trading .. default.ui.button_exit(1.25, 3.25, 2, 1, "cancel", "Cancel")
form_trading = form_trading .. default.ui.button(5.25, 3.25, 2, 1, "trade", "Trade")

default.ui.register_page("gold_trading_book", form_trading)

function gold.trade(trade, trade_type, player)
   local name = player:get_player_name()
   local item = player:get_wielded_item()

   if item:get_name() ~= "gold:trading_book" then return end

   local inv = player:get_inventory()

   if inv:get_size("gold_trade_wanted") ~= 2 then
      inv:set_size("gold_trade_wanted", 2)
   end

   if inv:get_size("gold_trade_out") ~= 1 then
      inv:set_size("gold_trade_out", 1)
   end

   if inv:get_size("gold_trade_in") ~= 2 then
      inv:set_size("gold_trade_in", 2)
   end

   inv:set_stack("gold_trade_wanted", 1, trade[1])
   inv:set_stack("gold_trade_wanted", 2, trade[2])

   local meta = minetest.deserialize(item:get_metadata())

   if not meta then meta = {} end
   meta.trade = trade

   local trade_name = gold.trade_names[trade_type]

   local trade_wanted1 = inv:get_stack("gold_trade_wanted", 1)
   local trade_wanted2 = inv:get_stack("gold_trade_wanted", 2)

   local form = default.ui.get_page("gold_trading_book")
   form = form .. "label[0.25,0.25;"..minetest.formspec_escape(trade_name).."]"

   form = form .. default.ui.fake_itemstack(1.25, 1.25, trade_wanted1, "trade_wanted1")
   form = form .. default.ui.fake_itemstack(1.25, 2.25, trade_wanted2, "trade_wanted2")
   form = form .. default.ui.fake_itemstack(3.75, 1.25, ItemStack(trade[3]), "trade_result")

   minetest.show_formspec(name, "gold:trading_book", form)

   meta.trade_type = trade_type

   item:set_metadata(minetest.serialize(meta))
   player:set_wielded_item(item)

   return true
end

minetest.register_on_player_receive_fields(
   function(player, form_name, fields)
      if form_name ~= "gold:trading_book" or fields.cancel then return end

      local inv = player:get_inventory()

      if fields.trade then
	 local item = player:get_wielded_item()

	 local trade_wanted1 = inv:get_stack("gold_trade_wanted", 1):to_string()
	 local trade_wanted2 = inv:get_stack("gold_trade_wanted", 2):to_string()

	 local trade_in1 = inv:get_stack("gold_trade_in", 1):to_string()
	 local trade_in2 = inv:get_stack("gold_trade_in", 2):to_string()

	 local matches = trade_wanted1 == trade_in1 and trade_wanted2 == trade_in2

	 local meta = minetest.deserialize(item:get_metadata())

	 local trade = {"gold:ingot_gold", "gold:ingot_gold", "default:stick"}
	 local trade_type = ""

	 if meta then
	    trade = meta.trade
	    trade_type = meta.trade_type
	 end

	 if matches then
	    if inv:room_for_item("gold_trade_out", trade[3]) then
	       inv:add_item("gold_trade_out", trade[3])
	       inv:set_stack("gold_trade_in", 1, "")
	       inv:set_stack("gold_trade_in", 2, "")
	    end
	 end
      end
end)

-- Items

minetest.register_craftitem(
   "gold:trading_book",
   {
      description = "Trading Book",
      inventory_image = "default_book.png^gold_bookribbon.png",
      stack_max = 1,
})

minetest.register_craftitem(
   "gold:lump_gold",
   {
      description = "Gold Lump",
      inventory_image = "gold_lump_gold.png",
})

minetest.register_craftitem(
   "gold:ingot_gold",
   {
      description = "Gold Ingot",
      inventory_image = "gold_ingot_gold.png",
})

-- Nodes

minetest.register_node(
   "gold:stone_with_gold",
   {
      description = "Stone with Gold",
      tiles ={"default_stone.png^gold_mineral_gold.png"},
      groups = {cracky=1, stone=1},
      drop = "gold:lump_gold",
      is_ground_content = true,
      sounds = default.node_sound_stone_defaults(),
})

-- Ores

minetest.register_ore(
   {
      ore_type       = "scatter",
      ore            = "gold:stone_with_gold",
      wherein        = "default:stone",
      clust_scarcity = 9*9*9,
      clust_num_ores = 12,
      clust_size     = 6,
      y_min          = -60,
      y_max          = -45,
})

-- Crafting

crafting.register_craft(
   {
      output = "gold:trading_book",
      items = {
         "default:book",
         "gold:ingot_gold",
      }
})

minetest.register_craft(
   {
      type = "cooking",
      output = "gold:ingot_gold",
      recipe = "gold:lump_gold",
      cooktime = 7,
})

-- Achievements

achievements.register_achievement(
   "trader",
   {
      title = "Trader",
      description = "Craft a trading book.",
      times = 1,
      craftitem = "gold:trading_book",
})

achievements.register_achievement(
   "gold_rush",
   {
      title = "Gold Rush",
      description = "Dig 60 gold ore.",
      times = 60,
      dignode = "gold:stone_with_gold",
})

default.log("mod:gold", "loaded")
