local _, BS = ...

-- Alchemy map
Alchemy = {
    flask = {
        distilledwisdom = {'Shamattack'},
        supremepower = {'shamattack'},
        titans = {}
    },
    elixir = {
        mongoose = {'Shamattack'},
        giants = {'Shamattack'},
        greaterarcane = {},
        greaterfirepower = {},
        shadowpower = {},
        frostpower = {},
        bruteforce = {}
    }, 
    resistance = {
        greaterfire = {'Shamattack'},
        greaterfrost = {'Shamattack'},
        greatershadow = {},
        greaternature = {'Shamattack'},
        greaterarcane = {}
    },
    miscellaneous = {
        mightyrage = {}
    },
}

function Alchemy:parseSlot(slot)
    if slot == 'f' or string.find(slot, "flask") ~= nil then
        return 'flask';
    elseif slot == 'e' or string.find(slot, "elixir") ~= nil then
        return 'elixir';
    elseif slot == 'r' or string.find(slot, "resist") ~= nil then
        return 'resistance';
    elseif slot == 'm' or string.find(slot, "misc") ~= nil then
        return 'miscellaneous';
    else
        return '';
    end
end

function Alchemy:parseAlch(a)
    if string.find(a, "wisdom") ~= nil then
        return 'distilledwisdom';
    elseif string.find(a, "supreme") ~= nil then
        return 'supremepower';
    elseif string.find(a, "titan") ~= nil then
        return 'titans';
    elseif string.find(a, "mongoose") ~= nil then
        return 'mongoose';
    elseif string.find(a, "giant") ~= nil then
        return 'giants';
    elseif string.find(a, "arcane") ~= nil then
        return 'greaterarcane';
    elseif string.find(a, "firepower") ~= nil then
        return 'firepower';
    elseif string.find(a, "frostpower") ~= nil then
        return 'frostpower';
    elseif string.find(a, "shadowpower") ~= nil then
        return 'shadowpower';
    elseif string.find(a, "brute") ~= nil then
        return 'bruteforce';
    elseif string.find(a, "fire") ~= nil then
        return 'greaterfire';
    elseif string.find(a, "frost") ~= nil then
        return 'greaterfrost';
    elseif string.find(a, "shadow") ~= nil then
        return 'greatershadow';
    elseif string.find(a, "nature") ~= nil then
        return 'greaternature';
    elseif string.find(a, "rage") ~= nil then
        return 'mightyrage';
    elseif string.find(a, "all") ~= nil then
        return 'all';
    else
        return '';
    end
end

function Alchemy:parseInput(args)
    local slot = self:parseSlot(table.remove(args, 1));
    local a = self:parseAlch(table.remove(args, 1));
    return { slot, a };
end

function Alchemy:getAlchemists(args)
    local input = self:parseInput(args);
    local slot = table.remove(input, 1);
    local a = table.remove(input, 1);
    if a == "all" then
        local alchemists = "";
        for k,v in pairs(Alchemy[slot]) do
            alchemists = alchemists .. string.upper(k) .. ":  " .. table.concat(Alchemy[slot][k], ", ") .. "\n\n";
        end
        return alchemists;
    else
        return table.concat(Alchemy[slot][a], ", ");
    end
end
