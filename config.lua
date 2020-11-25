------------------------------
-- variable BS is shared across the files
------------------------------
local _, BS = ...

BerserkAddon = LibStub("AceAddon-3.0"):NewAddon("BerserkAddon", "AceConsole-3.0", "AceEvent-3.0")

local defaults = {
    profile = {
        message = "Welcome Home!",
        showInChat_1 = false,
        playerName_1 = "",
        messagePlayer_1 = "",
    },
}

-- this table controls the number of messages that the addon displays
local deathMessagesList = {}

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
            args={
                desc = {
                    order = 0,
                    type = "description",
                    name = "Display a message when a party player dies",
                },
                inputPlayerName_1 = {
                    order = 0,
                    type = "input",
                    name = "Name of Player 1",
                    desc = "Target Player name",
                    usage = "<Your message>",
                    get = "GetPlayerName_1",
                    set = "SetPlayerName_1",
                },
                inputMessagePlayer_1 = {
                    order = 1,
                    type = "input",
                    name = "Message for Player 1",
                    desc = "This is the message you want to show when this player dies",
                    usage = "<Your message>",
                    get = "GetMessagePlayer_1",
                    set = "SetMessagePlayer_1",
                },
                showInChat = {
                    order = 2,
                    type = "toggle",
                    name = "Trigger listener",
                    desc = "Triggers a listener event every second checking if the player is dead or not.",
                    get = "IsShowInChat_1",
                    set = "ToggleShowInChat_1",
                },
            },
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
    },
}

function BerserkAddon:OnInitialize()
    self:Print("Welcome back "..UnitName("player").."!")
    self.db = LibStub("AceDB-3.0"):New("BerserkDB", defaults, true)

    -- Called when the addon is loaded
    LibStub("AceConfig-3.0"):RegisterOptionsTable("BerserkAddon", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("BerserkAddon", "Berserk Guild")
    self:RegisterChatCommand("berserk", "ChatCommand")
    self:RegisterChatCommand("bs", "ChatCommand")

    self:InitializeThicker()
end

function BerserkAddon:InitializeThicker()
    if self.db.profile.showInChat_1 then
        self.hanldeTicker = C_Timer.NewTicker(1, function() self:DetectDeadPlayer() end)
    end
end

function BerserkAddon:CancelThicker()
    if not self.hanldeTicker:IsCancelled() then
        self.hanldeTicker:Cancel()
    end
end

function BerserkAddon:DetectDeadPlayer()
    groupMembers = GetNumGroupMembers()
    for i=1, groupMembers do
        name = select(1, GetRaidRosterInfo(i)):lower()
        isDead = select(9, GetRaidRosterInfo(i))

        if( name == self.db.profile.playerName_1:lower() and isDead ) then

            if (not deathMessagesList[name]) then
                self:Print(name..(": dead detected"))
                SendChatMessage(self.db.profile.messagePlayer_1, "RAID")
                deathMessagesList[name] = true
            end

        elseif ( name == self.db.profile.playerName_1:lower() and not isDead ) then
            -- when player is alive again we enable the message again
            deathMessagesList[name] = false
        end
    end
end

function BerserkAddon:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    elseif input == "help" or input == "?" then
        BerserkAddon:printHelp();
    elseif input == "mr" or input == "mage rotation" then
        BerserkAddon:printRotation(Mages)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("bs", "BerserkAddon", input)
    end
end

function BerserkAddon:OnEnable()
    -- Called when the addon is enabled
end

function BerserkAddon:GetPlayerName_1(info)
    return self.db.profile.playerName_1
end

function BerserkAddon:SetPlayerName_1(info, newValue)
    self.db.profile.playerName_1 = newValue
end

function BerserkAddon:GetMessagePlayer_1(info)
    return self.db.profile.messagePlayer_1
end

function BerserkAddon:SetMessagePlayer_1(info, newValue)
    self.db.profile.messagePlayer_1 = newValue
end

function BerserkAddon:IsShowInChat_1(info)
    return self.db.profile.showInChat_1
end

function BerserkAddon:ToggleShowInChat_1(info, value)
    self.db.profile.showInChat_1 = value
    if value then
        self:InitializeThicker()
    else
        self:CancelThicker()
    end
end

------------------------------
-- Utility Functions
------------------------------
function BerserkAddon:printHelp()
    self:Print("CLI Options\n",
        "mr | mage rotation\n",
        "    Displays this week's mage rotation\n",
        "? | help\n",
        "    Shows this help message"
    );
end

function BerserkAddon:printRotation(_class)
    -- _class variable must respond to Rotation method
    -- _class variable could be any available class in the game
    self:Print(_class:Rotation());
end
