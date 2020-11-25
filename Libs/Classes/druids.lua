local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Druids = {
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
    }
}

function Druids:Description()
    return "Class relevant info goes here"
end

function Druids:Rotation()
    return ""
end
