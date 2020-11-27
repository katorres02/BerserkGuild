local _, BS = ...

-- Blacksmithing map
Blacksmithing = {
    weapon = {
        nightfall = {},
        sulfuron = {}
    },
    armor = {
        lionheart = {},
        titanic = {},
        strongholdgauntlets = {},
        darkiron = {},
        icebane = {},
        ironvine = {}
    }, 
    miscellaneous = {
        elementalsharpeningstone = {}
    }
}

function Blacksmithing:parseSlot(slot)
    if slot == 'a' or string.find(slot, "armor") ~= nil then
        return 'armor';
    elseif slot == 'w' or string.find(slot, "weapon") ~= nil then
        return 'weapon';
    elseif slot == 'm' or string.find(slot, "miscellaneous") ~= nil then
        return 'miscellaneous';
    else
        return '';
    end
end

function Blacksmithing:parseBS(b)
    if string.find(b, "nightfall") ~= nil then
        return 'nightfall';
    elseif string.find(b, "sulfuron") ~= nil then
        return 'sulfuron';
    elseif string.find(b, "lionheart") ~= nil then
        return 'lionheart';
    elseif string.find(b, "titanic") ~= nil then
        return 'titanic';
    elseif string.find(b, "stronghold") ~= nil then
        return 'strongholdgauntlets';
    elseif string.find(b, "darkiron") ~= nil then
        return 'darkiron';
    elseif string.find(b, "icebane") ~= nil then
        return 'icebane';
    elseif string.find(b, "ironvine") ~= nil then
        return 'ironvine';
    elseif string.find(b, "elemental") ~= nil then
        return 'elementalsharpeningstone';
    elseif string.find(b, "all") ~= nil then
        return 'all';
    else
        return '';
    end
end

function Blacksmithing:parseInput(args)
    local slot = self:parseSlot(table.remove(args, 1));
    local bs = self:parseBS(table.remove(args, 1));
    return { slot, bs };
end

function Blacksmithing:getBlacksmiths(args)
    local input = self:parseInput(args);
    local slot = table.remove(input, 1);
    local bs = table.remove(input, 1);
    if bs == "all" then
        local blacksmiths = "";
        for k,v in pairs(Blacksmithing[slot]) do
            blacksmiths = blacksmiths .. string.upper(k) .. ":  " .. table.concat(Blacksmithing[slot][k], ", ") .. "\n\n";
        end
        return blacksmiths;
    else
        return table.concat(Blacksmithing[slot][bs], ", ");
    end
end
