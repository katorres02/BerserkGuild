local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Warriors = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(22418)),
        Neck = select(2, GetItemInfo(22732)),
        Shoulder = select(2, GetItemInfo(22419)),
        Cloack = select(2, GetItemInfo(21710)),
        Chest = select(2, GetItemInfo(22416)),
        Wrist = select(2, GetItemInfo(22423)),
        Gloves = select(2, GetItemInfo(21674)),
        Belt = select(2, GetItemInfo(23219)),
        Legs = select(2, GetItemInfo(22417)),
        Boots = select(2, GetItemInfo(22420)),
        Onehand = select(2, GetItemInfo(21126)),
        Offhand = select(2, GetItemInfo(23043)),
        Trinket1 = select(2, GetItemInfo(19406)),
        Trinket2 = select(2, GetItemInfo(22954)),
        Ring1 = select(2, GetItemInfo(23059)),
        Ring2 = select(2, GetItemInfo(21205)),
        --Ranged = select(2, GetItemInfo(22811)) -- if we enable this the preview wotn show the offhand weapon
    },
    bisitemslistDPS = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(12640)),
        Neck = select(2, GetItemInfo(23053)),
        Shoulder = select(2, GetItemInfo(21330)),
        Cloack = select(2, GetItemInfo(23045)),
        Chest = select(2, GetItemInfo(23000)),
        Wrist = select(2, GetItemInfo(22936)),
        Gloves = select(2, GetItemInfo(21581)),
        Belt = select(2, GetItemInfo(23219)),
        Legs = select(2, GetItemInfo(23068)),
        Boots = select(2, GetItemInfo(16545)),
        Onehand = select(2, GetItemInfo(23054)),
        Offhand = select(2, GetItemInfo(23577)),
        Trinket1 = select(2, GetItemInfo(19406)),
        Trinket2 = select(2, GetItemInfo(23041)),
        Ring1 = select(2, GetItemInfo(23038)),
        Ring2 = select(2, GetItemInfo(19325)),
        --Ranged = select(2, GetItemInfo(22811)) -- if we enable this the preview wotn show the offhand weapon
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Warriors",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Warriors:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Tank Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Warriors.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Warriors.bisitemslist) end
        },
        bisdps = {
            order = 5,
            type = "header",
            name = "BIS DPS Items",
        },
        bisitemsdescdps = {
            order = 6,
            type = "description",
            name = function() return BS:BISDescription(Warriors.bisitemslistDPS) end,
        },
        tryondps = {
            order = 7,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Warriors.bisitemslistDPS) end
        },
    }
}

function Warriors:Description()
    return "Class relevant info goes here"
end

function Warriors:Rotation()
    return ""
end
