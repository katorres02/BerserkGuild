local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Hunters = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22438)),
        Neck = select(2, GetItemInfo(19377)),
        Shoulder = select(2, GetItemInfo(22439)),
        Cloack = select(2, GetItemInfo(21710)),
        Chest = select(2, GetItemInfo(22436)),
        Wrist = select(2, GetItemInfo(22443)),
        Gloves = select(2, GetItemInfo(22441)),
        Belt = select(2, GetItemInfo(22442)),
        Legs = select(2, GetItemInfo(22437)),
        Boots = select(2, GetItemInfo(22440)),
        Onehand = select(2, GetItemInfo(22816)),
        Offhand = select(2, GetItemInfo(22802)),
        Trinket1 = select(2, GetItemInfo(23041)),
        Trinket2 = select(2, GetItemInfo(19406)),
        Ring1 = select(2, GetItemInfo(23067)),
        Ring2 = select(2, GetItemInfo(22961)),
        --Ranged = select(2, GetItemInfo(22812)) -- if we enable this the preview wotn show the offhand weapon
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Hunters",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Hunters:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Hunters.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Hunters.bisitemslist) end
        },
    }
}

function Hunters:Description()
    return "Class relevant info goes here"
end

function Hunters:Rotation()
    return ""
end
