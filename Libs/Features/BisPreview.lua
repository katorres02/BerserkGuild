local _, BS = ...

function BS:Preview(BISItemsList)
    for key, itemLink in pairs(BISItemsList) do
        DressUpItemLink(itemLink)
    end
end

function BS:BISDescription(BISItemsList)
    local result = ""
    for itemEquipLoc, itemLink in pairs(BISItemsList) do
        result = result ..itemEquipLoc .."\n" ..itemLink.."\n"
    end
    return result
end
