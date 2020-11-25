local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Shamans = {
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
    }
}

function Shamans:Description()
    return "Class relevant info goes here"
end

function Shamans:Rotation()
    return ""
end
