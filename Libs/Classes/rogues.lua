local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Rogues = {
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
    }
}

function Rogues:Description()
    return "Class relevant info goes here"
end

function Rogues:Rotation()
    return ""
end
