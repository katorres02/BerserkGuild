local _, BS = ...;

Mages = {
    roster = { 'Lilschierke', 'Lillybell', 'Arven', 'Firebeard', 'Merloc', 'Glico' },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "MAGES",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Mages:Rotation() end,
        },
    }
}

function Mages:StringRoster()
    return table.concat(self.roster,", ")
end

function Mages:Bench()
    benchindex = math.fmod(52, date("%V"))
    for i = 1, #self.roster do
        if not i ~= benchindex then
            bench = self.roster[i]
        end
    end
    return bench
end

function Mages:Rotation()
    return "Weekly Mage Rotation\n\n".."Roster\n    "..self:StringRoster().."\nBench:\n    "..self:Bench()
end
