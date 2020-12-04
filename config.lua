------------------------------
-- variable BS is shared across the files
------------------------------
local _, BS = ...

BerserkAddon = LibStub("AceAddon-3.0"):NewAddon("BerserkAddon", "AceConsole-3.0", "AceEvent-3.0")

local options = {
    name = "BerserkAddon",
    handler = BerserkAddon,
    type = "group",
    args = {
        desc = {
			order = 0,
			type = "description",
			name = "Guild relevant information.",
        },
        deathMessages={
            order = 1,
            name = "Death Messages",
            type = "group",
            handler = DM,
            args = DM.UIOptions
        },
        druids = {
            order = 2,
            name = "Druids",
            type = "group",
            args = Druids.UIOptions
        },
        hunters = {
            order = 3,
            name = "Hunters",
            type = "group",
            args = Hunters.UIOptions
        },
        mages = {
            order = 4,
            name = "Mages",
            type = "group",
            args = Mages.UIOptions
        },
        priests = {
            order = 5,
            name = "Priests",
            type = "group",
            args = Priests.UIOptions
        },
        rogues = {
            order = 6,
            name = "Rogues",
            type = "group",
            args = Rogues.UIOptions
        },
        shamans = {
            order = 7,
            name = "Shamans",
            type = "group",
            args = Shamans.UIOptions
        },
        warlocks = {
            order = 8,
            name = "Warlocks",
            type = "group",
            args = Warlocks.UIOptions
        },
        warriors = {
            order = 9,
            name = "Warriors",
            type = "group",
            args = Warriors.UIOptions
        },
        professions = {
            order = 10,
            name = "Professions",
            type = "group",
            args = Professions.UIOptions
        }
    },
}

function BerserkAddon:OnInitialize()
    self:Print("Welcome back "..UnitName("player").."!")
    self.db = LibStub("AceDB-3.0"):New("BerserkDB", {}, true)

    -- Called when the addon is loaded
    LibStub("AceConfig-3.0"):RegisterOptionsTable("BerserkAddon", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("BerserkAddon", "Berserk Guild")
    self:RegisterChatCommand("berserk", "ChatCommand")
    self:RegisterChatCommand("bs", "ChatCommand")

    DM:Initialize(self.db)
end

function BerserkAddon:ChatCommand(input)
    words = {};
    for word in input:gmatch("%w+") do table.insert(words, word) end

    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    elseif words[1] == "help" or words[1] == "?" then
        BerserkAddon:printHelp();
    elseif words[1] == "rotation" then
        BerserkAddon:printRotation(Mages)
    elseif words[1] == "prof" or words[1] == "professions" then
        table.remove(words, 1);
        BerserkAddon:getProfessions(words)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("bs", "BerserkAddon", input)
    end
end

function BerserkAddon:OnEnable()
    -- Called when the addon is enabled
end

------------------------------
-- Utility Functions
------------------------------
function BerserkAddon:printHelp()
    self:Print("CLI Options\n",
        "mr | mage rotation\n",
        "    Displays this week's mage rotation\n",
        "prof | professions\n",
        "    Get profession masters for specific recipes\n",
        "? | help\n",
        "    Shows this help message"
    );
end

function BerserkAddon:printRotation(_class)
    -- _class variable must respond to Rotation method
    -- _class variable could be any available class in the game
    self:Print(_class:Rotation());
end

function BerserkAddon:getProfessions(args)
    prof = table.remove(args, 1);
    self:Print(Professions:getProfessors(args, prof));
end
