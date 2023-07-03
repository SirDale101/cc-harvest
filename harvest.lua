---------------------------------------------------------
--Author: SirDale101
--Date: 26/06/23
--Goal: An automated crop harvester for computer craft
--------------------------------------------------------

--Main


--Fuel Function
function checkFuel()
    if turtle.getFuelLevel() < 100 then
        for i = 1, 16 do
            turtle.select(i)
            if turtle.refuel(0) then
                turtle.refuel()
            end
        end
    end
end

--Go To Start Function
function goToStart()
    source_x, source_y, source_z = gps.locate()
    destination_x, destination_y, destination_z = 0
    --Calculations for travel values
    distance_x = destination_x - source_x
    distnace_y = destination_y - source_y
    distance_z = destination_z - source_z
    --PATH FINDING GLOBAL
    --Path Finding for Y Axis (Up or Down)
    if distnace_y > 0 then
        for i=1, distnace_y do
            turtle.up()
        end
    else
        for i=-1, distnace_y, -1 do
            turtle.down()
        end
    end
    --THOUGHT: NEED TO FIND WHAT DIRECTION I AM FACING
    --Path Finding for Z Axis (Left or Right)
    if distance_z > 0 then
        turtle.right()
        for i=1, distance_z do
            turtle.forward()
        end
    else
        turtle.left()
        for i=-1, distance_z, -1 do
            turtle.forward()
        end
    end
    --Path Finding for X Axis Forward or Backward
    if distance_x > 0 then
        for i=1, distance_x do
            turtle.forward()
        end
    else
        for i=-1, distance_x, -1 do
            turtle.back()
        end
    end
end

--Harvest Function (Harvest only one type of crop & use cobblstone slab border)
function harvest()
    --harvestBool Displays if a block is present (True or False), harvesteMeta Contains the metadata for the crop
    harvestBool,harvestMeta = turtle.inspectDown()
    if harvestBool then
        --Each crop has a metadata value when it grows, for wheat when fully grown it equals 7
        if harvestMeta == 7 then
            turtle.digDown()
            turtle.placeDown()
            turtle.forward()
        else
            turtle.forward()
        end
    end
end

--Store Function
function store()
    --Find's Chest in Inventory and places it down
    for i = 1, 16 do
        turtle.select(i)
        local item = turtle.getItemDetail()
        if item then
            if item.name == "minecraft:chest" then
                turtle.placeDown()
            end
        end
    end
    --Emptys Inventory into Chest
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
end

--Drop Items Function
local whitelist = {'a', 'b', 'c'}
for i = 1, 10, 1 do
    if not whitelist[i] then
        turtle.drop()
    end
end

--Return To Base Function
function returnToBase()
    gps.locate()
    --Parth find to base
end
