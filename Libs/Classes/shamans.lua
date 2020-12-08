local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Shamans = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22466)),
        Neck = select(2, GetItemInfo(21712)),
        Shoulder = select(2, GetItemInfo(22467)),
        Cloack = select(2, GetItemInfo(21583)),
        Chest = select(2, GetItemInfo(22464)),
        Wrist = select(2, GetItemInfo(22471)),
        Gloves = select(2, GetItemInfo(22469)),
        Belt = select(2, GetItemInfo(21582)),
        Legs = select(2, GetItemInfo(22465)),
        Boots = select(2, GetItemInfo(22468)),
        Onehand = select(2, GetItemInfo(23056)),
        Offhand = select(2, GetItemInfo(22819)),
        Trinket1 = select(2, GetItemInfo(23047)),
        Trinket2 = select(2, GetItemInfo(19395)),
        Ring1 = select(2, GetItemInfo(23065)),
        Ring2 = select(2, GetItemInfo(22939)),
        Totem = select(2, GetItemInfo(22396)),
        --Ranged = select(2, GetItemInfo(22812)) -- if we enable this the preview wotn show the offhand weapon
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Shamans",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Shamans:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Shamans.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Shamans.bisitemslist) end
        },
    }
}

function Shamans:Description()
    return "Class relevant info goes here"
end

function Shamans:Rotation()
    return ""
end
