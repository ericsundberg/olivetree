local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec2 = mjm.vec2

local constructable = mjrequire "common/constructable"
local gameObject = mjrequire "common/gameObject"
--local skill = mjrequire "common/skill"
local model = mjrequire "common/model"
--local material = mjrequire "common/material"
local locale = mjrequire "common/locale"

local uiCommon = mjrequire "mainThread/ui/uiCommon/uiCommon"
local keyMapping = mjrequire "mainThread/keyMapping"
local uiStandardButton = mjrequire "mainThread/ui/uiCommon/uiStandardButton"
local buildModeInteractUI = mjrequire "mainThread/ui/buildModeInteractUI"
local constructableUIHelper = mjrequire "mainThread/ui/constructableUIHelper"
--local uiToolTip = mjrequire "mainThread/ui/uiCommon/uiToolTip"
local uiScrollView = mjrequire "mainThread/ui/uiCommon/uiScrollView"
local uiGameObjectView = mjrequire "mainThread/ui/uiCommon/uiGameObjectView"
local uiObjectGrid = mjrequire "mainThread/ui/uiCommon/uiObjectGrid"
local eventManager = mjrequire "mainThread/eventManager"
local uiSelectionLayout = mjrequire "mainThread/ui/uiCommon/uiSelectionLayout"

local prevSelectionGridIndex = nil

local plantUI = {}

local itemList = {
    constructable.types.plant_raspberryBush.index,
    constructable.types.plant_gooseberryBush.index,
    constructable.types.plant_beetrootPlant.index,
    constructable.types.plant_sunflower.index,
    constructable.types.plant_wheatPlant.index,
    constructable.types.plant_flaxPlant.index,
    constructable.types.plant_pumpkinPlant.index,

    constructable.types.plant_appleTree.index,
    constructable.types.plant_orangeTree.index,
    constructable.types.plant_peachTree.index,
    constructable.types.plant_bananaTree.index,
    constructable.types.plant_coconutTree.index,
    constructable.types.plant_oliveTree.index,
    
    constructable.types.plant_pine1.index,
    constructable.types.plant_pineBig1.index,

    constructable.types.plant_birch1.index,

    constructable.types.plant_aspen1.index,
    constructable.types.plant_aspenBig1.index,

    constructable.types.plant_willow1.index,
    constructable.types.plant_bamboo1.index,
}

local manageUI = nil
local world = nil

local objectGridView = nil
local variationGridView = nil

local leftPaneView = nil

local rightPaneView = nil
local selectedTitleTextView = nil
local selectedSummaryTextView = nil

local noSelectionPaneView = nil
local variationsTitleTextView = nil


local requiredResourcesView = nil
local requiredResourcesScrollView = nil
local useOnlyScrollView = nil
local requiredResourcesScrollViewHasFocus = false

local confirmButton = nil
local confirmFunction = nil
local selectedObjectImageView = nil


local keyMap = {
    [keyMapping:getMappingIndex("game", "confirm")] = function(isDown, isRepeat) 
        if isDown and not isRepeat then 
            if confirmFunction then
                confirmFunction()
            end
        end 
        return true 
    end,
}

local function keyChanged(isDown, code, modKey, isRepeat)
    if keyMap[code]  then
		return keyMap[code](isDown, isRepeat)
	end
end

local randomSlideshowIndex = 1
local randomSlideshowCounter = 0.0
local randomSlideshowDelay = 1.5

local function updateSelection()
    local baseConstructableTypeIndex = nil
    local constructableTypeIndex = nil
    local selectedInfo = uiObjectGrid:getSelectedInfo(objectGridView)
    local variationInfo = nil
    if selectedInfo and selectedInfo.gridButtonData then
        if selectedInfo.gridButtonData then
            constructableTypeIndex = selectedInfo.gridButtonData.constructableTypeIndex
            baseConstructableTypeIndex = constructableTypeIndex
            

            variationInfo = uiObjectGrid:getSelectedInfo(variationGridView)
            if variationInfo and variationInfo.gridButtonData and variationInfo.gridButtonData.constructableTypeIndex then
                constructableTypeIndex = variationInfo.gridButtonData.constructableTypeIndex

                if baseConstructableTypeIndex then
                    
                    local settingKey = string.format("variation_%d", baseConstructableTypeIndex)
                    local selectedIndex = uiObjectGrid:getSelectedButtonGridIndex(variationGridView)
                    --mj:log("set settingKey:", settingKey, " selectedIndex:", selectedIndex)
                    world:setClientWorldSetting(settingKey, selectedIndex)
                end
            end
        end
    end

    --mj:log("variationInfo:", variationInfo)

    if not baseConstructableTypeIndex or not constructableTypeIndex then
        return
    end

    local constructableType = constructable.types[constructableTypeIndex]
    uiStandardButton:setTextWithShortcut(confirmButton, locale:get("ui_action_plant"), "game", "confirm", eventManager.controllerSetIndexMenu, "menuSpecial")

    local isRandom = false
    selectedTitleTextView.text = constructableType.name
    if variationInfo and variationInfo.gridButtonData then
        if variationInfo.gridButtonData.randomVariation then
            isRandom = true
            selectedSummaryTextView.text = locale:get("misc_randomVariation") .. "\n" .. variationInfo.gridButtonData.summary
        else
            if variationInfo.gridButtonData.hasVariations then
                selectedSummaryTextView.text = variationInfo.gridButtonData.name .. "\n" .. variationInfo.gridButtonData.summary
            else
                selectedSummaryTextView.text = variationInfo.gridButtonData.summary
            end
        end
    else
        selectedSummaryTextView.text = ""
    end


    local function assignRandomSlideshow()
        local variations = constructable.variations[baseConstructableTypeIndex]
        if randomSlideshowIndex > #variations then
            randomSlideshowIndex = 1
        end
        local variationConstructableTypeIndex = variations[randomSlideshowIndex]
        local restrictedObjectTypes = world:getConstructableRestrictedObjectTypes(variationConstructableTypeIndex, false)
        local variationGameObjectTypeIndex = constructable:getDisplayGameObjectType(variationConstructableTypeIndex, nil, nil)--constructable.types[variationConstructableTypeIndex].inProgressGameObjectTypeKey
        --local variationGameObjectTypeIndex = gameObject.types[variationGameObjectTypeKey].index
        uiGameObjectView:setObject(selectedObjectImageView, {objectTypeIndex = variationGameObjectTypeIndex}, restrictedObjectTypes, world:getSeenResourceObjectTypes())
    end
    
    if isRandom then
        selectedObjectImageView.update = function(dt)
            randomSlideshowCounter = randomSlideshowCounter + dt
            if randomSlideshowCounter > randomSlideshowDelay then
                randomSlideshowCounter = 0.0
                randomSlideshowIndex = randomSlideshowIndex + 1
                
                assignRandomSlideshow()
            end
        end
    else
        selectedObjectImageView.update = nil
    end

    
    confirmFunction = function()
        buildModeInteractUI:show(constructableTypeIndex, isRandom, false)
        manageUI:hide()
    end
    uiStandardButton:setClickFunction(confirmButton, confirmFunction)

    uiStandardButton:setDisabled(confirmButton, false)

    local function updateGameObjectView()
        if isRandom then
            --mj:error("isRandom:", baseConstructableTypeIndex)
            assignRandomSlideshow()
        else
            local gameObjectTypeIndex = constructable:getDisplayGameObjectType(constructableTypeIndex, nil, nil)--constructableType.iconGameObjectType or constructableType.inProgressGameObjectTypeKey
            --local gameObjectTypeIndex = gameObject.types[gameObjectTypeKey].index
            local restrictedObjectTypes = world:getConstructableRestrictedObjectTypes(constructableTypeIndex, false)
            uiGameObjectView:setObject(selectedObjectImageView, {objectTypeIndex = gameObjectTypeIndex}, restrictedObjectTypes, world:getSeenResourceObjectTypes())
        end
    end

    local function allObjectsForAnyResourceUncheckedChanged(hasAllObjectsForAnyResourceUnchecked)
        uiStandardButton:setDisabled(confirmButton, hasAllObjectsForAnyResourceUnchecked)
    end
    
    local restrictedObjectsChangedFunction = function()
        updateGameObjectView()
    end

    constructableUIHelper:updateRequiredResources(requiredResourcesScrollView, useOnlyScrollView, constructableType, allObjectsForAnyResourceUncheckedChanged, restrictedObjectsChangedFunction)
    updateGameObjectView()
end

local function updateVariationGrid(baseConstructableTypeIndex)
    if not baseConstructableTypeIndex then
        return
    end

    --mj:log("updateVariationGrid:", baseConstructableTypeIndex)

    local variationGridData = {}
    local variationItemList = {baseConstructableTypeIndex}
    local variations = constructable.variations[baseConstructableTypeIndex]
    if variations then
        variationItemList = variations
    end

    if #variationItemList > 1 then
        table.insert(variationGridData, {
            constructableTypeIndex = baseConstructableTypeIndex,
            randomVariation = true,
            hasVariations = true,

            iconName = "icon_random",
            name = locale:get("misc_random"),
            summary = constructable.types[baseConstructableTypeIndex].summary,
            disabledToolTipText = constructableUIHelper:getDisabledToolTipText(true, true, true),
            enabled = true,
        })
    end

    for i, constructableTypeIndex in ipairs(variationItemList) do

        local constructableType = constructable.types[constructableTypeIndex]

        local gameObjectTypeIndex = constructable:getDisplayGameObjectType(constructableTypeIndex, nil, nil)--constructableType.inProgressGameObjectTypeKey
        local gameObjectType = gameObject.types[gameObjectTypeIndex]

        local nameToUse = constructableType.name
        local hasVariations = false
        if #variationItemList > 1 then
            nameToUse = constructableType.name .. string.format(" %d", i)
            hasVariations = true
        end

        table.insert(variationGridData, {
            constructableTypeIndex = constructableTypeIndex,
            hasVariations = hasVariations,
            gameObjectTypeIndex = gameObjectType.index,
            name = nameToUse,
            summary = constructableType.summary,
            disabledToolTipText = constructableUIHelper:getDisabledToolTipText(true, true, true),
            enabled = true,
        })
    end

    local settingKey = string.format("variation_%d", baseConstructableTypeIndex)
    local selectionIndex = world:getClientWorldSetting(settingKey) or 1
    --mj:log("get Key:", settingKey, " selectionIndex:", selectionIndex)
    --uiObjectGrid:selectButtonAtIndex(variationGridView, selectionIndex)

    uiObjectGrid:updateButtons(variationGridView, variationGridData, selectionIndex)

    --local debugValue = uiObjectGrid:getSelectedButtonIndex(variationGridView)
    --mj:log("debugValue:", debugValue)
end


local function selectVariationGridButton(buttonInfo)
    updateSelection()
end

local function selectMainGridButton(buttonInfo)

    if buttonInfo.gridButtonData and (uiObjectGrid:getSelectedInfo(objectGridView) ~= nil) then
        local constructableTypeIndex = buttonInfo.gridButtonData.constructableTypeIndex
        
        updateVariationGrid(constructableTypeIndex)
        updateSelection()
        prevSelectionGridIndex = uiObjectGrid:getSelectedButtonGridIndex(objectGridView)
    end
end


function plantUI:show()
    uiObjectGrid:assignLayoutSelection(objectGridView)
    
    local selectedInfo = uiObjectGrid:getSelectedInfo(objectGridView)
    if selectedInfo then
        rightPaneView.hidden = false
        variationsTitleTextView.hidden = false
        noSelectionPaneView.hidden = true
        selectMainGridButton(selectedInfo)
    else
        rightPaneView.hidden = true
        variationsTitleTextView.hidden = true
        noSelectionPaneView.hidden = false
    end
end

function plantUI:hide()
    uiObjectGrid:removeLayoutSelection(objectGridView)
end

function plantUI:popUI()
    if requiredResourcesScrollViewHasFocus then
        if not constructableUIHelper:popControllerFocus(requiredResourcesScrollView, useOnlyScrollView) then
            requiredResourcesScrollViewHasFocus = false
            uiSelectionLayout:removeActiveSelectionLayoutView(requiredResourcesScrollView)
            uiObjectGrid:assignLayoutSelection(objectGridView)
        end
        return true
    end
    return false
end

function plantUI:update()
    local gridData = {}

    for i, constructableTypeIndex in ipairs(itemList) do

        local constructableType = constructable.types[constructableTypeIndex]

        local gameObjectTypeIndex = constructable:getDisplayGameObjectType(constructableTypeIndex, nil, nil)--constructableType.inProgressGameObjectTypeKey
        local gameObjectType = gameObject.types[gameObjectTypeIndex]

        local hasSeenRequiredResources = constructableUIHelper:checkHasSeenRequiredResources(constructableType, nil)
        local hasSeenRequiredTools = constructableUIHelper:checkHasSeenRequiredTools(constructableType, nil)

        local discoveryComplete = true
        if constructableType.skills then
            local requiredSkillTypeIndex = constructableType.skills.required
            if requiredSkillTypeIndex then
                discoveryComplete = world:tribeHasMadeDiscovery(requiredSkillTypeIndex)
            end
        end

        if discoveryComplete then
            if constructableType.disabledUntilAdditionalSkillTypeDiscovered then
                discoveryComplete = world:tribeHasMadeDiscovery(constructableType.disabledUntilAdditionalSkillTypeDiscovered)
            end
        end

        local newUnlocked = discoveryComplete and hasSeenRequiredResources and hasSeenRequiredTools

        gridData[i] = {
            constructableTypeIndex = constructableTypeIndex,

            gameObjectTypeIndex = gameObjectType.index,
            name = constructableType.name,
            summary = constructableType.summary,
            disabledToolTipText = constructableUIHelper:getDisabledToolTipText(discoveryComplete, hasSeenRequiredResources, hasSeenRequiredTools),
            enabled = newUnlocked,
        }
    end

    uiObjectGrid:updateButtons(objectGridView, gridData, prevSelectionGridIndex)
end

function plantUI:init(gameUI, world_, manageUI_, contentView)

    manageUI = manageUI_
    world = world_

    local paneViewSize = vec2(contentView.size.x * 0.5 - 20, contentView.size.y)

    leftPaneView = View.new(contentView)
    leftPaneView.relativePosition = ViewPosition(MJPositionInnerLeft, MJPositionBottom)
    leftPaneView.baseOffset = vec3(20,0, 0)
    leftPaneView.size = paneViewSize
    
    leftPaneView.keyChanged = keyChanged --hmmm leftPaneView?
    
    rightPaneView = View.new(contentView)
    rightPaneView.relativePosition = ViewPosition(MJPositionInnerRight, MJPositionBottom)
    rightPaneView.baseOffset = vec3(-24,0, 0)
    rightPaneView.size = paneViewSize
    
    noSelectionPaneView = View.new(contentView)
    noSelectionPaneView.relativePosition = ViewPosition(MJPositionInnerRight, MJPositionBottom)
    noSelectionPaneView.baseOffset = vec3(-24,0, 0)
    noSelectionPaneView.size = paneViewSize

    selectedObjectImageView = uiGameObjectView:create(rightPaneView, vec2(200,200), uiGameObjectView.types.standard)
    selectedObjectImageView.relativePosition = ViewPosition(MJPositionCenter, MJPositionTop)

    --selectedObjectImageView.baseOffset = vec3(0,-4, 0)

    selectedTitleTextView = TextView.new(rightPaneView)
    selectedTitleTextView.font = Font(uiCommon.fontName, 24)
    selectedTitleTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionBelow)
    selectedTitleTextView.relativeView = selectedObjectImageView
   -- selectedTitleTextView.baseOffset = vec3(0,0, 0)
    selectedTitleTextView.color = mj.textColor

    selectedSummaryTextView = TextView.new(rightPaneView)
    selectedSummaryTextView.font = Font(uiCommon.fontName, 16)
    selectedSummaryTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionBelow)
    selectedSummaryTextView.relativeView = selectedTitleTextView
    selectedSummaryTextView.textAlignment = MJHorizontalAlignmentCenter
    selectedSummaryTextView.baseOffset = vec3(0,-5, 0)
    selectedSummaryTextView.wrapWidth = rightPaneView.size.x - 40
    selectedSummaryTextView.color = mj.textColor

    requiredResourcesView = View.new(rightPaneView)
    --requiredResourcesView.color = vec4(0.1,0.1,0.1,0.1)
    requiredResourcesView.relativePosition = ViewPosition(MJPositionCenter, MJPositionBottom)
    requiredResourcesView.baseOffset = vec3(0,80, 0)
    requiredResourcesView.size = vec2(paneViewSize.x, 200.0)

    local requiredResourcesTextView = TextView.new(requiredResourcesView)
    requiredResourcesTextView.font = Font(uiCommon.fontName, 16)
    requiredResourcesTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionTop)
    requiredResourcesTextView.baseOffset = vec3(-requiredResourcesView.size.x * 0.25 - 5,-10, 0)
    requiredResourcesTextView.text = locale:get("construct_ui_requires") .. ":"
    requiredResourcesTextView.color = mj.textColor

    local useOnlyTextView = TextView.new(requiredResourcesView)
    useOnlyTextView.font = Font(uiCommon.fontName, 16)
    useOnlyTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionTop)
    useOnlyTextView.baseOffset = vec3(requiredResourcesView.size.x * 0.25 + 5,-10, 0)
    useOnlyTextView.text = locale:get("construct_ui_acceptOnly") .. ":"
    useOnlyTextView.color = mj.textColor

    
    local requiredResourcesInsetViewSize = vec2(requiredResourcesView.size.x * 0.5 - 10, requiredResourcesView.size.y - requiredResourcesTextView.size.y - 20)
    local requiredResourcesScrollViewSize = vec2(requiredResourcesInsetViewSize.x - 10, requiredResourcesInsetViewSize.y - 10)
    local requiredResourcesInsetView = ModelView.new(requiredResourcesView)
    requiredResourcesInsetView:setModel(model:modelIndexForName("ui_inset_lg_2x3"))
    local restrictScaleToUsePaneX = requiredResourcesInsetViewSize.x * 0.5 / (2.0/3.0)
    local restrictScaleToUsePaneY = requiredResourcesInsetViewSize.y * 0.5
    requiredResourcesInsetView.scale3D = vec3(restrictScaleToUsePaneX,restrictScaleToUsePaneY,restrictScaleToUsePaneX)
    requiredResourcesInsetView.size = requiredResourcesInsetViewSize
    requiredResourcesInsetView.relativePosition = ViewPosition(MJPositionInnerLeft, MJPositionBottom)
    requiredResourcesInsetView.baseOffset = vec3(0, 0, 0)

    requiredResourcesScrollView = uiScrollView:create(requiredResourcesInsetView, requiredResourcesScrollViewSize, MJPositionInnerLeft)
    requiredResourcesScrollView.baseOffset = vec3(0, 0, 2)
    
    uiSelectionLayout:createForView(requiredResourcesScrollView)

    
    local useOnlyInsetView = ModelView.new(requiredResourcesView)
    useOnlyInsetView:setModel(model:modelIndexForName("ui_inset_lg_2x3"))
    useOnlyInsetView.scale3D = vec3(restrictScaleToUsePaneX,restrictScaleToUsePaneY,restrictScaleToUsePaneX)
    useOnlyInsetView.size = requiredResourcesInsetViewSize
    useOnlyInsetView.relativePosition = ViewPosition(MJPositionInnerRight, MJPositionBottom)
    useOnlyInsetView.baseOffset = vec3(0, 0, 0)

    useOnlyScrollView = uiScrollView:create(useOnlyInsetView, requiredResourcesScrollViewSize, MJPositionInnerLeft)
    useOnlyScrollView.baseOffset = vec3(0, 0, 2)

    uiSelectionLayout:createForView(useOnlyScrollView)


    confirmButton = uiStandardButton:create(rightPaneView, vec2(142,30))
    confirmButton.relativePosition = ViewPosition(MJPositionCenter, MJPositionBottom)
    confirmButton.baseOffset = vec3(0,30, 0)
    
    local gridBackgroundViewSize = vec2(leftPaneView.size.x - 40, leftPaneView.size.y - 60 - 250)
    objectGridView = uiObjectGrid:create(leftPaneView, gridBackgroundViewSize, function(selectedButtonInfo)
        selectMainGridButton(selectedButtonInfo)
    end)
    objectGridView.relativePosition = ViewPosition(MJPositionInnerLeft, MJPositionTop)
    objectGridView.baseOffset = vec3(10,-30,0)

    

    local variationsContainerView = View.new(leftPaneView)
    --requiredResourcesView.color = vec4(0.1,0.1,0.1,0.1)
    variationsContainerView.relativePosition = ViewPosition(MJPositionInnerLeft, MJPositionBottom)
    variationsContainerView.baseOffset = vec3(0,80, 0)
    variationsContainerView.size = vec2(paneViewSize.x, 200.0)

    variationsTitleTextView = TextView.new(variationsContainerView)
    variationsTitleTextView.font = Font(uiCommon.fontName, 16)
    variationsTitleTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionTop)
    variationsTitleTextView.baseOffset = vec3(0,-10, 0)
    variationsTitleTextView.text = locale:get("misc_variations") .. ":"
    variationsTitleTextView.color = mj.textColor

    variationGridView = uiObjectGrid:create(variationsContainerView, vec2(gridBackgroundViewSize.x, requiredResourcesInsetViewSize.y), function(selectedButtonInfo)
        selectVariationGridButton(selectedButtonInfo)
    end)
    variationGridView.relativePosition = ViewPosition(MJPositionInnerLeft, MJPositionBottom)
    variationGridView.baseOffset = vec3(10,0,0)

    
    eventManager:addControllerCallback(eventManager.controllerSetIndexMenu, true, "menuSpecial", function(isDown)
        if isDown and not manageUI:uiIsHidden(plantUI) then
            if confirmFunction then
                confirmFunction()
            end
        end
    end)

   --[[ eventManager:addControllerCallback(eventManager.controllerSetIndexMenu, true, "menuSelect", function(isDown)
        if isDown and not manageUI:uiIsHidden(buildUI) then
            if confirmFunction then
                confirmFunction()
            end
        end
    end)]]
    
    eventManager:addControllerCallback(eventManager.controllerSetIndexMenu, true, "menuOther", function(isDown)
        if isDown and not manageUI:uiIsHidden(plantUI) then
            requiredResourcesScrollViewHasFocus = true
            uiSelectionLayout:setActiveSelectionLayoutView(requiredResourcesScrollView)
        end
    end)

    local noSelectionTitleTextView = TextView.new(noSelectionPaneView)
    noSelectionTitleTextView.font = Font(uiCommon.fontName, 24)
    noSelectionTitleTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionCenter)
    noSelectionTitleTextView.color = mj.textColor
    noSelectionTitleTextView.baseOffset = vec3(0,80,0)

    local noSelectionSummaryTextView = TextView.new(noSelectionPaneView)
    noSelectionSummaryTextView.font = Font(uiCommon.fontName, 16)
    noSelectionSummaryTextView.relativePosition = ViewPosition(MJPositionCenter, MJPositionBelow)
    noSelectionSummaryTextView.relativeView = noSelectionTitleTextView
    noSelectionSummaryTextView.wrapWidth = noSelectionPaneView.size.x - 40
    noSelectionSummaryTextView.color = mj.textColor

    noSelectionTitleTextView.text = locale:get("construct_ui_discoveryRequired")
    noSelectionSummaryTextView.text = locale:get("construct_ui_discoveryRequired_plantsInfo")

end


return plantUI