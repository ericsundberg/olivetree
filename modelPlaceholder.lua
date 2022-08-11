
local model = mjrequire "common/model"
local resource = mjrequire "common/resource"
local gameObject = mjrequire "common/gameObject"
local flora = mjrequire "common/flora"
--local worldHelper = mjrequire "common/worldHelper"

local modelPlaceholder = {}

local placeholderInfosByModelIndex = {}
local placeholderKeysByModelIndex = {}


local function getRemaps(key)
    return {
        model:modelIndexForModelNameAndDetailLevel(key, 1),
        model:modelIndexForModelNameAndDetailLevel(key, 2),
        model:modelIndexForModelNameAndDetailLevel(key, 3),
        model:modelIndexForModelNameAndDetailLevel(key, 4)
    }
end

local burntFuelRemaps = {
    [gameObject.types.pineCone.index] = getRemaps("pineConeBurnt"),
    [gameObject.types.pineConeBig.index] = getRemaps("pineConeBurnt"),
    [gameObject.types.hay.index] = getRemaps("burntHay"),
}

local longBranchRemaps = {}
local halfBranchRemaps = {}
local shortPoleBranchRemaps = {}
local standardLengthPoleBranchRemaps = {}

for i,baseKey in ipairs(flora.branchTypeBaseKeys) do
    local baseGameObjectTypeIndex = gameObject.types[baseKey .. "Branch"].index

    longBranchRemaps[baseGameObjectTypeIndex] = getRemaps(baseKey .. "BranchLong")
    halfBranchRemaps[baseGameObjectTypeIndex] = getRemaps(baseKey .. "BranchHalf")
    standardLengthPoleBranchRemaps[baseGameObjectTypeIndex] = getRemaps("woodenPole_" .. baseKey)
    shortPoleBranchRemaps[baseGameObjectTypeIndex] = getRemaps("woodenPoleShort_" .. baseKey)
    
    burntFuelRemaps[baseGameObjectTypeIndex] = getRemaps("birchBranchBurnt")
end

local longSplitLogRemaps = {}
local longSplitLogAngleCutRemaps = {}
local splitLog3Remaps = {}
local splitLog075Remaps = {}
local splitLog075AngleCutRemaps = {}
local splitLog2x1GradRemaps = {}
local splitLog2x1GradAngleCutRemaps = {}
local splitLog2x2GradRemaps = {}
local splitLog2x2GradAngleCutRemaps = {}
local splitLog05Remaps = {}
local splitLog05AngleCutRemaps = {}
local shortLogRemaps = {}
local log4Remaps = {}
local log3Remaps = {}
local halfLogRemaps = {}

local splitLogFloor4x4FullLowRemaps = {}
local splitLogFloor2x2FullLowRemaps = {}

for i,baseKey in ipairs(flora.logTypeBaseKeys) do
    local baseSplitLogGameObjectTypeIndex = gameObject.types[baseKey .. "SplitLog"].index
    local baseLogGameObjectTypeIndex = gameObject.types[baseKey .. "Log"].index

    longSplitLogRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLogLong")
    longSplitLogAngleCutRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLogLongAngleCut")
    splitLog3Remaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog3")
    splitLog075Remaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog075")
    splitLog075AngleCutRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog075AngleCut")
    splitLog2x1GradRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog2x1Grad")
    splitLog2x1GradAngleCutRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog2x1GradAngleCut")
    splitLog2x2GradRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog2x2Grad")
    splitLog2x2GradAngleCutRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog2x2GradAngleCut")
    splitLog05Remaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog05")
    splitLog05AngleCutRemaps[baseSplitLogGameObjectTypeIndex] = getRemaps(baseKey .. "SplitLog05AngleCut")
    splitLogFloor4x4FullLowRemaps[baseSplitLogGameObjectTypeIndex] = model:modelIndexForName("splitLogFloor4x4FullLow_" .. baseKey)
    splitLogFloor2x2FullLowRemaps[baseSplitLogGameObjectTypeIndex] = model:modelIndexForName("splitLogFloor2x2FullLow_" .. baseKey)

    shortLogRemaps[baseLogGameObjectTypeIndex] = getRemaps(baseKey .. "LogShort")
    log4Remaps[baseLogGameObjectTypeIndex] = getRemaps(baseKey .. "Log4")
    log3Remaps[baseLogGameObjectTypeIndex] = getRemaps(baseKey .. "Log3")
    halfLogRemaps[baseLogGameObjectTypeIndex] = getRemaps(baseKey .. "LogHalf")
    
    burntFuelRemaps[baseLogGameObjectTypeIndex] = getRemaps("birchBranchBurnt")
end

local hayTorchOverrides = getRemaps("hayTorch")


local rockPathRemaps_1 = {
    [gameObject.types.rock.index] = getRemaps("pathNode_rock_1"),
    [gameObject.types.limestoneRock.index] = getRemaps("pathNode_limestoneRock_1"),
    [gameObject.types.redRock.index] = getRemaps("pathNode_redRock_1"),
    [gameObject.types.greenRock.index] = getRemaps("pathNode_greenRock_1"),
}
local rockPathRemaps_2 = {
    [gameObject.types.rock.index] = getRemaps("pathNode_rock_2"),
    [gameObject.types.limestoneRock.index] = getRemaps("pathNode_limestoneRock_2"),
    [gameObject.types.redRock.index] = getRemaps("pathNode_redRock_2"),
    [gameObject.types.greenRock.index] = getRemaps("pathNode_greenRock_2"),
}

local tilePathRemaps_1 = {
    [gameObject.types.firedTile.index] = getRemaps("pathNode_tile_1"),
}
local tilePathRemaps_2 = {
    [gameObject.types.firedTile.index] = getRemaps("pathNode_tile_2"),
}

local dirtPathRemaps_1 = {
    [gameObject.types.dirt.index] = getRemaps("pathNode_dirt_1"),
    [gameObject.types.richDirt.index] = getRemaps("pathNode_richDirt_1"),
    [gameObject.types.poorDirt.index] = getRemaps("pathNode_poorDirt_1"),
}

local sandPathRemaps_1 = {
    [gameObject.types.sand.index] = model:modelIndexForName("pathNode_sand_1"),
    [gameObject.types.riverSand.index] = model:modelIndexForName("pathNode_riverSand_1"),
    [gameObject.types.redSand.index] = model:modelIndexForName("pathNode_redSand_1"),
}

local clayPathRemaps_1 = {
    [gameObject.types.clay.index] = model:modelIndexForName("pathNode_clay_1"),
}

local woolskinBedRemaps_1 = {
    [gameObject.types.mammothWoolskin.index] = getRemaps("woolskinBed_woolskinMammoth_1"),
}
local woolskinBedRemaps_2 = {
    [gameObject.types.mammothWoolskin.index] = getRemaps("woolskinBed_woolskinMammoth_2"),
}
local woolskinBedRemaps_3 = {
    [gameObject.types.mammothWoolskin.index] = getRemaps("woolskinBed_woolskinMammoth_3"),
}

local craftAreaRockRemaps = {
    [gameObject.types.rock.index] = model:modelIndexForName("craftArea_rock1"),
    [gameObject.types.limestoneRock.index] = model:modelIndexForName("craftArea_limestoneRock1"),
    [gameObject.types.redRock.index] = model:modelIndexForName("craftArea_redRock1"),
    [gameObject.types.greenRock.index] = model:modelIndexForName("craftArea_greenRock1"),
}


local mudBrickKilnSectionRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = getRemaps("mudBrickKilnSection_sand"),
    [gameObject.types.mudBrickDry_hay.index] = getRemaps("mudBrickKilnSection_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = getRemaps("mudBrickKilnSection_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = getRemaps("mudBrickKilnSection_redSand"),
}

local mudBrickKilnSectionWithOpeningRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = getRemaps("mudBrickKilnSectionWithOpening_sand"),
    [gameObject.types.mudBrickDry_hay.index] = getRemaps("mudBrickKilnSectionWithOpening_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = getRemaps("mudBrickKilnSectionWithOpening_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = getRemaps("mudBrickKilnSectionWithOpening_redSand"),
}

local mudBrickKilnSectionTopRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = getRemaps("mudBrickKilnSectionTop_sand"),
    [gameObject.types.mudBrickDry_hay.index] = getRemaps("mudBrickKilnSectionTop_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = getRemaps("mudBrickKilnSectionTop_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = getRemaps("mudBrickKilnSectionTop_redSand"),
}

local mudBrickWallSectionRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSection_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSection_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSection_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSection_redSand"),
}

local mudBrickWallSectionFullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSectionFullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSectionFullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSectionFullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSectionFullLow_redSand"),
}

local mudBrickWallSection4x1FullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSection4x1FullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSection4x1FullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSection4x1FullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSection4x1FullLow_redSand"),
}

local mudBrickWallSection2x2FullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSection2x2FullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSection2x2FullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSection2x2FullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSection2x2FullLow_redSand"),
}

local mudBrickWallSectionWindowFullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSectionWindowFullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSectionWindowFullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSectionWindowFullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSectionWindowFullLow_redSand"),
}
local mudBrickWallSectionDoorFullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSectionDoorFullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSectionDoorFullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSectionDoorFullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSectionDoorFullLow_redSand"),
}

local mudBrickWallColumnRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallColumn_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallColumn_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallColumn_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallColumn_redSand"),
}

local mudBrickWallSection075Remaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSection_075_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSection_075_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSection_075_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSection_075_redSand"),
}

local mudBrickWallSectionSingleHighRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSectionSingleHigh_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSectionSingleHigh_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSectionSingleHigh_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSectionSingleHigh_redSand"),
}

local mudBrickWallDoorTopRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickWallSectionDoorTop_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickWallSectionDoorTop_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickWallSectionDoorTop_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickWallSectionDoorTop_redSand"),
}

local mudBrickColumnTopRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickColumnTop_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickColumnTop_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickColumnTop_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickColumnTop_redSand"),
}
local mudBrickColumnBottomRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickColumnBottom_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickColumnBottom_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickColumnBottom_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickColumnBottom_redSand"),
}
local mudBrickColumnFullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickColumnFullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickColumnFullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickColumnFullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickColumnFullLow_redSand"),
}

local mudBrickFloorSection2x1Remaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickFloorSection2x1_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickFloorSection2x1_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickFloorSection2x1_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickFloorSection2x1_redSand"),
}

local mudBrickFloorSection4x4FullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickFloorSection4x4FullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickFloorSection4x4FullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickFloorSection4x4FullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickFloorSection4x4FullLow_redSand"),
}

local mudBrickFloorSection2x2FullLowRemaps = {
    [gameObject.types.mudBrickDry_sand.index] = model:modelIndexForName("mudBrickFloorSection2x2FullLow_sand"),
    [gameObject.types.mudBrickDry_hay.index] = model:modelIndexForName("mudBrickFloorSection2x2FullLow_hay"),
    [gameObject.types.mudBrickDry_riverSand.index] = model:modelIndexForName("mudBrickFloorSection2x2FullLow_riverSand"),
    [gameObject.types.mudBrickDry_redSand.index] = model:modelIndexForName("mudBrickFloorSection2x2FullLow_redSand"),
}




local brickWallSectionRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSection_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSection_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSection_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSection_redSand"),
}

local brickWallSection075Remaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSection_075_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSection_075_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSection_075_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSection_075_redSand"),
}

local brickWallDoorTopRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSectionDoorTop_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSectionDoorTop_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSectionDoorTop_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSectionDoorTop_redSand"),
}


local brickWallColumnRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallColumn_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallColumn_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallColumn_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallColumn_redSand"),
}

local brickWallSectionSingleHighRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSectionSingleHigh_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSectionSingleHigh_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSectionSingleHigh_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSectionSingleHigh_redSand"),
}



local brickWallSectionFullLowRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSectionFullLow_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSectionFullLow_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSectionFullLow_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSectionFullLow_redSand"),
}

local brickWallSection4x1FullLowRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSection4x1FullLow_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSection4x1FullLow_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSection4x1FullLow_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSection4x1FullLow_redSand"),
}

local brickWallSection2x2FullLowRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSection2x2FullLow_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSection2x2FullLow_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSection2x2FullLow_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSection2x2FullLow_redSand"),
}

local brickWallSectionWindowFullLowRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSectionWindowFullLow_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSectionWindowFullLow_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSectionWindowFullLow_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSectionWindowFullLow_redSand"),
}
local brickWallSectionDoorFullLowRemaps = {
    [gameObject.types.firedBrick_sand.index] = model:modelIndexForName("brickWallSectionDoorFullLow_sand"),
    [gameObject.types.firedBrick_hay.index] = model:modelIndexForName("brickWallSectionDoorFullLow_hay"),
    [gameObject.types.firedBrick_riverSand.index] = model:modelIndexForName("brickWallSectionDoorFullLow_riverSand"),
    [gameObject.types.firedBrick_redSand.index] = model:modelIndexForName("brickWallSectionDoorFullLow_redSand"),
}


local tileFloorSection2x1Remaps = {
    [gameObject.types.firedTile.index] = model:modelIndexForName("tileFloorSection2x1_firedTile"),
}

local tileFloorSection4x4FullLowRemaps = {
    [gameObject.types.firedTile.index] = model:modelIndexForName("tileFloorSection4x4FullLow_firedTile"),
}

local tileFloorSection2x2FullLowRemaps = {
    [gameObject.types.firedTile.index] = model:modelIndexForName("tileFloorSection2x2FullLow_firedTile"),
}

local function addModel(modelName, remapTables)
    local modelIndex = model:modelIndexForName(modelName)

    local placeholderInfos = {}
    placeholderInfosByModelIndex[modelIndex] = placeholderInfos

    local placeholderKeys = {}
    placeholderKeysByModelIndex[modelIndex] = placeholderKeys

    for ri,remapTable in ipairs(remapTables) do
        local subModelIndex = model:modelIndexForName(remapTable.defaultModelName)
        local modelIndexesByDetailLevel = {
            subModelIndex,
            model:modelIndexForModelNameAndDetailLevel(remapTable.defaultModelName, 2),
            model:modelIndexForModelNameAndDetailLevel(remapTable.defaultModelName, 3),
            model:modelIndexForModelNameAndDetailLevel(remapTable.defaultModelName, 4),
        }
        if remapTable.multiCount then
            local additionalIndexCount = 1 + (remapTable.additionalIndexCount or 0)
            local keyIndex = 1 + (remapTable.indexOffset or 0)
            for i=1,remapTable.multiCount do
                for j=1,additionalIndexCount do
                    local key = remapTable.multiKeyBase .. "_" .. keyIndex
                    local additionalIndexCountToUse = remapTable.additionalIndexCount
                    if j ~= 1 then
                        additionalIndexCountToUse = nil
                    end
                    table.insert(placeholderKeys, key)
                    placeholderInfos[key] = {
                        defaultModelIndex = subModelIndex,
                        defaultModelIndexesByDetailLevel = modelIndexesByDetailLevel,
                        resourceTypeIndex = remapTable.resourceTypeIndex,
                        additionalIndexCount = additionalIndexCountToUse,
                        scale = remapTable.scale,
                        hiddenOnBuildComplete = remapTable.hiddenOnBuildComplete,
                        defaultModelShouldOverrideResourceObject = remapTable.defaultModelShouldOverrideResourceObject,
                        placeholderModelIndexForObjectTypeFunction = remapTable.placeholderModelIndexForObjectTypeFunction,
                        offsetToWalkableHeight = remapTable.offsetToWalkableHeight,
                        rotateToWalkableRotation = remapTable.rotateToWalkableRotation,
                        offsetToStorageBoxWalkableHeight = remapTable.offsetToStorageBoxWalkableHeight,
                    }
                    keyIndex = keyIndex + 1
                end
            end
        else
            table.insert(placeholderKeys, remapTable.key)
            placeholderInfos[remapTable.key] = {
                defaultModelIndex = subModelIndex,
                defaultModelIndexesByDetailLevel = modelIndexesByDetailLevel,
                resourceTypeIndex = remapTable.resourceTypeIndex,
                additionalIndexCount = remapTable.additionalIndexCount,
                scale = remapTable.scale,
                hiddenOnBuildComplete = remapTable.hiddenOnBuildComplete,
                defaultModelShouldOverrideResourceObject = remapTable.defaultModelShouldOverrideResourceObject,
                placeholderModelIndexForObjectTypeFunction = remapTable.placeholderModelIndexForObjectTypeFunction,
                offsetToWalkableHeight = remapTable.offsetToWalkableHeight,
                rotateToWalkableRotation = remapTable.rotateToWalkableRotation,
                offsetToStorageBoxWalkableHeight = remapTable.offsetToStorageBoxWalkableHeight,
            }
        end
    end

end

local function addCloneIndex(existingIndex, cloneIndex)
    placeholderInfosByModelIndex[cloneIndex] = placeholderInfosByModelIndex[existingIndex]
    placeholderKeysByModelIndex[cloneIndex] = placeholderKeysByModelIndex[existingIndex]
end


local function modelDetailIndexFromSubdivLevel(subdivLevelOrNil)
    return model:modelLevelForSubdivLevel(subdivLevelOrNil)
end

local function getModelIndexForStandardRemaps(placeholderInfo, remaps, placeholderContext)
    if remaps then
        local remap = remaps[modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
        if remap then
            return remap
        end
    end
    return placeholderInfo.defaultModelIndex
end

addModel("campfire", {
    { 
        multiKeyBase = "rock",
        multiCount = 6, 
        defaultModelName = "rock1",
        resourceTypeIndex = resource.types.rock.index,
        offsetToWalkableHeight = true,
    },
    {
        key = "rock_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    { 
        multiKeyBase = "branch",
        multiCount = 6, 
        defaultModelName = "branch",
        offsetToWalkableHeight = true,
        rotateToWalkableRotation = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete and (not placeholderContext.hasFuel) and burntFuelRemaps[objectTypeIndex] then
                return burntFuelRemaps[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
            end
            
            if placeholderContext.subdivLevel then
                return gameObject:simpleModelIndexForGameObjectTypeAndSubdivLevel(objectTypeIndex, placeholderContext.subdivLevel)
            end
            
            return gameObject.types[objectTypeIndex].modelIndex
        end
    },
    { 
        key = "ash",
        defaultModelName = "campfireAsh",
        offsetToWalkableHeight = true,
        rotateToWalkableRotation = true,
    },
})

addModel("campfire_low", {
    { 
        multiKeyBase = "rock",
        multiCount = 6, 
        defaultModelName = "rock1",
        resourceTypeIndex = resource.types.rock.index,
        offsetToWalkableHeight = true,
    },
    {
        key = "rock_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    { 
        multiKeyBase = "branch",
        multiCount = 6, 
        defaultModelName = "branch",
        offsetToWalkableHeight = true,
        rotateToWalkableRotation = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete and (not placeholderContext.hasFuel) and burntFuelRemaps[objectTypeIndex] then
                return burntFuelRemaps[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
            end
            
            if placeholderContext.subdivLevel then
                return gameObject:simpleModelIndexForGameObjectTypeAndSubdivLevel(objectTypeIndex, placeholderContext.subdivLevel)
            end
            
            return gameObject.types[objectTypeIndex].modelIndex
        end
    },
})



addModel("brickKiln", {
    { 
        key = "mudBrickDry_1",
        defaultModelName = "mudBrickKilnSection_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, mudBrickKilnSectionRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "mudBrickDry_2",
        defaultModelName = "mudBrickKilnSectionWithOpening_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, mudBrickKilnSectionWithOpeningRemaps[objectTypeIndex], placeholderContext)--mudBrickKilnSectionWithOpeningRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    { 
        key = "mudBrickDry_3",
        defaultModelName = "mudBrickKilnSection_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, mudBrickKilnSectionRemaps[objectTypeIndex], placeholderContext)--mudBrickKilnSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    { 
        key = "mudBrickDry_4",
        defaultModelName = "mudBrickKilnSection_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, mudBrickKilnSectionRemaps[objectTypeIndex], placeholderContext)--mudBrickKilnSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    { 
        key = "mudBrickDry_5",
        defaultModelName = "mudBrickKilnSectionTop_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, mudBrickKilnSectionTopRemaps[objectTypeIndex], placeholderContext)--mudBrickKilnSectionTopRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    { 
        key = "mudBrickDry_6",
        defaultModelName = "mudBrickKilnSectionTop_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, mudBrickKilnSectionTopRemaps[objectTypeIndex], placeholderContext)--mudBrickKilnSectionTopRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    { 
        multiKeyBase = "branch",
        multiCount = 10, 
        defaultModelName = "branch",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete and (not placeholderContext.hasFuel) and burntFuelRemaps[objectTypeIndex] then
                return burntFuelRemaps[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
            end

            if halfLogRemaps[objectTypeIndex] then
                return getModelIndexForStandardRemaps(placeholderInfo, halfLogRemaps[objectTypeIndex], placeholderContext)
            end

            if halfBranchRemaps[objectTypeIndex] then
                return getModelIndexForStandardRemaps(placeholderInfo, halfBranchRemaps[objectTypeIndex], placeholderContext)
            end
            
            if placeholderContext.subdivLevel then
                return gameObject:simpleModelIndexForGameObjectTypeAndSubdivLevel(objectTypeIndex, placeholderContext.subdivLevel)
            end
            
            return gameObject.types[objectTypeIndex].modelIndex
        end
    },
    { 
        key = "ash",
        defaultModelName = "campfireAsh",
    },
})


addModel("hayBed", {
    { 
        key = "hay_1",
        defaultModelName = "hayBed_hay_1",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
        offsetToWalkableHeight = true,
    },
    { 
        key = "hay_2",
        defaultModelName = "hayBed_hay_2",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
        offsetToWalkableHeight = true,
    },
    { 
        key = "hay_3",
        defaultModelName = "hayBed_hay_3",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
        offsetToWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("hayBed_low", {
    { 
        key = "hay_1",
        defaultModelName = "hayBed_hay_1_low",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
        offsetToWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("woolskinBed", {
    { 
        key = "woolskin_1",
        defaultModelName = "woolskinBed_woolskin_1",
        resourceTypeIndex = resource.types.woolskin.index,
        offsetToWalkableHeight = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, woolskinBedRemaps_1[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "woolskin_2",
        defaultModelName = "woolskinBed_woolskin_2",
        resourceTypeIndex = resource.types.woolskin.index,
        offsetToWalkableHeight = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, woolskinBedRemaps_2[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "woolskin_3",
        defaultModelName = "woolskinBed_woolskin_3",
        resourceTypeIndex = resource.types.woolskin.index,
        offsetToWalkableHeight = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, woolskinBedRemaps_3[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "woolskin_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("woolskinBed_low", {
    { 
        key = "woolskin_1",
        defaultModelName = "woolskinBed_woolskin_1_low",
        resourceTypeIndex = resource.types.woolskin.index,
        offsetToWalkableHeight = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, woolskinBedRemaps_1[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "woolskin_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("thatchResearch", {
    { 
        multiKeyBase = "branch",
        multiCount = 2, 
        defaultModelName = "branch",
        resourceTypeIndex = resource.types.branch.index,
    },
    { 
        key = "hay_1",
        additionalIndexCount = 1, 
        defaultModelName = "thatchWide_075",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    { 
        key = "hay_2",
        defaultModelName = "thatchWide_075",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("mudBrickBuildingResearch", {
    { 
        multiKeyBase = "mudBrickDry",
        multiCount = 2, 
        defaultModelName = "mudBrickWallSection_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("brickBuildingResearch", {
    { 
        multiKeyBase = "firedBrick",
        multiCount = 2, 
        defaultModelName = "brickWallSection_sand",
        resourceTypeIndex = resource.types.firedBrick.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("tilingResearch", {
    { 
        multiKeyBase = "firedTile",
        multiCount = 2, 
        defaultModelName = "tileFloorSection2x1_firedTile",
        resourceTypeIndex = resource.types.firedTile.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tileFloorSection2x1Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("woodBuildingResearch", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 4, 
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("craftSimple", {
    {
        key = "resource_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_2",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_3",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("campfireRockCooking", {
    {
        key = "resource_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        multiKeyBase = "resource",
        multiCount = 1,
        additionalIndexCount = 4,
        defaultModelName = "flatbread",
        offsetToStorageBoxWalkableHeight = true,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("craftMudBrick", {
    {
        key = "clay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "clay_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "brickBinder_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "brickBinder_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("stoneSpearBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "stoneSpearHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "stoneSpearHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("flintSpearBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "flintSpearHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flintSpearHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("boneSpearBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "boneSpearHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "boneSpearHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("stonePickaxeBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "stonePickaxeHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "stonePickaxeHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("flintPickaxeBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "flintPickaxeHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flintPickaxeHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("stoneHatchetBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "stoneAxeHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "stoneAxeHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("flintHatchetBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "flintAxeHead_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flintAxeHead_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("balafonBuild", {
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "branch_2",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.branch.index,
    },
    {
        key = "pumpkin_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.pumpkin.index,
    },
    {
        key = "pumpkin_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.pumpkin.index,
    },
    {
        key = "pumpkin_2",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.pumpkin.index,
    },
    {
        key = "pumpkin_3",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.pumpkin.index,
    },
    {
        key = "flaxTwine_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "flaxTwine_1",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("craftThreshing", {
    {
        key = "container_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceGroupIndex = resource.groups.container.index,
    },
    {
        key = "wheat_store",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.wheat.index,
    },
    {
        key = "container_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceGroupIndex = resource.groups.container.index, --group index may not be actually supported ?
    },
    {
        key = "wheat_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceTypeIndex = resource.types.wheat.index,
    },
})


addModel("craftGrinding", {
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_1",
        offsetToStorageBoxWalkableHeight = true,
        resourceGroupIndex = resource.groups.urnHulledWheat.index, --group index may not be actually supported ?
        --resourceTypeIndex = resource.types.unfiredUrnHulledWheat.index,
    },
})



addModel("plantingResearch", {
    {
        key = "resource_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "mound",
        offsetToWalkableHeight = true,
    },
})

addModel("thatchWall", {
    { 
        multiKeyBase = "branch",
        multiCount = 5, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        hiddenOnBuildComplete = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete then
                return nil
            end
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "hay",
        multiCount = 6, 
        defaultModelName = "thatchWide",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("thatchWallDoor", {
    { 
        multiKeyBase = "branch",
        multiCount = 4, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        hiddenOnBuildComplete = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete then
                return nil
            end
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "branch",
        multiCount = 2, 
        indexOffset = 4,
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "hay",
        multiCount = 6, 
        defaultModelName = "thatchWide_075",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("thatchWallLargeWindow", {
    { 
        multiKeyBase = "branch",
        multiCount = 5, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        hiddenOnBuildComplete = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete then
                return nil
            end
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "hay_1",
        defaultModelName = "thatchWideShort",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_2",
        defaultModelName = "thatchWideShort",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_3",
        defaultModelName = "thatchSectionTall_100",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_4",
        defaultModelName = "thatchSectionTall_100",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_5",
        defaultModelName = "thatchWideShort",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_6",
        defaultModelName = "thatchWideShort",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },

    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("thatchWall4x1", {
    { 
        multiKeyBase = "branch",
        multiCount = 3, 
        defaultModelName = "branch",
        resourceTypeIndex = resource.types.branch.index,
        hiddenOnBuildComplete = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete then
                return nil
            end
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "hay",
        multiCount = 3, 
        additionalIndexCount = 1,
        defaultModelName = "thatchWideShort",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("thatchWall2x2", {
    { 
        multiKeyBase = "branch",
        multiCount = 3, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        hiddenOnBuildComplete = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete then
                return nil
            end
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "hay",
        multiCount = 3, 
        defaultModelName = "thatchWide",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("thatchRoof", {
    { 
        multiKeyBase = "branch",
        multiCount = 4, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "hay",
        multiCount = 8, 
        defaultModelName = "thatchWideTaller",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("thatchRoofLarge", {
    { 
        multiKeyBase = "branch",
        multiCount = 6, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "hay",
        multiCount = 8, 
        defaultModelName = "thatchWideTaller",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("thatchRoofLargeCorner", {
    { 
        multiKeyBase = "branch",
        multiCount = 9, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "hay_1",
        defaultModelName = "thatchCorner_1",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_2",
        defaultModelName = "thatchCorner_1",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_3",
        defaultModelName = "thatchCorner_2",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_4",
        defaultModelName = "thatchCorner_2",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_5",
        defaultModelName = "thatchCorner_3",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_6",
        defaultModelName = "thatchCorner_3",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_7",
        defaultModelName = "thatchCorner_4",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_8",
        defaultModelName = "thatchCorner_5",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "hay_9",
        defaultModelName = "thatchCorner_6",
        resourceTypeIndex = resource.types.hay.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("thatchRoofEnd", {
    { 
        multiKeyBase = "branch",
        multiCount = 2, 
        defaultModelName = "branchLong",
        resourceTypeIndex = resource.types.branch.index,
        hiddenOnBuildComplete = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete then
                return nil
            end
            return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "hay_1",
        defaultModelName = "thatchEndSegmentBottom",
        resourceTypeIndex = resource.types.hay.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "hay_2",
        defaultModelName = "thatchEndSegmentMiddle",
        resourceTypeIndex = resource.types.hay.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "hay_3",
        defaultModelName = "thatchEndSegmentTop",
        resourceTypeIndex = resource.types.hay.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("thatchRoofEnd_low", {
    { 
        key = "hay_1",
        resourceTypeIndex = resource.types.splitLog.index,
        defaultModelName = "thatchEndLow",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("splitLogFloor2x2", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 3,
        additionalIndexCount = 1, 
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("splitLogFloor2x2_low", {
    { 
        key = "splitLog_1",
        resourceTypeIndex = resource.types.splitLog.index,
        defaultModelName = "splitLogFloor2x2FullLow",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return splitLogFloor2x2FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogFloor4x4", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 12,
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("splitLogFloor4x4_low", {
    { 
        key = "splitLog_1",
        resourceTypeIndex = resource.types.splitLog.index,
        defaultModelName = "splitLogFloor4x4FullLow",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return splitLogFloor4x4FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogWall", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 6, 
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "log",
        multiCount = 2, 
        defaultModelName = "birchLog",
        resourceTypeIndex = resource.types.log.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogWall4x1", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 3, 
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "log_1",
        additionalIndexCount = 1,
        defaultModelName = "birchLogHalf",
        resourceTypeIndex = resource.types.log.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, halfLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "log_2",
        defaultModelName = "birchLogHalf",
        resourceTypeIndex = resource.types.log.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, halfLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogWall2x2", {
    { 
        key = "splitLog_1",
        defaultModelName = "birchSplitLog",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.splitLog.index,
    },
    { 
        key = "splitLog_2",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    { 
        key = "splitLog_3",
        defaultModelName = "birchSplitLog",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.splitLog.index,
    },
    { 
        key = "splitLog_4",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    { 
        key = "splitLog_5",
        defaultModelName = "birchSplitLog",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.splitLog.index,
    },
    { 
        key = "splitLog_6",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    { 
        multiKeyBase = "log",
        multiCount = 2, 
        defaultModelName = "birchLog",
        resourceTypeIndex = resource.types.log.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogWallDoor", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 5,
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog075",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog075Remaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_11",
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "log",
        multiCount = 2, 
        defaultModelName = "birchLog",
        resourceTypeIndex = resource.types.log.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogWallLargeWindow", {
    {
        key = "splitLog_1",
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_2",
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_3",
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog05",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog05Remaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_4",
        defaultModelName = "birchSplitLog05",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog05Remaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_5",
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog05",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog05Remaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_6",
        defaultModelName = "birchSplitLog05",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog05Remaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_7",
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_8",
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "log",
        multiCount = 2, 
        defaultModelName = "birchLog",
        resourceTypeIndex = resource.types.log.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("splitLogRoofEnd", {
    { 
        key = "splitLog_1",
        defaultModelName = "birchSplitLogLongAngleCut",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogAngleCutRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "splitLog_2",
        defaultModelName = "birchSplitLog2x2GradAngleCut",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog2x2GradAngleCutRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "splitLog_3",
        defaultModelName = "birchSplitLog2x1GradAngleCut",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog2x1GradAngleCutRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "splitLog_4",
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog075AngleCut",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog075AngleCutRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "splitLog_5",
        defaultModelName = "birchSplitLog05AngleCut",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog05AngleCutRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        multiKeyBase = "log",
        multiCount = 2, 
        defaultModelName = "birchLog3",
        resourceTypeIndex = resource.types.log.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, log3Remaps[objectTypeIndex], placeholderContext)
        end 
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("splitLogSteps", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 2, 
        defaultModelName = "birchSplitLogLong",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_3",
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_4",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_5",
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_6",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_7",
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_8",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_9",
        additionalIndexCount = 2,
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_10",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_11",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("splitLogSteps2x2", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 2, 
        defaultModelName = "birchSplitLog2x1Grad",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog2x1GradRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "splitLog_3",
        additionalIndexCount = 2,
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_4",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_5",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_6",
        additionalIndexCount = 2,
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_7",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_8",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("splitLogRoof", {
    { 
        multiKeyBase = "log",
        multiCount = 5, 
        defaultModelName = "birchLog4",
        resourceTypeIndex = resource.types.log.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, log4Remaps[objectTypeIndex], placeholderContext)
        end 
    },
    { 
        multiKeyBase = "splitLog",
        multiCount = 10, 
        additionalIndexCount = 1,
        defaultModelName = "birchSplitLog2x2Grad",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog2x2GradRemaps[objectTypeIndex], placeholderContext)
        end
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("mudBrickWall", {
    { 
        multiKeyBase = "mudBrickDry",
        multiCount = 6, 
        defaultModelName = "mudBrickWallSection_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("mudBrickWallDoor", {
    { 
        multiKeyBase = "mudBrickDry",
        multiCount = 5,
        defaultModelName = "mudBrickWallSection_075_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSection075Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_6",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection_075_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSection075Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_7",
        defaultModelName = "mudBrickWallSectionDoorTop_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallDoorTopRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWallLargeWindow", {
    {
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_2",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_3",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallColumn_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallColumnRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_4",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallColumn_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallColumnRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_5",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_6",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWall_low", {
    { 
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionFullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWallLargeWindow_low", {
    {
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionWindowFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionWindowFullLowRemaps[objectTypeIndex]
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWallDoor_low", {
    {
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionDoorFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionDoorFullLowRemaps[objectTypeIndex]
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWall4x1_low", {
    { 
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection4x1FullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSection4x1FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("mudBrickWall2x2_low", {
    { 
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection2x2FullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSection2x2FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWall4x1", {
    {
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_2",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_3",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_4",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickWall2x2", {
    { 
        multiKeyBase = "mudBrickDry",
        multiCount = 3, 
        defaultModelName = "mudBrickWallSection_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickColumn", {
    {
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickColumnBottom_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickColumnBottomRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_2",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickColumnTop_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickColumnTopRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickColumn_low", {
    {
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickColumnFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickColumnFullLowRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("mudBrickFloor2x2", {
    { 
        multiKeyBase = "mudBrickDry",
        multiCount = 2, 
        defaultModelName = "mudBrickFloorSection2x1_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickFloorSection2x1Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("mudBrickFloor2x2_low", {
    { 
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickFloorSection2x2FullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickFloorSection2x2FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("mudBrickFloor4x4", {
    { 
        multiKeyBase = "mudBrickDry",
        multiCount = 8,
        defaultModelName = "mudBrickFloorSection2x1_sand",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickFloorSection2x1Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("mudBrickFloor4x4_low", {
    { 
        key = "mudBrickDry_1",
        resourceTypeIndex = resource.types.mudBrickDry.index,
        defaultModelName = "mudBrickFloorSection4x4FullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return mudBrickFloorSection4x4FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "mudBrickDry_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("brickWall", {
    { 
        multiKeyBase = "firedBrick",
        multiCount = 6, 
        defaultModelName = "brickWallSection_sand",
        resourceTypeIndex = resource.types.firedBrick.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("brickWallDoor", {
    { 
        multiKeyBase = "firedBrick",
        multiCount = 5,
        defaultModelName = "brickWallSection_075_sand",
        resourceTypeIndex = resource.types.firedBrick.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSection075Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_6",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection_075_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSection075Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_7",
        defaultModelName = "brickWallSectionDoorTop_sand",
        resourceTypeIndex = resource.types.firedBrick.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallDoorTopRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("brickWallLargeWindow", {
    {
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_2",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_3",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallColumn_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallColumnRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_4",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallColumn_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallColumnRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_5",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_6",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("brickWall4x1", {
    {
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_2",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_3",
        additionalIndexCount = 1,
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_4",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionSingleHigh_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionSingleHighRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("brickWall2x2", {
    { 
        multiKeyBase = "firedBrick",
        multiCount = 3, 
        defaultModelName = "brickWallSection_sand",
        resourceTypeIndex = resource.types.firedBrick.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionRemaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})



addModel("brickWall_low", {
    { 
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionFullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("brickWallLargeWindow_low", {
    {
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionWindowFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionWindowFullLowRemaps[objectTypeIndex]
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("brickWallDoor_low", {
    {
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSectionDoorFullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSectionDoorFullLowRemaps[objectTypeIndex]
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("brickWall4x1_low", {
    { 
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection4x1FullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSection4x1FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("brickWall2x2_low", {
    { 
        key = "firedBrick_1",
        resourceTypeIndex = resource.types.firedBrick.index,
        defaultModelName = "brickWallSection2x2FullLow_sand",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return brickWallSection2x2FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedBrick_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("tileFloor2x2", {
    { 
        multiKeyBase = "firedTile",
        multiCount = 2, 
        defaultModelName = "tileFloorSection2x1_firedTile",
        resourceTypeIndex = resource.types.firedTile.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tileFloorSection2x1Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("tileFloor2x2_low", {
    { 
        key = "firedTile_1",
        resourceTypeIndex = resource.types.firedTile.index,
        defaultModelName = "tileFloorSection2x2FullLow_firedTile",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tileFloorSection2x2FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("tileFloor4x4", {
    { 
        multiKeyBase = "firedTile",
        multiCount = 8,
        defaultModelName = "tileFloorSection2x1_firedTile",
        resourceTypeIndex = resource.types.firedTile.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tileFloorSection2x1Remaps[objectTypeIndex] or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("tileFloor4x4_low", {
    { 
        key = "firedTile_1",
        resourceTypeIndex = resource.types.firedTile.index,
        defaultModelName = "tileFloorSection4x4FullLow_firedTile",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tileFloorSection4x4FullLowRemaps[objectTypeIndex]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("tileRoof", {
    { 
        multiKeyBase = "splitLog",
        multiCount = 4, 
        defaultModelName = "birchSplitLog3",
        resourceTypeIndex = resource.types.splitLog.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, splitLog3Remaps[objectTypeIndex], placeholderContext)
        end 
    },
    { 
        key = "splitLog_5",
        resourceTypeIndex = resource.types.splitLog.index,
        defaultModelName = "birchSplitLogLong",
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, longSplitLogRemaps[objectTypeIndex], placeholderContext)
        end 
    },
    { 
        multiKeyBase = "firedTile",
        multiCount = 8, 
        defaultModelName = "tileWideTaller",
        resourceTypeIndex = resource.types.firedTile.index,
        defaultModelShouldOverrideResourceObject = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("appleTree", {
    { 
        multiKeyBase = "apple",
        multiCount = 6, 
        defaultModelName = "appleHangingFruit",
        resourceTypeIndex = resource.types.apple.index,
        scale = 1.0,
    },
})

addModel("appleTreeWinter", {
    { 
        multiKeyBase = "apple",
        multiCount = 6, 
        defaultModelName = "apple",
        resourceTypeIndex = resource.types.apple.index,
        scale = 1.0,
    },
})

addModel("orangeTree", {
    { 
        multiKeyBase = "orange",
        multiCount = 10, 
        defaultModelName = "orangeHangingFruit",
        resourceTypeIndex = resource.types.orange.index,
        scale = 1.0,
    },
})

addModel("peachTree", {
    { 
        multiKeyBase = "peach",
        multiCount = 7, 
        defaultModelName = "peachHangingFruit",
        resourceTypeIndex = resource.types.peach.index,
        scale = 1.0,
    },
})

addModel("peachTreeWinter", {
    { 
        multiKeyBase = "peach",
        multiCount = 7, 
        defaultModelName = "peach",
        resourceTypeIndex = resource.types.peach.index,
        scale = 1.0,
    },
})

addModel("oliveTree", {
    { 
        multiKeyBase = "olive",
        multiCount = 7, 
        defaultModelName = "oliveHangingFruit",
        resourceTypeIndex = resource.types.olive.index,
        scale = 1.0,
    },
})


addModel("bananaTree", {
    { 
        multiKeyBase = "banana",
        multiCount = 3, 
        defaultModelName = "bananaHangingFruit",
        resourceTypeIndex = resource.types.banana.index,
        scale = 1.0,
    },
})

addModel("coconutTree", {
    { 
        multiKeyBase = "coconut",
        multiCount = 3, 
        defaultModelName = "coconutHangingFruit",
        resourceTypeIndex = resource.types.coconut.index,
        scale = 1.0,
    },
})

addModel("raspberryBush", {
    { 
        multiKeyBase = "raspberry",
        multiCount = 6, 
        defaultModelName = "raspberryHangingFruit",
        resourceTypeIndex = resource.types.raspberry.index,
    },
})

addModel("gooseberryBush", {
    { 
        multiKeyBase = "gooseberry",
        multiCount = 6, 
        defaultModelName = "gooseberryHangingFruit",
        resourceTypeIndex = resource.types.gooseberry.index,
    },
})

addModel("pumpkinPlant", {
    { 
        multiKeyBase = "pumpkin",
        multiCount = 1, 
        defaultModelName = "pumpkinHangingFruit",
        resourceTypeIndex = resource.types.pumpkin.index,
    },
})

addModel("wheatPlantCluster", {
    { 
        multiKeyBase = "wheatPlant",
        multiCount = 10, 
        defaultModelName = "wheatPlant",
        scale = 1.0,
        offsetToWalkableHeight = true,
    },
})

addModel("wheatPlantSaplingCluster", {
    { 
        multiKeyBase = "wheatPlant",
        multiCount = 10, 
        defaultModelName = "wheatPlantSapling",
        scale = 1.0,
        offsetToWalkableHeight = true,
    },
    {
        key = "resource_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_1",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_2",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "resource_3",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("storageArea", {
    { 
        multiKeyBase = "peg",
        multiCount = 4, 
        defaultModelName = "storageAreaPeg",
        offsetToWalkableHeight = true,
    },
})

addModel("craftArea", {
    { 
        key = "rock_1",
        defaultModelName = "craftArea_rock1",
        resourceTypeIndex = resource.types.rock.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return craftAreaRockRemaps[objectTypeIndex]
        end
    },
})

addModel("stoneSpear", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPole_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, standardLengthPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end,
    },
    { 
        key = "stoneSpearHead_1",
        defaultModelName = "stoneSpearHead_rock1",
        resourceTypeIndex = resource.types.stoneSpearHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("flintSpear", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPole_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, standardLengthPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end,
    },
    { 
        key = "flintSpearHead_1",
        defaultModelName = "flintSpearHead",
        resourceTypeIndex = resource.types.flintSpearHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("boneSpear", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPole_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, standardLengthPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end,
    },
    { 
        key = "boneSpearHead_1",
        defaultModelName = "boneSpearHead",
        resourceTypeIndex = resource.types.boneSpearHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

--[[
    
    { 
        key = "branch_1",
        defaultModelName = "woodenPole_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, standardLengthPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end,
    },
    { 
        key = "stoneSpearHead_1",
        defaultModelName = "stoneSpearHead_rock1",
        resourceTypeIndex = resource.types.stoneSpearHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
]]

addModel("stonePickaxe", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "stonePickaxeHead_1",
        defaultModelName = "stonePickaxeHead_rock1",
        resourceTypeIndex = resource.types.stonePickaxeHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("flintPickaxe", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "flintPickaxeHead_1",
        defaultModelName = "flintPickaxeHead",
        resourceTypeIndex = resource.types.flintPickaxeHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("stoneHatchet", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "stoneAxeHead_1",
        defaultModelName = "stoneAxeHead_rock1",
        resourceTypeIndex = resource.types.stoneAxeHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("flintHatchet", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPoleShort_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "flintAxeHead_1",
        defaultModelName = "flintAxeHead",
        resourceTypeIndex = resource.types.flintAxeHead.index,
    },
    { 
        key = "flaxTwine_1",
        defaultModelName = "flaxTwineBinding",
        resourceTypeIndex = resource.types.flaxTwine.index,
        defaultModelShouldOverrideResourceObject = true,
    },
})

addModel("torch", {
    { 
        key = "branch_1",
        defaultModelName = "woodenPole_birch",
        resourceTypeIndex = resource.types.branch.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, standardLengthPoleBranchRemaps[objectTypeIndex], placeholderContext)
        end,
    },
    { 
        key = "hay_1",
        defaultModelName = "hayTorch",
        resourceTypeIndex = resource.types.hay.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            if placeholderContext and placeholderContext.buildComplete and (not placeholderContext.hasFuel) and burntFuelRemaps[objectTypeIndex] then
                return burntFuelRemaps[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
            end
            return hayTorchOverrides[modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]-- or placeholderInfo.defaultModelIndex
        end
    },
    {
        key = "branch_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "hay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("pathNode_rock", {
    { 
        key = "rock_1",
        defaultModelName = "pathNode_rock_1",
        resourceTypeIndex = resource.types.rock.index,
        --defaultModelShouldOverrideResourceObject = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return rockPathRemaps_1[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
        end
    },
    { 
        key = "rock_2",
        defaultModelName = "pathNode_rock_2",
        resourceTypeIndex = resource.types.rock.index,
        --defaultModelShouldOverrideResourceObject = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return rockPathRemaps_2[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
        end
    },
    {
        key = "rock_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("pathNode_dirt", {
    { 
        key = "dirt_1",
        defaultModelName = "pathNode_dirt_1",
        resourceTypeIndex = resource.types.dirt.index,
        --defaultModelShouldOverrideResourceObject = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return dirtPathRemaps_1[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
        end
    },
    {
        key = "dirt_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("pathNode_sand", {
    { 
        key = "sand_1",
        defaultModelName = "pathNode_sand_1",
        resourceTypeIndex = resource.types.sand.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return sandPathRemaps_1[objectTypeIndex]
        end
    },
    {
        key = "sand_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("pathNode_clay", {
    { 
        key = "clay_1",
        defaultModelName = "pathNode_clay_1",
        resourceTypeIndex = resource.types.clay.index,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return clayPathRemaps_1[objectTypeIndex]
        end
    },
    {
        key = "clay_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})


addModel("pathNode_tile", {
    { 
        key = "firedTile_1",
        defaultModelName = "pathNode_tile_1",
        resourceTypeIndex = resource.types.firedTile.index,
        --defaultModelShouldOverrideResourceObject = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tilePathRemaps_1[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
        end
    },
    { 
        key = "firedTile_2",
        defaultModelName = "pathNode_tile_2",
        resourceTypeIndex = resource.types.firedTile.index,
        --defaultModelShouldOverrideResourceObject = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return tilePathRemaps_2[objectTypeIndex][modelDetailIndexFromSubdivLevel(placeholderContext.subdivLevel)]
        end
    },
    {
        key = "firedTile_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "tool",
        offsetToStorageBoxWalkableHeight = true,
    },
})

addModel("splitLogBench", {
    { 
        key = "log_1",
        defaultModelName = "birchLogShort",
        resourceTypeIndex = resource.types.log.index,
        additionalIndexCount = 1,
        --offsetToWalkableHeight = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "log_2",
        defaultModelName = "birchLogShort",
        resourceTypeIndex = resource.types.log.index,
        --offsetToWalkableHeight = true,
        placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
            return getModelIndexForStandardRemaps(placeholderInfo, shortLogRemaps[objectTypeIndex], placeholderContext)
        end
    },
    { 
        key = "splitLog_1",
        defaultModelName = "birchSplitLog",
        resourceTypeIndex = resource.types.splitLog.index,
        --offsetToWalkableHeight = true,
        --rotateToWalkableRotation = true,
    },
    {
        key = "log_store",
        offsetToStorageBoxWalkableHeight = true,
    },
    {
        key = "splitLog_store",
        offsetToStorageBoxWalkableHeight = true,
    },
})

function modelPlaceholder:addModel(modelName, remapTables)
    addModel(modelName, remapTables)
end

function modelPlaceholder:placeholderInfoForModelAndPlaceholderKey(modelIndex, placeholderKey)
    local placeholderInfo = placeholderInfosByModelIndex[modelIndex]
    if placeholderInfo then
        return placeholderInfo[placeholderKey]
    end
    return nil
end

function modelPlaceholder:modelHasPlaceholderKey(modelIndex, placeholderKey)
    return (modelPlaceholder:placeholderInfoForModelAndPlaceholderKey(modelIndex, placeholderKey) ~= nil)
end

function modelPlaceholder:getPlaceholderModelIndexForObjectType(placeholderInfo, objectTypeIndex, placeholderContext)
    local subdivLevel = 1
    if placeholderContext and placeholderContext.subdivLevel then
        subdivLevel = placeholderContext.subdivLevel
    end
    if placeholderInfo.defaultModelShouldOverrideResourceObject then
        return placeholderInfo.defaultModelIndexesByDetailLevel[modelDetailIndexFromSubdivLevel(subdivLevel)]
    end
    if placeholderInfo.placeholderModelIndexForObjectTypeFunction then
        return placeholderInfo.placeholderModelIndexForObjectTypeFunction(placeholderInfo, objectTypeIndex, placeholderContext)
    end

    return gameObject:simpleModelIndexForGameObjectTypeAndSubdivLevel(objectTypeIndex, subdivLevel)
end

function modelPlaceholder:getPlaceholderModelIndexWithRestrictedObjectTypes(placeholderInfo, resourceObjectTypeBlackListOrNil, resourceObjectTypeWhiteListOrNil, placeholderContext)
    if (not resourceObjectTypeBlackListOrNil) and (not resourceObjectTypeWhiteListOrNil) then
        return modelPlaceholder:getDefaultModelIndex(placeholderInfo, placeholderContext or {
            subdivLevel = mj.SUBDIVISIONS - 1
        })
    end
    local resourceInfo = {}
   -- mj:log("modelPlaceholder:getPlaceholderModelIndexWithRestrictedObjectTypes placeholderInfo:", placeholderInfo)

    if placeholderInfo.resourceTypeIndex then
        resourceInfo.type = placeholderInfo.resourceTypeIndex
    elseif placeholderInfo.resourceGroupIndex then
        resourceInfo.group = placeholderInfo.resourceGroupIndex
    else
        return modelPlaceholder:getDefaultModelIndex(placeholderInfo, placeholderContext or {
            subdivLevel = mj.SUBDIVISIONS - 1
        })
    end

    --mj:log("modelPlaceholder:getPlaceholderModelIndexWithRestrictedObjectTypes resourceInfo:", resourceInfo)

    local orderedAvailableObjects = gameObject:getAvailableGameObjectTypeIndexesForRestrictedResource(resourceInfo, resourceObjectTypeBlackListOrNil, resourceObjectTypeWhiteListOrNil)
    --mj:log("modelPlaceholder:getPlaceholderModelIndexWithRestrictedObjectTypes orderedAvailableObjects:", orderedAvailableObjects)
    if orderedAvailableObjects then
        return modelPlaceholder:getPlaceholderModelIndexForObjectType(placeholderInfo, orderedAvailableObjects[1], placeholderContext or {
            subdivLevel = mj.SUBDIVISIONS - 1
        })
    end
    return modelPlaceholder:getDefaultModelIndex(placeholderInfo, placeholderContext or {
        subdivLevel = mj.SUBDIVISIONS - 1
    })
end

function modelPlaceholder:getDefaultModelIndex(placeholderInfo, placeholderContext)
    local subdivLevel = 1
    if placeholderContext and placeholderContext.subdivLevel then
        subdivLevel = placeholderContext.subdivLevel
    end
    return placeholderInfo.defaultModelIndexesByDetailLevel[modelDetailIndexFromSubdivLevel(subdivLevel)]
end

function modelPlaceholder:placeholderKeysForModelIndex(modelIndex)
    return placeholderKeysByModelIndex[modelIndex]
end


function modelPlaceholder:getSubModelInfos(objectInfo, subdivLevel)
    local subModelSubModelInfos = nil

    if objectInfo then
        local gameObjectType = gameObject.types[objectInfo.objectTypeIndex]
        
        local placeholderKeys = modelPlaceholder:placeholderKeysForModelIndex(gameObjectType.modelIndex)
        if placeholderKeys then
            local constructionObjects = objectInfo.constructionObjects
            local foundResourceCounts = {}
            local placeholderContext = {
                buildComplete = true,
                subdivLevel = subdivLevel,
            }
            for i,key in pairs(placeholderKeys) do
                local placeholderInfo = modelPlaceholder:placeholderInfoForModelAndPlaceholderKey(gameObjectType.modelIndex, key)
                if placeholderInfo.defaultModelIndex then
                    local modelIndex = model:modelIndexForDetailedModelIndexAndDetailLevel(placeholderInfo.defaultModelIndex, modelDetailIndexFromSubdivLevel(subdivLevel))
                    --mj:log("modelIndexForDetailedModelIndexAndDetailLevel. modelIndex:", modelIndex, " placeholderInfo.defaultModelIndex:", placeholderInfo.defaultModelIndex)
                    local foundSubObjectInfo = nil
                    if constructionObjects and placeholderInfo.resourceTypeIndex then
                        local resourceTypeIndex = placeholderInfo.resourceTypeIndex
                        local resourceCounter = 0
                        for j,subObjectInfo in ipairs(constructionObjects) do
                            if gameObject.types[subObjectInfo.objectTypeIndex].resourceTypeIndex == resourceTypeIndex then
                                resourceCounter = resourceCounter + 1
                                if not foundResourceCounts[resourceTypeIndex] or resourceCounter > foundResourceCounts[resourceTypeIndex] then
                                    foundResourceCounts[resourceTypeIndex] = resourceCounter
                                    modelIndex = modelPlaceholder:getPlaceholderModelIndexForObjectType(placeholderInfo, subObjectInfo.objectTypeIndex, placeholderContext)
                                    foundSubObjectInfo = subObjectInfo
                                    break
                                end
                            end
                        end
                    end
                    if not subModelSubModelInfos then
                        subModelSubModelInfos = {}
                    end
                    subModelSubModelInfos[#subModelSubModelInfos + 1] = {
                        key = key,
                        modelIndex = modelIndex,
                        subModels = modelPlaceholder:getSubModelInfos(foundSubObjectInfo, subdivLevel),
                    }
                end
            end
        end
    end

    return subModelSubModelInfos
end

local cloneParentsByClone = model.clones
for cloneIndex,parentIndex in pairs(cloneParentsByClone) do
    addCloneIndex(parentIndex, cloneIndex)
end

return modelPlaceholder