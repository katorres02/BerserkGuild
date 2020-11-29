local _, BS = ...

-- Enchants map
Leatherworking = {
    categories = {
        'Armor',
        'Cloaks'
    },
    armor = {
        devilsaur = {
            'Devilsaur Armor Set',
            {}
        },
        corehound = {
            'Corehound Armor Set',
            {}
        },
        stormshroud = {
            'Stormshroud Armor Set',
            {'Nico'}
        },
        volcanic = {
            'Volcanic Armor Set',
            {'Nico'}
        },
        blackdragonscale = {
            'Black Dragonscale Armor Set',
            {}
        },
        dreamscale = {
            'Dreamscale Armor Set',
            {}
        },
        primalbatskin = {
            'Primal Batskin Armor Set',
            {'Nico'}
        },
        sandstalker = {
            'Sandstalker Armor Set',
            {'Nico', 'Clarebear'}
        },
        bramblewood = {
            'Bramblewood Armor Set',
            {}
        },
        polar = {
            'Polar Armor Set',
            {'Nico'}
        },
        icyscale = {
            'Icy Scale Armor Set',
            {'Nico'}
        }
    }, 
    cloak = {
        hideofthewild = {
            'Hide of the Wild',
            {}
        },
        onyxia = {
            'Onyxia Scale Cloak',
            {'Clarebear'}
        },
        chromatic = {
            'Chromatic Cloak',
            {}
        },
        shifting = {
            'Shifting Cloak',
            {'Nico'}
        }
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

function Leatherworking:parseCaty(lw)
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
