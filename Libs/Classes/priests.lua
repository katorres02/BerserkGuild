local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Priests = {
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Priests",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Priests:Description() end,
        },
    }
}

function Priests:Description()
    return "Class relevant info goes here"
end

function Priests:Rotation()
    return ""
end
