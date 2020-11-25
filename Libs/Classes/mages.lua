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
