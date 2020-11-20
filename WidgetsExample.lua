--[[
createFrame Arguments
1. the type of frame 
2. the global frame name
3. te parent frame (not a string!)
4. A comma separated list(list string) of xml templates to inherits from
]]
-- Frame declaration
local UIConfig = CreateFrame("Frame", "Berserk_GuildFrame", UIParent, "BasicFrameTemplateWithInset");
UIConfig:SetSize(300, 360);
UIConfig:SetPoint("CENTER");

-- Title frame
UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
UIConfig.title:SetPoint("CENTER", UIConfig.TitleBg, "CENTER");
UIConfig.title:SetText("Berserk Guild");

---------------------------------
-- Buttons
---------------------------------

UIConfig.saveBtn = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.saveBtn:SetPoint("CENTER", UIConfig, "TOP", 0, -70);
UIConfig.saveBtn:SetSize(140, 40);
UIConfig.saveBtn:SetText("Save");
UIConfig.saveBtn:SetNormalFontObject("GameFontNormalLarge");
UIConfig.saveBtn:SetHighlightFontObject("GameFontHighlightLarge");


UIConfig.loadBtn = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.loadBtn:SetPoint("TOP", UIConfig.saveBtn, "BOTTOM", 0, -10);
UIConfig.loadBtn:SetSize(140, 40);
UIConfig.loadBtn:SetText("Load");
UIConfig.loadBtn:SetNormalFontObject("GameFontNormalLarge");
UIConfig.loadBtn:SetHighlightFontObject("GameFontHighlightLarge");

---------------------------------
-- SLIDERS
---------------------------------

UIConfig.slider1 = CreateFrame("Slider", nil, UIConfig, "OptionsSliderTemplate");
UIConfig.slider1:SetPoint("TOP", UIConfig.loadBtn, "BOTTOM", 0, -10);
UIConfig.slider1:SetMinMaxValues(1, 100);
UIConfig.slider1:SetValue(50);
UIConfig.slider1:SetValueStep(30);
UIConfig.slider1:SetObeyStepOnDrag(true);
-- UIConfig.slider1:SetOrientation("VERTICAL");

---------------------------------
-- Check Buttons
---------------------------------

-- Check Button 1:
UIConfig.checkBtn1 = CreateFrame("CheckButton", nil, UIConfig, "UICheckButtonTemplate");
UIConfig.checkBtn1:SetPoint("TOPLEFT", UIConfig.slider1, "BOTTOMLEFT", -10, -40);
UIConfig.checkBtn1.text:SetText("My Check Button!");

-- Check Button 2:
UIConfig.checkBtn2 = CreateFrame("CheckButton", nil, UIConfig, "UICheckButtonTemplate");
UIConfig.checkBtn2:SetPoint("TOPLEFT", UIConfig.checkBtn1, "BOTTOMLEFT", 0, -10);
UIConfig.checkBtn2.text:SetText("Another Check Button!");
UIConfig.checkBtn2:SetChecked(true);