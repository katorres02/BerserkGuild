local _, BS = ...
------------------------------
-- UI definition using AceConfig-3.0 syntax
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
------------------------------
Warriors = {
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
    }
}

function Warriors:Description()
    return "Class relevant info goes here"
end

function Warriors:Rotation()
    return ""
end
