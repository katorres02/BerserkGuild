local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Rogues = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22478)),
        Neck = select(2, GetItemInfo(19377)),
        Shoulder = select(2, GetItemInfo(22479)),
        Cloack = select(2, GetItemInfo(23045)),
        Chest = select(2, GetItemInfo(22476)),
        Wrist = select(2, GetItemInfo(22483)),
        Gloves = select(2, GetItemInfo(22481)),
        Belt = select(2, GetItemInfo(21586)),
        Legs = select(2, GetItemInfo(22477)),
        Boots = select(2, GetItemInfo(22480)),
        Onehand = select(2, GetItemInfo(23054)),
        Offhand = select(2, GetItemInfo(23577)),
        Trinket1 = select(2, GetItemInfo(23041)),
        Trinket2 = select(2, GetItemInfo(22954)),
        Ring1 = select(2, GetItemInfo(23060)),
        Ring2 = select(2, GetItemInfo(23038)),
        --Ranged = select(2, GetItemInfo(22812)) -- if we enable this the preview wotn show the offhand weapon
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Rogues",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Rogues:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Rogues.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Rogues.bisitemslist) end
        },
    }
}

function Rogues:Description()
    return "Class relevant info goes here"
end

function Rogues:Rotation()
    return ""
end
