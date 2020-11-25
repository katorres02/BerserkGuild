local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Hunters = {
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
    }
}

function Hunters:Description()
    return "Class relevant info goes here"
end

function Hunters:Rotation()
    return ""
end
