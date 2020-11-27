local _, BS = ...

-- Enchants map
Enchanting = {
    weapon = {
        crusader = {'Caub', 'Fogfig'},
        damage = {},
        healing = {},
        intellect = {'Glico'},
        lifestealing = {'Glico'},
        spellpower = {},
        spirit = {'Glico'},
        unholy = {'Glico'},
        icy = {'Glico'},
        agility1h = {},
        agility2h = {'Glico'}
    },
    shield = {
        stamina = {'Glico'}
    },
    cloak = {
        allresist = {},
        nature = {'Glico'},
        subtlety = {},
        dodge = {}
    },
    chest = {
        mana = {'Glico'},
        health = {},
        stats = {}
    },
    bracer = {
        intellect = {},
        healing = {},
        mp5 = {},
        strength = {},
        spirit = {'Glico'},
        stamina = {'Glico'}
    },
    gloves = {
        fire = {'Adore'},
        agility = {},
        shadow = {},
        frost = {},
        healing = {},
        threat = {}
    },
    boots = {
        speed = {'Adore', 'Caub', 'Fogfig', 'Glico'}
    },
    oils = {
        mana = {'Glico'},
        wizard = {'Glico'}
    }
}

function Enchanting:parseSlot(slot)
    if slot == 'w' or string.find(slot, "weapon") ~= nil then
        return 'weapon';
    elseif slot == 'sh' or string.find(slot, "shield") ~= nil then
        return 'shield';
    elseif slot == 'cl' or string.find(slot, "cloak") ~= nil then
        return 'cloak';
    elseif slot == 'ch' or string.find(slot, "chest") ~= nil then
        return 'chest';
    elseif slot == 'br' or string.find(slot, "bracer") ~= nil or string.find(slot, "wrist") ~= nil then
        return 'bracer';
    elseif slot == 'gl' or string.find(slot, "glove") ~= nil then
        return 'gloves';
    elseif slot == 'bo' or string.find(slot, "boot") ~= nil then
        return 'boots';
    elseif string.find(slot, "oil") ~= nil then
        return 'oils';
    else
        return '';
    end
end

function Enchanting:parseEnch(ench)
    if string.find(ench, "stats") ~= nil then
        return 'stats';
    elseif string.find(ench, "crusader") ~= nil then
        return 'crusader';
    elseif string.find(ench, "lifesteal") ~= nil then
        return 'lifestealing';
    elseif string.find(ench, "unholy") ~= nil then
        return 'unholy';
    elseif string.find(ench, "spellpower") ~= nil then
        return 'spellpower';
    elseif string.find(ench, "heal") ~= nil then
        return 'healing';
    elseif string.find(ench, "fire") ~= nil then
        return 'fire';
    elseif string.find(ench, "frost") ~= nil then
        return 'frost';
    elseif string.find(ench, "shadow") ~= nil then
        return 'shadow';
    elseif string.find(ench, "damage") ~= nil then
        return 'damage';
    elseif string.find(ench, "agil") ~= nil then
        return 'agility';
    elseif string.find(ench, "int") ~= nil then
        return 'intellect';
    elseif string.find(ench, "spirit") ~= nil then
        return 'spirit';
    elseif string.find(ench, "stam") ~= nil then
        return 'stamina';
    elseif string.find(ench, "def") ~= nil then
        return 'defense';
    elseif string.find(ench, "mp5") ~= nil then
        return 'mp5';
    elseif string.find(ench, "1h") ~= nil then
        return 'agility1h';
    elseif string.find(ench, "2h") ~= nil then
        return 'agility2h';
    elseif string.find(ench, "stats") ~= nil then
        return 'stats';
    elseif string.find(ench, "strength") ~= nil then
        return 'strength';
    elseif string.find(ench, "subtlety") ~= nil then
        return 'subtlety';
    elseif string.find(ench, "threat") ~= nil then
        return 'threat';
    elseif string.find(ench, "dodge") ~= nil then
        return 'dodge';
    elseif string.find(ench, "resist") ~= nil then
        return 'allresist';
    elseif string.find(ench, "all") ~= nil then
        return 'all';
    else
        return '';
    end
end

function Enchanting:parseInput(args)
    local slot = self:parseSlot(table.remove(args, 1));
    local ench = self:parseEnch(table.remove(args, 1));
    return { slot, ench };
end

function Enchanting:getEnchanters(args)
    local input = self:parseInput(args);
    local slot = table.remove(input, 1);
    local ench = table.remove(input, 1);
    if ench == "all" then
        local enchanters = "";
        for k,v in pairs(Enchanting[slot]) do
            enchanters = enchanters .. string.upper(k) .. ":  " .. table.concat(Enchanting[slot][k], ", ") .. "\n\n";
        end
        return enchanters;
    else
        return table.concat(Enchanting[slot][ench], ", ");
    end
end
