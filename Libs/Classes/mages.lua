local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Mages = {
    roster = { 'Lilschierke', 'Lillybell', 'Arven', 'Firebeard', 'Merloc', 'Glico' },
    offsetRotation = 4, -- offset for our existing rotation to continue
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22498)), --Frostfire Circlet
        Neck = select(2, GetItemInfo(23057)), --Gem of Trapped Innocents
        Shoulder = select(2, GetItemInfo(22983)), --Rime Covered Mantle
        Cloack = select(2, GetItemInfo(23050)),--Cloak of the Necropolis
        Chest = select(2, GetItemInfo(22496)),-- Frostfire Robe
        Wrist = select(2, GetItemInfo(23021)), --The Soul Harvester's Bindings
        Gloves = select(2, GetItemInfo(21585)), --Dark Storm Gauntlets
        Belt = select(2, GetItemInfo(22730)), --Eyestalk Waist Cord
        Legs = select(2, GetItemInfo(23070)), --Leggings of Polarity
        Boots = select(2, GetItemInfo(22500)), --Frostfire Sandals
        Onehand = select(2, GetItemInfo(22807)), --Wraith Blade
        Offhand = select(2, GetItemInfo(23049)), --Sapphiron's Left Eye
        Trinket1 = select(2, GetItemInfo(19379)), --Neltharion's Tear
        Trinket2 = select(2, GetItemInfo(23046)), --The Restrained Essence of Sapphiron
        Trinket3 = select(2, GetItemInfo(19339)), --Mind Quickening Gem
        Ring1 = select(2, GetItemInfo(23062)), --Frostfire Ring
        Ring2 = select(2, GetItemInfo(23237)), --Ring of the Eternal Flame
        --ranged = select(2, GetItemInfo(22821)), --Doomfinger
    },
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
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Mages.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Mages.bisitemslist) end
        },
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
