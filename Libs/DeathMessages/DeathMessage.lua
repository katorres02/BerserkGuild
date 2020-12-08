local _, BS = ...
-- this table controls the number of messages that the addon displays
local deathMessagesList = {}
local db

DM = {
    UIOptions = {
        header = {
            order = 0,
            type = "header",
            name = "Deaths Detector",
        },
        description = {
            order = 0,
            type = "description",
            name = "Display a message when a party player dies",
        },
        inputPlayerName = {
            order = 1,
            type = "input",
            name = "Name of Player",
            desc = "Target Player name",
            get = "GetPlayerName",
            set = "SetPlayerName",
        },
        inputMessage = {
            order = 2,
            type = "input",
            name = "Message for Playe",
            desc = "This is the message you want to show when this player dies",
            get = "GetMessagePlayer",
            set = "SetMessagePlayer",
        },
        showInChat = {
            order = 3,
            type = "toggle",
            name = "Trigger listener",
            desc = "Triggers a listener event every second checking if the player is dead or not.",
            get = "IsShowInChat",
            set = "ToggleShowInChat"
        },
    }
}

function DM:Initialize(db)
    self.db = db
    self:InitializeThicker()
end

function DM:SetPlayerName(info, value)
    self.db.profile.PlayerName = value
end

function DM:GetPlayerName(info)
    return self.db.profile.PlayerName
end

function DM:GetMessagePlayer(info)
    return self.db.profile.OnDeathMessage
end

function DM:SetMessagePlayer(info, value)
    self.db.profile.OnDeathMessage = value
end

function DM:IsShowInChat(info)
    return self.db.profile.showInChat
end

function DM:ToggleShowInChat(info, value)
    self.db.profile.showInChat = value
    if value then
        self:InitializeThicker()
    else
        self:CancelThicker()
    end
end

function DM:InitializeThicker()
    if self.db.profile.showInChat then
        self.hanldeTicker = C_Timer.NewTicker(1, function() self:DetectDeadPlayer() end)
    end
end

function DM:CancelThicker()
    if not self.hanldeTicker:IsCancelled() then
        self.hanldeTicker:Cancel()
    end
end

function DM:DetectDeadPlayer()
    groupMembers = GetNumGroupMembers()
    for i=1, groupMembers do
        name = select(1, GetRaidRosterInfo(i)):lower()
        isDead = select(9, GetRaidRosterInfo(i))
        print(name.. " "..isDead)
        if( name == self.db.profile.PlayerName:lower() and isDead ) then

            if (not deathMessagesList[name]) then
                self:Print(name..(": dead detected"))
                SendChatMessage(self.db.profile.OnDeathMessage, "RAID")
                deathMessagesList[name] = true
            end

        elseif ( name == self.db.profile.PlayerName:lower() and not isDead ) then
            -- when player is alive again we enable the message again
            deathMessagesList[name] = false
        end
    end
end
