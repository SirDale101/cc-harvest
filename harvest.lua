---------------------------------------------------------
--Author: SirDale101
--Date: 26/06/23
--Goal: An automated crop harvester for computer craft
--------------------------------------------------------

--Main


--Fuel Function
function checkFuel()
    if turtle.getFuelLevel < 100 then
        for i = 1, 16 do
            turtle.select(i)
            if turtle.refuel(0) then
                turtle.refuel()
            end
        end
    end
end

--Harvest Function
function harvest()
    turtle.digDown()
end

--Store Function

--Drop Items Function

--Return To Base Function