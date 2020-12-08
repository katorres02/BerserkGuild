local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Priests = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22514)),
        Neck = select(2, GetItemInfo(21712)),
        Shoulder = select(2, GetItemInfo(22515)),
        Cloack = select(2, GetItemInfo(22960)),
        Chest = select(2, GetItemInfo(22512)),
        Wrist = select(2, GetItemInfo(21604)),
        Gloves = select(2, GetItemInfo(22517)),
        Belt = select(2, GetItemInfo(21582)),
        Legs = select(2, GetItemInfo(22513)),
        Boots = select(2, GetItemInfo(22516)),
        Onehand = select(2, GetItemInfo(23056)),
        Offhand = select(2, GetItemInfo(23048)),
        Trinket1 = select(2, GetItemInfo(23027)),
        Trinket2 = select(2, GetItemInfo(23047)),
        Ring1 = select(2, GetItemInfo(23061)),
        Ring2 = select(2, GetItemInfo(22939)),
        --Ranged = select(2, GetItemInfo(22812)) -- if we enable this the preview wotn show the offhand weapon
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Priests",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Priests:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Priests.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Priests.bisitemslist) end
        },
    }
}

function Priests:Description()
    return "Class relevant info goes here"
end

function Priests:Rotation()
    return ""
end
