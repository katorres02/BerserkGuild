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
            name = "Category",
            values = subProfessionValues;
            get = function(info)
                return selectedSubProfession;
            end,
            set = function(info, value) selectedSubProfession = value; end,
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
    wipe(subProfessionValues);
    for i,v in ipairs(_G[value].categories) do
        table.insert(subProfessionValues, v);
    end
end

function Professions:updateProfessors()
    local professors = "";
    if selectedSubProfession ~= "" then
        local args = { 
            string.lower(subProfessionValues[selectedSubProfession]),
            "all"
        };
        professors = Professions:getProfessors(args, selectedProfession);
    end
    return professors;
end

function Professions:parseInput(args, profession)
    local slot = _G[profession]:parseSlot(args[1]);
    local caty = _G[profession]:parseCaty(args[2]);
    return { slot, caty };
end

function Professions:getProfessors(args, profession)
    profession = profession:gsub("^%l", string.upper);
    local input = self:parseInput(args, profession);
    local slot = input[1];
    local caty = input[2];

    if caty == "all" then
        local proflist = "";
        for k,v in pairs(_G[profession][slot]) do
            local prettyhdr = "\124cFF00DEAD" ..  _G[profession][slot][k][1] .. "\n\124r";
            proflist = proflist .. prettyhdr .. table.concat(_G[profession][slot][k][2], ", ") .. "\n\n";
        end
        return proflist;
    else
        return table.concat(_G[profession][slot][caty][2], ", ");
    end
end

function Professions:Description()
    return "Find what guildies make the stuff you need"
end
