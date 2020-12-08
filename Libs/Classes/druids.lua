local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Druids = {
    bisitemslist = {
        -- list of ItemLinks
        Helm = select(2, GetItemInfo(21693)), --Guise of the Devourer
        Neck = select(2, GetItemInfo(22732)), --Mark of C'Thun
        Shoulder = select(2, GetItemInfo(20194)), --Defiler's Leather Shoulders
        Cloack = select(2, GetItemInfo(22938)),--Cryptfiend Silk Cloak
        Chest = select(2, GetItemInfo(23226)),-- Ghoul Skin Tunic
        Wrist = select(2, GetItemInfo(22663)), --Polar Bracers
        Gloves = select(2, GetItemInfo(21672)), --Gloves of Enforcement
        Belt = select(2, GetItemInfo(21675)), --Thick Qirajihide Belt
        Legs = select(2, GetItemInfo(22740)), --Outrider's Leather Pants
        Boots = select(2, GetItemInfo(19381)), --Boots of the Shadow Flame
        Onehand = select(2, GetItemInfo(21268)),
        Offhand = select(2, GetItemInfo(13385)), --Sapphiron's Left Eye
        Trinket1 = select(2, GetItemInfo(22954)),
        Trinket2 = select(2, GetItemInfo(19406)),
        Ring1 = select(2, GetItemInfo(23018)),
        Ring2 = select(2, GetItemInfo(21601)),
    },
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Druids",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Druids:Description() end,
        },
        bis = {
            order = 2,
            type = "header",
            name = "BIS Items",
        },
        bisitemsdesc = {
            order = 3,
            type = "description",
            name = function() return BS:BISDescription(Druids.bisitemslist) end,
        },
        tryon = {
            order = 4,
            name = "Preview",
            type = "execute",
            func = function() BS:Preview(Druids.bisitemslist) end
        },
    }
}

function Druids:Description()
    return "Class relevant info goes here"
end

function Druids:Rotation()
    return ""
end
