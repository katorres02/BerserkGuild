local _, BS = ...

--
-- Every profession has its own .lua file with similar functionality. The design
-- is a table of a profession with each level filtering the category. There are two
-- functions to parse the top level and bottom level inputs and find in the table.
--

local selectedProfession = "";
local selectedSubProfession = "";
local subProfessionValues = {""};

Professions = {
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Professions",
        },
        description = {
            order = 1,
            type = "description",
            name = function() return Professions:Description() end,
        },
        selectprofession = {
            order = 2,
            type = "select",
            name = "Select Profession",
            values = {
                Alchemy = "Alchemy",
                Blacksmithing = "Blacksmithing",
                Enchanting = "Enchanting",
                Leatherworking = "Leatherworking",
                Tailoring = "Tailoring"
            },
            get = function(info)
                return selectedProfession;
            end,
            set = function(info, value)
                Professions:updateOptions(value);
            end,
        },
        selectsubprof = {
            order = 3,
            type = "select",
            name = function(info) return selectedProfession; end,
            values = subProfessionValues;
            get = function(info)
                return selectedSubProfession;
            end,
            set = function(info, value)
                Professions:updateSubOptions(value);
            end,
        },
        professors = {
            order = 4,
            type = "description",
            name = function() return Professions:updateProfessors() end;
        }
    }
}

function Professions:updateOptions(value)
    selectedProfession = value;
    selectedSubProfession = "";
    count = #subProfessionValues
    for i=0, count do subProfessionValues[i]=nil end
    if value == "Alchemy" then
        table.insert(subProfessionValues, "Flasks");
        table.insert(subProfessionValues, "Elixirs");
        table.insert(subProfessionValues, "Resist Potions");
        table.insert(subProfessionValues, "Miscellaneous");
    elseif value == "Blacksmithing" then
        table.insert(subProfessionValues, "Armor");
        table.insert(subProfessionValues, "Weapon");
        table.insert(subProfessionValues, "Miscellaneous");
    elseif value == "Enchanting" then
        table.insert(subProfessionValues, "Boots");
        table.insert(subProfessionValues, "Bracer");
        table.insert(subProfessionValues, "Chest");
        table.insert(subProfessionValues, "Cloak");
        table.insert(subProfessionValues, "Gloves");
        table.insert(subProfessionValues, "Shield");
        table.insert(subProfessionValues, "Weapon");
        table.insert(subProfessionValues, "Oils");
    elseif value == "Leatherworking" then
        table.insert(subProfessionValues, "Armor");
        table.insert(subProfessionValues, "Cloak");
    elseif value == "Tailoring" then
        table.insert(subProfessionValues, "Bags");
        table.insert(subProfessionValues, "Armor");
        table.insert(subProfessionValues, "Cloak");
    end
end

function Professions:updateSubOptions(value)
    selectedSubProfession = value;
end

function Professions:updateProfessors()
    local professors = "";
    if selectedProfession == "Alchemy" and selectedSubProfession ~= "" then
        professors = Professions:Alchemy();
    elseif selectedProfession == "Blacksmithing" and selectedSubProfession ~= "" then
        professors = Professions:Blacksmithing();
    elseif selectedProfession == "Enchanting" and selectedSubProfession ~= "" then
        professors = Professions:Enchanting();
    elseif selectedProfession == "Leatherworking" and selectedSubProfession ~= "" then
        professors = Professions:Leatherworking();
    elseif selectedProfession == "Tailoring" and selectedSubProfession ~= "" then
        professors = Professions:Tailoring();
    end
    return professors;
end


function Professions:Alchemy()
    local args = { 
        string.lower(subProfessionValues[selectedSubProfession]),
        "all"
    };
    return Alchemy:getAlchemists(args);
end

function Professions:Blacksmithing()
    local args = { 
        string.lower(subProfessionValues[selectedSubProfession]),
        "all"
    };
    return Blacksmithing:getBlacksmiths(args);
end

function Professions:Enchanting()
    local args = { 
        string.lower(subProfessionValues[selectedSubProfession]),
        "all"
    };
    return Enchanting:getEnchanters(args);
end

function Professions:Leatherworking()
    local args = { 
        string.lower(subProfessionValues[selectedSubProfession]),
        "all"
    };
    return Leatherworking:getLeatherworkers(args);
end

function Professions:Tailoring()
    local args = { 
        string.lower(subProfessionValues[selectedSubProfession]),
        "all"
    };
    return Tailoring:getTailors(args);
end

function Professions:Description()
    return "Find what guildies make the stuff you need"
end
