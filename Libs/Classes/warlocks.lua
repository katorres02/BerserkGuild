local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Warlocks = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22506)),
        Neck = select(2, GetItemInfo(23057)),
        Shoulder = select(2, GetItemInfo(22507)),
        Cloack = select(2, GetItemInfo(23050)),
        Chest = select(2, GetItemInfo(22504)),
        Wrist = select(2, GetItemInfo(21186)),
        Gloves = select(2, GetItemInfo(21585)),
        Belt = select(2, GetItemInfo(22730)),
        Legs = select(2, GetItemInfo(23070)),
        Boots = select(2, GetItemInfo(22508)),
        Onehand = select(2, GetItemInfo(22807)),
        Offhand = select(2, GetItemInfo(23049)),
        Trinket1 = select(2, GetItemInfo(19379)),
        Trinket2 = select(2, GetItemInfo(23046)),
        Ring1 = select(2, GetItemInfo(21709)),
        Ring2 = select(2, GetItemInfo(23025)),
        --Ranged = select(2, GetItemInfo(22821)) -- if we enable this the preview wotn show the offhand weapon
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Warlocks",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Warlocks:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Warlocks.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Warlocks.bisitemslist) end
        },
    }
}

function Warlocks:Description()
    return "Class relevant info goes here"
end

function Warlocks:Rotation()
    return ""
end
