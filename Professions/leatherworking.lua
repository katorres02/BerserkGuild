local _, BS = ...

-- Enchants map
Leatherworking = {
    armor = {
        devilsaur = {},
        corehound = {},
        stormshroud = {'Nico'},
        volcanic = {'Nico'},
        blackdragonscale = {},
        dreamscale = {},
        primalbatskin = {'Nico'},
        sandstalker = {'Nico'},
        bramblewood = {},
        polar = {'Nico'},
        icyscale = {'Nico'}
    }, 
    cloak = {
        hideofthewild = {},
        onyxia = {},
        chromatic = {},
        shifting = {'Nico'}
    }
}

function Leatherworking:parseSlot(slot)
    if slot == 'a' or string.find(slot, "armor") ~= nil then
        return 'armor';
    elseif slot == 'cl' or string.find(slot, "cloak") ~= nil then
        return 'cloak';
    else
        return '';
    end
end

function Leatherworking:parseLW(lw)
    if string.find(lw, "devilsaur") ~= nil then
        return 'devilsaur';
    elseif string.find(lw, "corehound") ~= nil then
        return 'corehound';
    elseif string.find(lw, "stormshroud") ~= nil then
        return 'stormshroud';
    elseif string.find(lw, "volcanic") ~= nil then
        return 'volcanic';
    elseif string.find(lw, "black") ~= nil then
        return 'blackdragonscale';
    elseif string.find(lw, "dreamscale") ~= nil then
        return 'dreamscale';
    elseif string.find(lw, "bat") ~= nil then
        return 'primalbatskin';
    elseif string.find(lw, "sandstalker") ~= nil then
        return 'sandstalker';
    elseif string.find(lw, "bramblewood") ~= nil then
        return 'bramblewood';
    elseif string.find(lw, "polar") ~= nil then
        return 'polar';
    elseif string.find(lw, "icy") ~= nil then
        return 'icyscale';
    elseif string.find(lw, "hide") ~= nil then
        return 'hideofthewild';
    elseif string.find(lw, "onyxia") ~= nil then
        return 'onyxia';
    elseif string.find(lw, "chromatic") ~= nil then
        return 'chromatic';
    elseif string.find(lw, "shifting") ~= nil then
        return 'shifting';
    elseif string.find(lw, "all") ~= nil then
        return 'all';
    else
        return '';
    end
end

function Leatherworking:parseInput(args)
    local slot = self:parseSlot(table.remove(args, 1));
    local lw = self:parseLW(table.remove(args, 1));
    return { slot, lw };
end

function Leatherworking:getLeatherworkers(args)
    local input = self:parseInput(args);
    local slot = table.remove(input, 1);
    local lw = table.remove(input, 1);
    if lw == "all" then
        local leatherworkers = "";
        for k,v in pairs(Leatherworking[slot]) do
            leatherworkers = leatherworkers .. string.upper(k) .. ":  " .. table.concat(Leatherworking[slot][k], ", ") .. "\n\n";
        end
        return leatherworkers;
    else
        return table.concat(Leatherworking[slot][lw], ", ");
    end
end
