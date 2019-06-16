-- Generate a Peripheral as a container
Peripheral = {length = table.getn(peripheral.getNames())}
Peripheral.__index = Peripheral

function Peripheral:init()
    self.items = {}
    for i = 1, self.length do 
        local type = peripheral.getType(peripheral.getNames()[i])
        local name = peripheral.getNames()[i]
        local face = ""
        
        if (name ~= "top") and (name ~= "bottom") and (name ~= "left") and (name ~= "right") and (name ~= "front") and (name ~= "back") then
            face = false
        else
            face = name
            name = false
        end
        -- Create readable object for users
        table.insert(self.items, {
            type = type,
            name = name,
            face = face,
            device = peripheral.wrap((name or face))
        })
    end
end
-- Whenever you append the API, it will load all the items neatly
Peripheral:init()

--debug
for i,v in pairs(Peripheral.items[1].device.getAllStacks(false)[1]) do 
    print(i)

end
