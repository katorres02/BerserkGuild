local _, BS = ...

-- Tailoring map
Tailoring = {
    categories = {
        'Bags',
        'Armor',
        'Cloaks',
    },
    bags = {
        mooncloth = {
            'Mooncloth',
            {'Glico'}
        },
        bottomless = {
            'Bottomless',
            {}
        },
        corefelcloth = {
            'Core Felcloth',
            {}
        },
        satchelofcenarius = {
            'Satchel of Cenarius',
            {'Glico'}
        },
        bigenchantment = {
            'Big Bag of Enchantment',
            {'Glico'}
        }
    },
    armor = {
        bloodvine = {
            'Bloodvine Armor Set',
            {'Glico'}
        },
        felcloth = {
            'Felcloth Armor Set',
            {}
        },
        flarecore = {
            'Flarecore Armor Set',
            {'Glico'}
        },
        sylvan = {
            'Sylvan Armor Set',
            {'Glico'}
        },
        glacial = {
            'Glacial Armor Set',
            {}
        }
    }, 
    cloak = {
        glacial = {
            'Glacial Cloak',
            {}
        },
        gaeasembrace = {
            'Gaea\'s Embrace',
            {'Glico'}
        }
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

function Tailoring:parseCaty(t)
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
