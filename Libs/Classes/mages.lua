local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Mages = {
    roster = { 'Lilschierke', 'Lillybell', 'Arven', 'Firebeard', 'Merloc', 'Glico' },
    offsetRotation = 4, -- offset for our existing rotation to continue
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Mages",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Mages:Rotation() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitems = {
            order = 3,
            type = "description",
            name = function() return Mages:BISDescription() end,
        },
        tryon = {
            order = 4,
            name = "Try On",
            type = "execute",
            func = function() Mages:TryOn() end
        }
    }
}

function Mages:BecnhIndex()
    day = date("%a")
    weekno = date("%V")
    if day == "Sun" or day == "Mon" then
        weekno = weekno - 1
    end
    -- +1 because lua starts arrays at 1 and not 0
    return math.fmod(6, (52 - weekno)) + self.offsetRotation
end

function Mages:Bench()
    return self.roster[self:BecnhIndex()]
end

function Mages:StringRoster()
    return table.concat(self.roster, ", ")
end

------------------------------
-- Rotation function is mandatory for every class
-- Should be defined for every class in the game even if there is no bench like rogues.
------------------------------
function Mages:Rotation()
    return "Weekly Mage Rotation\n".."Roster\n    "..self:StringRoster().."\nBench:\n    "..self:Bench()
end

function Mages:BISItems()
    local items = {
        Helm = 22498, --Frostfire Circlet
        Neck = 23057, --Gem of Trapped Innocents
        Shoulder = 22983, --Rime Covered Mantle
        Cloack = 23050,--Cloak of the Necropolis
        Chest = 22496,-- Frostfire Robe
        Wrist = 23021, --The Soul Harvester's Bindings
        Gloves = 21585, --Dark Storm Gauntlets
        Belt = 22730, --Eyestalk Waist Cord
        Legs = 23070, --Leggings of Polarity
        Boots = 22500, --Frostfire Sandals
        Onehand = 22807, --Wraith Blade
        OffJand = 23049, --Sapphiron's Left Eye
        Trinket1 = 19379, --Neltharion's Tear
        Trinket2 = 23046, --The Restrained Essence of Sapphiron
        Trinket3 = 19339, --Mind Quickening Gem
        Ring1 = 23062, --Frostfire Ring
        Ring2 = 23237, --Ring of the Eternal Flame
        --ranged = 22821, --Doomfinger
    }
    return items
end

function Mages:TryOn()
    for k,v in pairs(self:BISItems()) do
        DressUpItemLink(select(2, GetItemInfo(v)))
    end
end

function Mages:BISDescription()
    local result = "";
    for k,v in pairs(self:BISItems()) do
        item = select(2, GetItemInfo(v))
        result = result ..k.. " " ..item.."\n"
    end
    return result
end
