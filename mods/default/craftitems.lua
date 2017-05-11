--
-- Crafting items
--

core.register_craftitem(
   "default:fiber",
   {
      description = "Fiber",
      inventory_image = "default_fiber.png",
})

core.register_craftitem(
   "default:stick",
   {
      description = "Stick",
      inventory_image = "default_stick.png",
      groups = {stick = 1}
})

core.register_craftitem(
   "default:paper",
   {
      description = "Paper",
      inventory_image = "default_paper.png",
})

core.register_craftitem(
   "default:book",
   {
      description = "Book",
      inventory_image = "default_book.png",
      wield_scale = {x=1,y=1,z=2},
      stack_max = 1,
})

core.register_craftitem(
   "default:lump_coal",
   {
      description = "Coal Lump",
      inventory_image = "default_lump_coal.png",
})

core.register_craftitem(
   "default:lump_iron",
   {
      description = "Iron Lump",
      inventory_image = "default_lump_iron.png",
})

core.register_craftitem(
   "default:dust_carbonsteel",
   {
      description = "Carbon Steel Dust",
      inventory_image = "default_dust_carbonsteel.png",
})

core.register_craftitem(
   "default:ingot_steel",
   {
      description = "Steel Ingot",
      inventory_image = "default_ingot_steel.png",
})

core.register_craftitem(
   "default:ingot_carbonsteel",
   {
      description = "Carbon Steel Ingot",
      inventory_image = "default_ingot_carbonsteel.png",
})

core.register_craftitem(
   "default:lump_sugar",
   {
      description = "Sugar Lump",
      inventory_image = "default_lump_sugar.png",
      on_use = core.item_eat({hp = 1, sat = 10})
})

core.register_craftitem(
   "default:pearl",
   {
      description = "Pearl",
      inventory_image = "default_pearl.png",
})

core.register_craftitem(
   "default:flint",
   {
      description = "Flint Shard",
      inventory_image = "default_flint.png",
})

core.register_craftitem(
   "default:bucket_water",
   {
      description = "Water Bucket",
      inventory_image = "default_bucket_water.png",
      stack_max = 1,
      wield_scale = {x=1,y=1,z=2},
      liquids_pointable = true,
      on_place = function(itemstack, user, pointed_thing)
         if pointed_thing.type ~= "node" then return end

         local pos_protected = core.get_pointed_thing_position(pointed_thing, true)
         if core.is_protected(pos_protected, user) then return end

         itemstack:take_item()

         local inv=user:get_inventory()

         if inv:room_for_item("main", {name="default:bucket"}) then
            inv:add_item("main", "default:bucket")
         else
            local pos = user:getpos()
            pos.y = math.floor(pos.y + 0.5)
            core.add_item(pos, "default:bucket")
         end

         local pos = pointed_thing.above
         if core.registered_nodes[core.get_node(pointed_thing.under).name].buildable_to then
            pos=pointed_thing.under
         end
         core.add_node(pos, {name = "default:water_source"})

         return itemstack
      end
})

core.register_craftitem(
   "default:bucket_river_water",
   {
      description = "River Water Bucket",
      inventory_image = "default_bucket_river_water.png",
      stack_max = 1,
      wield_scale = {x=1,y=1,z=2},
      liquids_pointable = true,
      on_place = function(itemstack, user, pointed_thing)
         if pointed_thing.type ~= "node" then return end

         local pos_protected = core.get_pointed_thing_position(pointed_thing, true)
         if core.is_protected(pos_protected, user) then return end

         itemstack:take_item()

         local inv=user:get_inventory()

         if inv:room_for_item("main", {name="default:bucket"}) then
            inv:add_item("main", "default:bucket")
         else
            local pos = user:getpos()
            pos.y = math.floor(pos.y + 0.5)
            core.add_item(pos, "default:bucket")
         end

         local pos = pointed_thing.above
         if core.registered_nodes[core.get_node(pointed_thing.under).name].buildable_to then
            pos=pointed_thing.under
         end
         core.add_node(pos, {name = "default:river_water_source"})

         return itemstack
      end
})

core.register_craftitem(
   "default:bucket_swamp_water",
   {
      description = "Swamp Water Bucket",
      inventory_image = "default_bucket_swamp_water.png",
      stack_max = 1,
      wield_scale = {x=1,y=1,z=2},
      liquids_pointable = true,
      on_place = function(itemstack, user, pointed_thing)
         if pointed_thing.type ~= "node" then return end

         local pos_protected = core.get_pointed_thing_position(pointed_thing, true)
         if core.is_protected(pos_protected, user) then return end

         itemstack:take_item()

         local inv=user:get_inventory()

         if inv:room_for_item("main", {name="default:bucket"}) then
            inv:add_item("main", "default:bucket")
         else
            local pos = user:getpos()
            pos.y = math.floor(pos.y + 0.5)
            core.add_item(pos, "default:bucket")
         end

         local pos = pointed_thing.above
         if core.registered_nodes[core.get_node(pointed_thing.under).name].buildable_to then
            pos=pointed_thing.under
         end
         core.add_node(pos, {name = "default:swamp_water_source"})

         return itemstack
      end
})

core.register_craftitem(
   "default:bucket",
   {
      description = "Empty Bucket",
      inventory_image = "default_bucket.png",
      stack_max = 10,
      wield_scale = {x=1,y=1,z=2},
      liquids_pointable = true,
      on_use = function(itemstack, user, pointed_thing)
         if pointed_thing.type ~= "node" then return end

         local nodename=core.get_node(pointed_thing.under).name

         if nodename == "default:water_source" then
            itemstack:take_item()

            local inv=user:get_inventory()

            if inv:room_for_item("main", {name="default:bucket_water"}) then
               inv:add_item("main", "default:bucket_water")
            else
               local pos = user:getpos()
               pos.y = math.floor(pos.y + 0.5)
               core.add_item(pos, "default:bucket_water")
            end

            core.remove_node(pointed_thing.under)
         elseif nodename == "default:river_water_source" then
            itemstack:take_item()

            local inv=user:get_inventory()

            if inv:room_for_item("main", {name="default:bucket_river_water"}) then
               inv:add_item("main", "default:bucket_river_water")
            else
               local pos = user:getpos()
               pos.y = math.floor(pos.y + 0.5)
               core.add_item(pos, "default:bucket_river_water")
            end

            core.remove_node(pointed_thing.under)
         elseif nodename == "default:swamp_water_source" then
            itemstack:take_item()

            local inv=user:get_inventory()

            if inv:room_for_item("main", {name="default:bucket_swamp_water"}) then
               inv:add_item("main", "default:bucket_swamp_water")
            else
               local pos = user:getpos()
               pos.y = math.floor(pos.y + 0.5)
               core.add_item(pos, "default:bucket_swamp_water")
            end

            core.remove_node(pointed_thing.under)
         end

         return itemstack
      end

})


core.register_craftitem(
   "default:fertilizer",
   {
      description = "Fertilizer",
      inventory_image = "default_fertilizer_inventory.png",
      wield_scale = {x=1,y=1,z=2},
      on_place = function(itemstack, user, pointed_thing)
         local pos = pointed_thing.above

         local underdef = core.registered_nodes[core.get_node(pointed_thing.under).name]

         if underdef.groups then
            if underdef.groups.plantable_soil then
               core.remove_node(pos)
               core.set_node(pointed_thing.under, {name = "default:fertilized_dirt"})
            elseif underdef.groups.plantable_sandy then
               core.remove_node(pos)
               core.set_node(pointed_thing.under, {name = "default:fertilized_sand"})
            end
         end

         itemstack:take_item()

         return itemstack
      end,
})

default.log("craftitems", "loaded")
