local _, BS = ...

-- Tailoring map
Tailoring = {
    bags = {
        mooncloth = {'Glico'},
        bottomless = {},
        corefelcloth = {},
        satchelofcenarius = {'Glico'},
        bigenchantment = {'Glico'}
    },
    armor = {
        bloodvine = {'Glico'},
        felcloth = {},
        flarecore = {'Glico'},
        sylvan = {'Glico'},
        glacial = {}
    }, 
    cloak = {
        glacial = {},
        gaeasembrace = {'Glico'}
    }
}

function Tailoring:parseSlot(slot)
    if slot == 'a' or string.find(slot, "armor") ~= nil then
        return 'armor';
    elseif slot == 'b' or string.find(slot, "bag") ~= nil then
        return 'bags';
    elseif slot == 'cl' or string.find(slot, "cloak") ~= nil then
        return 'cloak';
    else
        return '';
    end
end

function Tailoring:parseTailor(t)
    if string.find(t, "mooncloth") ~= nil then
        return 'mooncloth';
    elseif string.find(t, "bottomless") ~= nil then
        return 'bottomless';
    elseif string.find(t, "corefelcloth") ~= nil then
        return 'corefelcloth';
    elseif string.find(t, "big") ~= nil then
        return 'bigenchantment';
    elseif string.find(t, "cenarius") ~= nil then
        return 'satchelofcenarius';
    elseif string.find(t, "bloodvine") ~= nil then
        return 'bloodvine';
    elseif string.find(t, "felcloth") ~= nil then
        return 'felcloth';
    elseif string.find(t, "flarecore") ~= nil then
        return 'flarecore';
    elseif string.find(t, "sylvan") ~= nil then
        return 'sylvan';
    elseif string.find(t, "glacial") ~= nil then
        return 'glacial';
    elseif string.find(t, "gaea") ~= nil then
        return 'gaeasembrace';
    elseif string.find(t, "all") ~= nil then
        return 'all';
    else
        return '';
    end
end

function Tailoring:parseInput(args)
    local slot = self:parseSlot(table.remove(args, 1));
    local tl = self:parseTailor(table.remove(args, 1));
    return { slot, tl };
end

function Tailoring:getTailors(args)
    local input = self:parseInput(args);
    local slot = table.remove(input, 1);
    local tl = table.remove(input, 1);
    if tl == "all" then
        local tailors = "";
        for k,v in pairs(Tailoring[slot]) do
            tailors = tailors .. string.upper(k) .. ":  " .. table.concat(Tailoring[slot][k], ", ") .. "\n\n";
        end
        return tailors;
    else
        return table.concat(Tailoring[slot][tl], ", ");
    end
end
