local _, BS = ...

-- Enchants map
Enchanting = {
    categories = {
        'Weapon',
        'Shield',
        'Cloak',
        'Chest',
        'Bracer',
        'Gloves',
        'Boots',
        'Oils'
    },
    weapon = {
        crusader = {
            'Crusader',
            {'Caub', 'Fogfig', 'Fuzzman'}
        },
        damage = {
            'Superior Striking',
            {}
        },
        healing = {
            'Healing Power',
            {}
        },
        intellect = {
            'Mighty Intellect',
            {'Glico'}
        },
        lifestealing = {
            'Lifestealing',
            {'Glico'}
        },
        spellpower = {
            'Spell Power',
            {}
        },
        spirit = {
            'Mighty Spirit',
            {'Glico'}
        },
        unholy = {
            'Unholy',
            {'Glico', 'Fuzzman'}
        },
        icy = {
            'Icy Chill',
            {'Glico', 'Fuzzman'}
        },
        agility1h = {
            'Agility 1H',
            {}
        },
        agility2h = {
            'Agility 2H',
            {'Glico'}
        }
    },
    shield = {
        stamina = {
            'Greater Stamina',
            {'Glico', 'Fuzzman'}
        },
        spirit = {
            'Superior Spirit',
            {'Fuzzman'}
        }
    },
    cloak = {
        allresist = {
            'Greater Resistance All +5',
            {'Fuzzman'}
        },
        nature = {
            'Greater Nature Resistance',
            {'Glico', 'Fuzzman'}
        },
        subtlety = {
            'Subtlety',
            {}
        },
        dodge = {
            'Dodge',
            {}
        }
    },
    chest = {
        mana = {
            'Major Mana',
            {'Glico'}
        },
        health = {
            'Major Health',
            {'Fuzzman'}
        },
        stats = {
            'Greater Stats',
            {}
        }
    },
    bracer = {
        intellect = {
            'Greater Intellect',
            {}
        },
        healing = {
            'Healing Power',
            {'Fuzzman'}
        },
        mp5 = {
            'Mana Regeneration',
            {'Glico', 'Fuzzman'}
        },
        strength = {
            'Superior Strength',
            {'Fuzzman'}
        },
        spirit = {
            'Superior Spirit',
            {'Glico'}
        },
        stamina = {
            'Superior Stamina',
            {'Glico'}
        }
    },
    gloves = {
        fire = {
            'Fire Power',
            {'Adore', 'Fogfig', 'Caub'}
        },
        agility = {
            'Greater Agility',
            {'Fuzzman'}
        },
        shadow = {
            'Shadow Power',
            {}
        },
        frost = {
            'Frost Power',
            {'Fogfig'}
        },
        healing = {
            'Healing Power',
            {'Fogfig'}
        },
        threat = {
            'Threat',
            {}
        }
    },
    boots = {
        speed = {
            'Minor Run Speed',
            {'Adore', 'Caub', 'Fogfig', 'Glico', 'Fuzzman'}
        }
    },
    oils = {
        mana = {
            'Brilliant Mana Oil',
            {'Glico', 'Fuzzman'}
        },
        wizard = {
            'Brilliant Wizard Oil',
            {'Glico', 'Fuzzman'}
        }
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

function Enchanting:parseCaty(ench)
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
