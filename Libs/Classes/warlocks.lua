local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Warlocks = {
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
    }
}

function Warlocks:Description()
    return "Class relevant info goes here"
end

function Warlocks:Rotation()
    return ""
end
