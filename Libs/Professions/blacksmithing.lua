local _, BS = ...

-- Blacksmithing map
Blacksmithing = {
    weapon = {
        nightfall = {
            'Nightfall',
            {}
        },
        sulfuron = {
            'Sulfuron Hammer',
            {}
        }
    },
    armor = {
        lionheart = {
            'Lionheart Helm',
            {}
        },
        titanic = {
            'Titanic Leggings',
            {}
        },
        strongholdgauntlets = {
            'Stronghold Gauntlets',
            {}
        },
        darkiron = {
            'Dark Iron Armor Set',
            {}
        },
        icebane = {
            'Icebane Armor Set',
            {}
        },
        ironvine = {
            'Ironvine Armor Set',
            {}
        }
    }, 
    miscellaneous = {
        elementalsharpeningstone = {
            'Elemental Sharpening Stone',
            {}
        }
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

function Blacksmithing:parseCaty(b)
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
