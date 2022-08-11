local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec4 = mjm.vec4
local toVec3 = mjm.toVec3


local edgeDecal = mjrequire "common/edgeDecal"
local moodColors = mjrequire "common/moodColors"

local material = {}

local grassRoughness = 0.95
local grassTopsRoughness = 0.8
local grassTopsRoughnessB = 0.6
local bushRoughness = 0.95

local grassRoughnessDry = 0.8
local grassTopsRoughnessDry = 0.6
local grassTopsRoughnessDryB = 0.4


local grassLightness = 1.0

local function mat(key, color, roughness, metal)
	return {key = key, color = color, roughness = roughness, metal = metal or 0.0}
end

local whiteColor = vec3(0.65,0.65,0.65)
--local blueColor = vec3(0.4,0.6,0.8)
local blueColor = vec3(0.3, 0.7, 1.0) * 0.6
local blueHighlightColor = vec3(0.6,0.8,1.0)
local orangeColor = vec3(0.8,0.4,0.0)
local orangeHighlightColor = vec3(1.0,0.2,0.0)
local greenColor = vec3(0.2,0.6,0.2)
local greenHighlightColor = vec3(0.8,1.0,0.8)
local redColor = vec3(0.6,0.2,0.2)
local yellowColor = vec3(0.6,0.6,0.2)


local uiRoughness = 0.6


local redColorBright = vec3(0.8,0.1,0.1)
local greenColorBright = vec3(0.1,0.8,0.1)
local yellowColorBright = vec3(0.8,0.8,0.1)

local redColorDark = vec3(0.2,0.0,0.0)
local greenColorDark = vec3(0.05,0.3,0.05)
local blueColorDark = vec3(0.3, 0.7, 1.0) * 0.5


local temperateGrassBaseColor = vec3(0.12,0.17,0.07)
local mediterrainianGrassBaseColor = vec3(0.24,0.21,0.1) * 1.2
local tundraGrassBaseColor = vec3(0.18,0.16,0.1) * 1.4
local winterGrassColor = (temperateGrassBaseColor + mediterrainianGrassBaseColor) * 0.5

local mammothColor = vec3(0.16, 0.135, 0.12) * 1.5

local uiColorToMatColorMultiplier = 0.7

local function getMoodColor(baseColor)
	local vecColor = toVec3(baseColor)
	vecColor = vec3(math.pow(vecColor.x, 1.5), math.pow(vecColor.y, 1.5), math.pow(vecColor.z, 1.5))
	return vecColor * uiColorToMatColorMultiplier
end

local function getMoodBackgroundColor(baseColor)
	local vecColor = toVec3(baseColor)
	vecColor = vec3(math.pow(vecColor.x * 0.3, 1.5), math.pow(vecColor.y * 0.3, 1.5), math.pow(vecColor.z * 0.3, 1.5))
	return vecColor * uiColorToMatColorMultiplier
end

function material:getUIColor(materialIndexToUse)
	local vecColor = toVec3(material.types[materialIndexToUse].color) * 2.5
	vecColor = vec3(math.pow(vecColor.x, 0.5), math.pow(vecColor.y, 0.5), math.pow(vecColor.z, 0.5))
	--vecColor = vecColor * uiColorToMatColorMultiplier
	return vec4(vecColor.x, vecColor.y, vecColor.z, 1.0)
end

local function getAutumnColor(base)
	return base * 0.6 + vec3(0.05,0.05,0.05)
end

local thatchBaseColor = vec3(0.33,0.31,0.28) * 0.75
local pineColor = vec3(0.05,0.1,0.05)

local redSandColor = vec3(0.5, 0.2, 0.15)

material.types = mj:indexed {
	mat("trunk", vec3(0.19,0.14,0.12) * 0.5, 1.0),
	mat("whiteTrunk", vec3(0.75,0.75,0.75), 1.0),
	mat("darkBark", vec3(0.22,0.2,0.16) * 0.5, 1.0),
	mat("bushDecal", vec3(0.25,0.3,0.15) * 1.1, bushRoughness),
	mat("greenSeed", vec3(0.15,0.3,0.15), 1.0),
	
	mat("bananaBarkNoDecal", vec3(0.19,0.14,0.05) * 1.7, 1.0),
	mat("bananaBark", vec3(0.19,0.14,0.05) * 1.7, 1.0),

	mat("autumn1",  getAutumnColor(vec3(0.55,0.43,0.05)  )* 1.0, bushRoughness),
	mat("autumn2",  getAutumnColor(vec3(0.51,0.38,0.05)  )* 1.0, bushRoughness),
	mat("autumn3",  getAutumnColor(vec3(0.35,0.17,0.06)  )* 1.0, bushRoughness),
	mat("autumn4",  getAutumnColor(vec3(0.55,0.45,0.1)   )* 1.0, bushRoughness),
	mat("autumn5",  getAutumnColor(vec3(0.51,0.32,0.1)   )* 1.0, bushRoughness),
	mat("autumn6",  getAutumnColor(vec3(0.4,0.13,0.08)   )* 1.0, bushRoughness),
	mat("autumn7",  getAutumnColor(vec3(0.7,0.35,0.1)    )* 1.0, bushRoughness),
	mat("autumn8",  getAutumnColor(vec3(0.44,0.12,0.04)  )* 1.0, bushRoughness),
	mat("autumn9",  getAutumnColor(vec3(0.54,0.25,0.08)  )* 1.0, bushRoughness),
	mat("autumn10", getAutumnColor(vec3(0.67,0.5,0.01)   )* 1.0, bushRoughness),
	mat("autumn11", getAutumnColor(vec3(0.29,0.13,0.07)  )* 1.0, bushRoughness),
	mat("autumn12", getAutumnColor(vec3(0.52,0.04,0.04)  )* 1.0, bushRoughness),
	mat("autumn13", getAutumnColor(vec3(0.38,0.24,0.08)  )* 1.0, bushRoughness),
	mat("autumn14", getAutumnColor(vec3(0.63,0.42,0.04)  )* 1.0, bushRoughness),
	mat("autumn15", getAutumnColor(vec3(0.82,0.14,0.02)  )* 1.0, bushRoughness),
	mat("autumn16", getAutumnColor(vec3(0.64,0.63,0.1)   )* 1.0, bushRoughness),
	
	mat("winter1", vec3(0.25,0.12,0.08)  * 1.0, bushRoughness),
	mat("winter2", vec3(0.35,0.22,0.08)  * 1.0, bushRoughness),

	mat("leafyBushA", vec3(0.25,0.33,0.15) * 0.8, bushRoughness),
	--mat("leafyBushASpring", vec3(0.25,0.33,0.15) * 1.1, bushRoughness),
	mat("leafyBushASpring", vec3(0.6,0.5,0.5) * 0.8, bushRoughness),
	
	mat("leafyBushB", vec3(0.25,0.33,0.15) * 0.8, bushRoughness),
	mat("leafyBushBSpring", vec3(0.25,0.37,0.15) * 0.8, bushRoughness),
	
	mat("leafyBushC", vec3(0.25,0.35,0.11) * 0.8, bushRoughness),
	mat("leafyBushCSpring", vec3(0.21,0.37,0.11) * 0.8, bushRoughness),
	
	mat("bush", vec3(0.25,0.33,0.15) * 0.8, bushRoughness),
	mat("bushSpring", vec3(0.25,0.37,0.15) * 1.0, bushRoughness),
	
	mat("bushA", vec3(0.25,0.33,0.15) * 0.8, bushRoughness),
	mat("bushASpring", vec3(0.6,0.5,0.5) * 0.7, bushRoughness),

	mat("bushB", vec3(0.25,0.33,0.15) * 0.8, bushRoughness),
	mat("bushBSpring", vec3(0.25,0.37,0.15) * 0.9, bushRoughness),
	

	mat("bushC", vec3(0.25,0.35,0.11) * 0.8, bushRoughness),
	mat("bushCSpring", vec3(0.21,0.37,0.11) * 0.9, bushRoughness),
	
	mat("leafyBushAspen", vec3(0.25,0.25,0.05) * 0.8, bushRoughness),
	mat("leafyBushAspenSpring", vec3(0.25,0.29,0.05) * 0.9, bushRoughness),
	mat("bushAspen", vec3(0.25,0.25,0.05) * 0.8, bushRoughness),
	mat("bushAspenSpring", vec3(0.25,0.29,0.05) * 0.9, bushRoughness),
	mat("leafyBushAspenSmall", vec3(0.25,0.25,0.05) * 0.8, bushRoughness),
	mat("leafyBushAspenSmallSpring", vec3(0.25,0.29,0.05) * 0.9, bushRoughness),
	
	mat("bananaLeafNoBush", vec3(0.25,0.35,0.15) * 1.2, bushRoughness),
	mat("bananaLeaf", vec3(0.25,0.35,0.15) * 1.2, bushRoughness),
	
	mat("leafyBushMid", vec3(0.25,0.33,0.2) * 0.8, bushRoughness * 0.9),
	mat("leafyBushMidSpring", vec3(0.35,0.43,0.2), bushRoughness * 0.9),
	mat("leafyBushOlive", vec3(0.18,0.21,0.11), bushRoughness * 1.0),
	mat("leafyBushOliveWinter", vec3(0.18,0.21,0.11) * 0.9, bushRoughness * 1.0),
	mat("bushMid", vec3(0.25,0.33,0.2) * 0.8, bushRoughness * 0.9),
	mat("bushMidSpring", vec3(0.35,0.43,0.2), bushRoughness * 0.9),
	mat("leafyBushSmall", vec3(0.25,0.33,0.2) * 0.8, bushRoughness * 0.9),
	mat("leafyBushSmallSpring", vec3(0.35,0.43,0.2), bushRoughness * 0.9),

	
	mat("bambooGreen", vec3(0.25,0.33,0.15) * 0.8, bushRoughness * 0.6),
	mat("bambooDark", vec3(0.35,0.33,0.2) * 0.2, bushRoughness),
	mat("bamboo", vec3(0.28,0.25,0.2) * 1.0, bushRoughness * 0.7),
	mat("bambooLeafNoBush", vec3(0.25,0.4,0.1) * 0.7, bushRoughness),
	mat("bambooLeaf", vec3(0.25,0.4,0.1) * 0.7, bushRoughness),
	mat("bambooLeafSmall", vec3(0.25,0.4,0.1) * 0.7, bushRoughness),
	
	mat("bambooSeed", vec3(0.28,0.25,0.15) * 0.8, bushRoughness * 0.6),
	mat("bambooSeedRotten", vec3(0.4,0.4,0.4), bushRoughness),
	

	mat("leafyPine", pineColor, bushRoughness),
	mat("leafyPineSmall", pineColor, bushRoughness),
	mat("pine", pineColor, bushRoughness),
	--mat("darkBush", vec3(0.05,0.15,0.07), 0.8),
	mat("darkBush", vec3(0.05,0.15,0.07) * 0.5, bushRoughness),
	mat("leafyDarkBush", vec3(0.05,0.15,0.07) * 0.5, bushRoughness),
	mat("darkBushDecal", vec3(0.05,0.15,0.07) * 0.5, bushRoughness),
	--mat("leafyBushAspen", vec3(0.4,0.3,0.1), bushRoughness),
	--mat("bushAspen", vec3(0.4,0.3,0.1), bushRoughness),
	mat("palmLeaves", vec3(0.25,0.3,0.15), bushRoughness),
	mat("grass", vec3(0.15,0.25,0.06) * 0.5, grassRoughness),
	mat("dirt", vec3(0.29,0.23,0.18), 1.0),
	mat("clay", vec3(0.62,0.47,0.32), 1.0),
	mat("clayWet", vec3(0.62,0.47,0.32) * 0.3, 0.1),
	mat("terracotta", vec3(0.45,0.28,0.22), 0.4),
	mat("terracottaDark", vec3(0.45,0.24,0.22) * 0.6, 0.1),
	mat("richDirt", vec3(0.2,0.16,0.12) * 0.7, 0.9),
	mat("poorDirt", vec3(0.33,0.27,0.19), 0.9),
	mat("hay", vec3(0.35,0.31,0.28) * 1.2, 1.0),
	mat("thatch", thatchBaseColor, 1.0),
	mat("thatchDecal", thatchBaseColor * 1.2, 1.0),
	mat("thatchDecalShort", thatchBaseColor * 1.2, 1.0),
	mat("thatchDecalLonger", thatchBaseColor * 1.2, 1.0),
	mat("thatchDecalLongerLonger", thatchBaseColor * 1.2, 1.0),
	mat("thatchEdgeDecal", thatchBaseColor * 1.2, 1.0),
	
	mat("hayNoDecal", vec3(0.35,0.31,0.28) * 1.2, 1.0),
	mat("haySmaller", vec3(0.35,0.31,0.28) * 1.2, 1.0),
	mat("hayRotten", vec3(0.35,0.31,0.28) * 0.5, 1.0),
	mat("greenHay", vec3(0.12,0.16,0.07) * 2.0, 1.0),
	mat("greenHayNoDecal", vec3(0.12,0.16,0.07) * 2.0, 1.0),
	mat("cactus", vec3(0.25,0.3,0.25), 0.6),
	mat("sand", vec3(0.45, 0.4, 0.35) * 0.7, 0.7),
	mat("gravel", vec3(0.2, 0.2, 0.2), 0.9),
	mat("riverSand", vec3(0.37, 0.36, 0.35) * 0.7, 0.9),
	mat("redSand", redSandColor, 0.9),
	mat("desertRedSand", redSandColor + vec3(0.0,0.1,0.1), 0.9),
	mat("rock", vec3(0.22,0.23,0.25), 0.8),
	mat("limestone", vec3(0.41,0.4,0.37) * 1.1, 1.0),
	mat("snow", vec3(1.0,1.0,1.0) * 0.7, 0.5),
	mat("water", vec3(0.0, 0.04, 0.01), 0.0),
	mat("wood", vec3(0.4,0.32,0.25) * 0.6, 0.9),
	mat("willowWood", vec3(0.4,0.4,0.27) * 0.6, 0.9),
	mat("lightWood", vec3(0.3,0.25,0.2) * 1.2, 0.9),
	mat("rottenWood", vec3(0.12,0.14,0.18) * 0.5, 0.9),
	
	mat("mortar", vec3(0.41,0.4,0.37) * 1.1, 1.0),

	mat("mudBrickWet_sand", vec3(0.45, 0.4, 0.35) * 0.5, 0.3),
	mat("mudBrickWet_riverSand", vec3(0.37, 0.36, 0.35) * 0.5, 0.3),
	mat("mudBrickWet_redSand", redSandColor * 0.5, 0.3),
	mat("mudBrickWet_hay", vec3(0.35,0.31,0.28) * 0.7, 0.3),
	mat("mudBrickWet_limewashed", vec3(0.75,0.75,0.75) * 0.7, 0.3),

	mat("mudBrickDry_sand", vec3(0.45, 0.4, 0.35), 1.0),
	mat("mudBrickDry_riverSand", vec3(0.37, 0.36, 0.35), 1.0),
	mat("mudBrickDry_redSand", redSandColor, 1.0),
	mat("mudBrickDry_hay", vec3(0.49,0.43,0.39), 1.0),
	mat("mudBrickDry_limewashed", vec3(0.85,0.85,0.85), 1.0),

	
	mat("firedBrick_sand", vec3(0.45,0.28,0.22), 0.4),
	mat("firedBrick_riverSand", vec3(0.33,0.23,0.24), 0.4),
	mat("firedBrick_redSand", redSandColor, 0.4),
	mat("firedBrick_hay", vec3(0.47,0.30,0.18), 0.4),
	
	mat("firedBrickDark_sand", vec3(0.45,0.28,0.22) * 0.6, 0.1),
	mat("firedBrickDark_riverSand", vec3(0.33,0.23,0.24) * 0.6, 0.1),
	mat("firedBrickDark_redSand", redSandColor * 0.6, 0.1),
	mat("firedBrickDark_hay", vec3(0.47,0.30,0.18) * 0.6, 0.1),

	mat("snowGrass", vec3(1.0,1.0,1.0) * 0.7, 0.5),
	mat("grassSnowTerrain", vec3(1.0,1.0,1.0) * 0.7, 0.5),

	mat("dirtTop", vec3(0.3,0.23,0.18) * 1.04, 0.9),

	mat("steppeGrass", mediterrainianGrassBaseColor, grassRoughness),

	mat("tropicalRainforestGrass", 			vec3(0.05,0.19,0.03) * 										grassLightness * 0.8, grassRoughness),
	mat("tropicalRainforestGrassTops", 		(vec3(0.05,0.19,0.03) + vec3(0.16, 0.12, 0.1) * 0.4) * 		grassLightness * 0.8, grassRoughness),
	mat("tropicalRainforestTallGrassTops", 	(vec3(0.0,0.13,0.0)) 								, grassRoughness * 0.9),
	mat("tropicalRainforestGrassRich", 		vec3(0.05,0.19,0.03) * 										grassLightness * 0.7, grassRoughness),
	mat("tropicalRainforestGrassRichTops", 	(vec3(0.05,0.19,0.03) + vec3(0.16, 0.12, 0.1) * 0.4) * 		grassLightness * 0.7, grassRoughness),
	mat("tropicalHardGrass", 	(vec3(0.14,0.0,0.07)) 								, grassRoughness * 0.6),

	

	mat("savannaGrass", vec3(mediterrainianGrassBaseColor.x * 0.6, mediterrainianGrassBaseColor.y * 0.85, mediterrainianGrassBaseColor.z * 0.55), grassRoughness),
	mat("tundraGrass", tundraGrassBaseColor, grassRoughness),

	--mat("desertRedSand", vec3(0.75, 0.5, 0.35), 0.7),
	mat("taigaGrass", vec3(0.18,0.19,0.1), grassRoughness),

	mat("mediterraneanGrass", mediterrainianGrassBaseColor, grassRoughnessDry),
	mat("mediterraneanGrassTops", (mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1)), grassTopsRoughnessDry),
	mat("mediterraneanGrassTopsB", (mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1)) * 1.1, grassTopsRoughnessDryB),
	mat("mediterraneanDarkGrassTops", (vec3(0.24, 0.22, 0.2) * 0.5), grassTopsRoughnessDryB),
	mat("mediterraneanGrassSeedHeads", (vec3(0.46, 0.43, 0.36)), grassTopsRoughnessDryB),

	mat("mediterraneanGrassPlentiful", vec3(mediterrainianGrassBaseColor.x * 0.8, mediterrainianGrassBaseColor.y * 0.9, mediterrainianGrassBaseColor.z * 0.75), grassRoughnessDry),
	mat("mediterraneanGrassTopsPlentiful", (vec3(mediterrainianGrassBaseColor.x * 0.8, mediterrainianGrassBaseColor.y * 0.9, mediterrainianGrassBaseColor.z * 0.75) + vec3(0.16, 0.12, 0.1)), grassTopsRoughnessDry),
	

	
	mat("yellowGrassTops", vec3(0.17,0.15,0.08), grassTopsRoughness),
	mat("darkGrassTops", vec3(0.17,0.15,0.02), grassTopsRoughness),
	mat("dryGrass", vec3(0.4,0.45,0.25), grassRoughness),
	mat("dirtGrass", vec3(0.29,0.23,0.18) * 1.4, grassTopsRoughness),
	mat("redRock", vec3(0.35,0.15,0.1) * 0.3, 0.9),
	mat("greenRock", vec3(0.1,0.3,0.12) * 0.2, 0.4),
	mat("steppeGrassTops", (mediterrainianGrassBaseColor + vec3(0.01,0.0,0.0)) * 1.1, grassTopsRoughness),
	mat("steppeGrassTopsB", (mediterrainianGrassBaseColor + vec3(0.01,0.02,0.0)), grassTopsRoughness),
	
	mat("temperateGrass", vec3(0.12,0.17,0.07) * grassLightness * 1.2, grassRoughness),
	mat("temperateGrassTops", vec3(0.12  + 0.02,0.17 + 0.015,0.07 + 0.01) * grassLightness * 1.3, grassTopsRoughness),
	mat("temperateGrassTopsB", vec3(0.12  + 0.02,0.17 + 0.015,0.07 + 0.01) * grassLightness * 1.6, grassTopsRoughnessB),

	mat("temperateGrassRich", vec3(0.08,0.15,0.05) * grassLightness * 1.2, grassRoughness),
	mat("temperateGrassRichTops", vec3(0.08 + 0.01,0.15  + 0.01,0.05) * grassLightness * 1.25, grassTopsRoughness),
	mat("temperateGrassRichTopsB", vec3(0.08 + 0.01,0.15 + 0.01,0.05) * grassLightness * 1.3, grassTopsRoughnessB),

	mat("temperateGrassWinter", winterGrassColor * grassLightness * 1.0, grassRoughness),
	mat("temperateGrassWinterTops", winterGrassColor * grassLightness * 1.1, grassTopsRoughness),
	mat("temperateGrassWinterTopsB", winterGrassColor * grassLightness * 1.2, grassTopsRoughness),

	--mat("skin", vec3(0.5, 0.38, 0.32), 0.5),
	mat("skinLightest", vec3(0.4, 0.3, 0.25) * 1.2, 0.8),
	mat("skinLighter", vec3(0.4, 0.3, 0.25) * 1.1, 0.8),
	mat("skinLight", vec3(0.4, 0.3, 0.25) * 1.0, 0.8),
	mat("skin", vec3(0.4, 0.3, 0.25) * 0.9, 0.8),
	mat("skinDark", vec3(0.4, 0.3, 0.25) * 0.8, 0.8),
	mat("skinDarker", vec3(0.4, 0.285, 0.21) * 0.6, 0.8),
	mat("skinDarkest", vec3(0.4, 0.271, 0.19) * 0.4, 0.8),
	--mat("skin", vec3(0.3, 0.4, 0.8), 1.0),
	mat("hair", vec3(0.1, 0.05, 0.03), 0.8),
	mat("hairDarker", vec3(0.1, 0.05, 0.03) * 0.5, 0.8),
	mat("hairDarkest", vec3(0.0, 0.0, 0.0), 0.8),
	mat("hairRed", vec3(0.2, 0.12, 0.05), 0.8),
	mat("hairBlond", vec3(0.3, 0.25, 0.2), 0.8),

	mat("greyHair", vec3(0.4, 0.4, 0.4), 1.0),
	mat("eyes", vec3(0.6, 0.6, 0.6), 0.03),
	mat("pupil", vec3(0.0, 0.0, 0.0), 0.03),

	
	mat("eyeBall", vec3(0.08, 0.2, 0.15), 0.03),
	mat("eyeBallLightBrown", vec3(0.15, 0.15, 0.05), 0.03),
	mat("eyeBallDarkBrown", vec3(0.1, 0.08, 0.0), 0.03),
	mat("eyeBallBlue", vec3(0.15, 0.2, 0.3) * 1.5, 0.03),
	mat("eyeBallBlack", vec3(0.0, 0.0, 0.0), 0.1),
	mat("mouthLighter", vec3(0.35, 0.21, 0.2) * 1.4, 0.7),
	mat("mouth", vec3(0.35, 0.21, 0.2), 0.7),
	mat("mouthDarker", vec3(0.3, 0.15, 0.18) * 0.5, 0.7),

	mat("raspberryBush", vec3(0.1,0.2,0.08), bushRoughness),
	mat("raspberryBush_low", vec3(0.1,0.2,0.08), bushRoughness),

	mat("shrub", vec3(0.05,0.15,0.07), bushRoughness),
	mat("shrub_low", vec3(0.05,0.15,0.07), bushRoughness),
	mat("orangeTreeFoliageNoBush", vec3(0.05,0.15,0.07), bushRoughness),
	mat("orangeTreeFoliage", vec3(0.05,0.15,0.07), bushRoughness),
	mat("oliveTreeFoliageNoBush", vec3(0.518,0.573,0.427), bushRoughness),
	mat("oliveTreeFoliage", vec3(0.518,0.573,0.427), bushRoughness),
	mat("raspberry", vec3(0.4,0.1,0.1), 0.8),
	mat("raspberryRotten", vec3(0.4,0.1,0.1) * 0.2, 0.8),
	mat("gooseberry", vec3(0.3,0.4,0.3), 0.3),
	mat("gooseberryRotten", vec3(0.3,0.4,0.3) * 0.2, 0.3),
	mat("yellowFlower", vec3(1.0,0.7,0.0), 0.3),
	mat("whiteFlower", vec3(0.9,0.9,0.8), 0.3),
	mat("blueFlower", vec3(0.5,0.4,0.8) * 0.6, 0.3),
	mat("blueFlowerB", vec3(0.8,0.5,0.6) * 0.6, 0.3),
	mat("blueFlowerC", vec3(0.8,0.6,0.7) * 0.6, 0.3),
	mat("lightOrangeFlower", vec3(0.8,0.25,0.1), 0.7),
	mat("seed", vec3(0.1,0.08,0.06), 0.8),
	mat("seedRotten", vec3(0.4,0.4,0.4), 0.8),
	mat("flaxSeed", vec3(0.28,0.16,0.06), 0.3),
	mat("yellowSeed", vec3(0.6,0.4,0.06), 0.8),
	mat("redFlower", vec3(0.5,0.0,0.0), 0.8),
	mat("beetroot", vec3(0.3,0.0,0.1), 0.6),
	mat("beetrootRotten", vec3(0.3,0.2,0.1) * 0.5, 0.6),
	mat("beetleaf", vec3(0.2,0.33,0.1), 0.8),
	mat("beetrootCooked", vec3(0.3,0.0,0.1) * 0.2, 0.6),
	
	mat("wheatLeaf", mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1), grassTopsRoughnessDry),
	mat("wheatLeafSapling", vec3(0.08 + 0.01,0.15  + 0.01,0.05) * grassLightness * 1.25, 0.6),

	mat("wheatFlower", mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1), grassTopsRoughnessDry),
	mat("wheatFlowerDecal", mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1), grassTopsRoughnessDry),
	mat("wheatGrain", mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1), grassTopsRoughnessDry),
	mat("wheatGrainRotten", vec3(0.3,0.3,0.3), grassTopsRoughnessDry),
	mat("wheatRotten", (mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1)) * 0.3, grassTopsRoughnessDry),
	
	mat("flaxLeaf", vec3(0.12,0.19,0.07) * grassLightness * 0.7, grassTopsRoughnessDry),
	mat("flaxLeafSapling", vec3(0.12,0.19,0.07) * grassLightness * 0.7, 0.6),

	mat("flaxFlower", vec3(0.12,0.19,0.07) * grassLightness * 0.7, grassTopsRoughnessDry),
	mat("flaxRotten", (vec3(0.12,0.19,0.07) * grassLightness * 0.7) * 0.3, grassTopsRoughnessDry),

	mat("flour",vec3(0.65,0.65,0.6), 1.0),
	mat("flourRotten",vec3(0.1,0.2,0.1), 1.0),
	mat("breadDough",vec3(0.65,0.65,0.6), 1.0),
	mat("breadDoughRotten",vec3(0.5,0.5,0.5), 1.0),
	mat("bread",vec3(0.7,0.55,0.3) * 1.0, 1.0),
	mat("darkBread",vec3(0.7,0.55,0.1) * 0.4, 1.0),
	mat("rottenBread", vec3(0.5,0.5,0.5), 1.0),
	mat("darkRottenBread", vec3(0.05,0.3,0.05), 1.0),
	

	mat("lightRed", vec3(1.0,0.5,0.5), 0.8),
	mat("red", vec3(1.0,0.0,0.0), 0.8),
	mat("darkRed", vec3(0.5,0.0,0.0), 0.8),
	
	mat("lightGreen", vec3(0.5,1.0,0.5), 0.8),
	mat("green", vec3(0.0,1.0,0.0), 0.8),
	mat("darkGreen", vec3(0.0,0.5,0.0), 0.8),

	mat("lightBlue", vec3(0.5,0.5,1.0), 0.8),
	mat("blue", vec3(0.0,0.0,1.0), 0.8),
	mat("darkBlue", vec3(0.0,0.0,0.5), 0.8),
	
	mat("paleGrey", vec3(0.5,0.5,0.5), 1.0),
	mat("paleBlue", vec3(0.3,0.3,0.7), 1.0),
	mat("paleGreen", vec3(0.3,0.7,0.3), 1.0),
	mat("paleYellow", vec3(0.7,0.7,0.3), 1.0),
	mat("paleMagenta", vec3(0.7,0.3,0.7), 1.0),

	mat("vrObjects", vec3(0.05,0.05,0.05), 0.6),
	

	mat("building", vec3(0.5,0.5,0.5), 1.0),
	mat("matBlack", vec3(0.0,0.0,0.0), 1.0),

	mat("apple", vec3(0.5,0.0,0.0), 0.1),
	mat("appleRotten", vec3(0.1,0.0,0.0), 0.6),
	mat("orange", vec3(0.5,0.2,0.0), 0.5),
	mat("orangeRotten", vec3(0.5,0.2,0.0) * 0.2, 0.5),
	mat("peach", vec3(0.5,0.3,0.2), 0.9),
	mat("peachRotten", vec3(0.5,0.3,0.2) * 0.2, 0.9),
	mat("olive", vec3(0.298,0.161,0.161), 0.1),
	mat("oliveRotten", vec3(0.847,0.784,0.627) * 0.2, 0.1),
	mat("banana", vec3(0.5,0.4,0.0), 0.6),
	mat("bananaRotten", vec3(0.1,0.08,0.0), 0.6),
	
	mat("coconut", vec3(0.24, 0.15, 0.1) * 0.5, 1.0),
	mat("coconutRotten", vec3(0.1, 0.1, 0.1) * 1.0, 1.0),
	mat("coconutLeafNoBush", vec3(0.25,0.37,0.15) * 0.5, bushRoughness),
	mat("coconutLeaf", vec3(0.25,0.37,0.15) * 0.5, bushRoughness),
	mat("coconutLeafSmall", vec3(0.25,0.37,0.15) * 0.5, bushRoughness),
	mat("coconutBark", vec3(0.17, 0.16, 0.17) * 1.0, 1.0),
	mat("coconutWood", vec3(0.28, 0.2, 0.05) * 0.4, 0.8),
	
	mat("pumpkin", vec3(0.48, 0.2, 0.05), 0.5),
	mat("pumpkinRotten", vec3(0.48, 0.4, 0.05) * 0.2, 0.8),
	mat("pumpkinLeaf", vec3(0.1,0.2,0.05), 0.6),
	mat("pumpkinCooked", vec3(0.48, 0.2, 0.05) * 0.2, 0.5),
	
	mat("appleBark", vec3(0.22,0.2,0.16) * 0.2, 1.0),
	mat("appleWood", vec3(0.22,0.25,0.16), 0.5),
	mat("orangeBark", vec3(0.28,0.2,0.12) * 0.4, 1.0),
	mat("orangeWood", vec3(0.32,0.24,0.02), 0.5),
	mat("peachBark", vec3(0.34,0.2,0.12) * 0.6, 1.0),
	mat("peachWood", vec3(0.34,0.14,0.06) * 1.5, 0.5),
	mat("oliveBark", vec3(0.502,0.482,0.427) * 0.4, 1.0),
	mat("oliveWood", vec3(0.698,0.396,0.216), 0.5),

	mat("mammoth", mammothColor, 1.0),
	mat("mammothFur1", mammothColor, 1.0),
	mat("mammothEyeArea", mammothColor * 0.2, 1.0),
	mat("mammothEye", vec3(0.2, 0.15, 0.05), 0.1),
	mat("mammothHide", mammothColor, 1.0),
	mat("tusk", vec3(0.8, 0.8, 0.8), 0.1),
	
	mat("alpaca", vec3(0.1, 0.09, 0.08) * 1.1, 1.0),
	mat("alpacaWool", vec3(0.1, 0.09, 0.08) * 1.1, 1.0),
	mat("alpacaWoolNoDecal", vec3(0.1, 0.09, 0.08) * 1.1, 1.0),

	
	mat("clothes", vec3(0.1, 0.09, 0.08), 1.0),
	mat("clothingFur", vec3(0.1, 0.09, 0.08), 1.0),
	mat("clothingFurShort", vec3(0.1, 0.09, 0.08), 1.0),
	mat("clothesNoDecal", vec3(0.1, 0.09, 0.08), 1.0),
	
	mat("clothesMammoth", mammothColor, 1.0),
	mat("clothingMammothFur", mammothColor, 1.0),
	mat("clothingMammothFurShort", mammothColor, 1.0),
	mat("clothesMammothNoDecal", mammothColor, 1.0),

	mat("chickenBody", vec3(0.7, 0.7, 0.7), 0.8),
	mat("chickenLeg", vec3(0.6, 0.4, 0.1), 0.8),
	mat("chickenCrest", vec3(0.8, 0.1, 0.1), 0.8),

	mat("redMeat", vec3(0.4, 0.12, 0.1), 0.4),
	mat("redMeatCooked", vec3(0.1, 0.03, 0.01), 0.8),
	
	mat("rottenMeat", vec3(0.1, 0.12, 0.01), 0.8),

	mat("leafy", vec3(0.25,0.33,0.15) * 1.1, 0.5),

	mat("warning", orangeColor, 0.8),
	mat("warning_selected", orangeHighlightColor, 0.8),
	mat("ok", greenColor, 0.8),
	mat("ok_selected", greenHighlightColor, 0.8),
	mat("neutral", blueColor, 0.8),
	mat("neutral_selected", blueHighlightColor, 0.8),

	mat("ui_background_dark", vec3(0.01,0.01,0.01), uiRoughness),
	mat("ui_background", vec3(0.05,0.05,0.05), uiRoughness),
	mat("ui_background_button", vec3(0.07,0.07,0.07), uiRoughness),
	--mat("ui_background_inset", vec3(0.2,0.2,0.2), uiRoughness),
	mat("ui_background_inset", vec3(0.1,0.1,0.1), uiRoughness),
	mat("ui_background_green", vec3(0.05,0.1,0.05), uiRoughness),
	mat("ui_background_red", vec3(0.1,0.05,0.05), uiRoughness),
	mat("ui_background_blue", blueColor * 0.2, uiRoughness),
	mat("ui_standard", whiteColor, uiRoughness),
	mat("ui_standardDarker", whiteColor * 0.6, uiRoughness),
	mat("ui_disabled", vec3(0.15,0.15,0.15), uiRoughness),
	mat("ui_disabled_green", vec3(0.075,0.15,0.075), uiRoughness),
	mat("ui_disabled_red", vec3(0.15,0.075,0.075), uiRoughness),
	mat("ui_disabled_blue", blueColor * 0.3, uiRoughness),
	mat("ui_disabled_yellow", vec3(0.4,0.4,0.15), uiRoughness),
	
	mat("ui_background_warning", vec3(0.8,0.55,0.0) * 0.2, 0.8),
	mat("ui_background_warning_disabled", vec3(0.8,0.55,0.0) * 0.1 + vec3(0.01,0.01,0.01), 0.8),
	
	
	mat("ui_selected", blueColor, uiRoughness),
	mat("ui_green", greenColor, uiRoughness),
	mat("ui_red", redColor, uiRoughness),
	mat("ui_yellow", yellowColor, uiRoughness),
	
	mat("ui_sun", vec3(0.9,0.8,0.1), uiRoughness),
	mat("ui_sky", vec3(0.3, 0.4, 0.5), uiRoughness),
	mat("ui_moon", vec3(0.3, 0.4, 0.5), uiRoughness),

	
	mat("ui_greenBright", greenColorBright, uiRoughness),
	mat("ui_redBright", redColorBright, uiRoughness),
	mat("ui_yellowBright", yellowColorBright, uiRoughness),

	mat("ui_blueDark", blueColorDark, uiRoughness),
	mat("ui_greenDark", greenColorDark, uiRoughness),
	mat("ui_redDark", redColorDark, uiRoughness),
	
	mat("digUIMarker", whiteColor, 0.9),

	mat("logoColor", vec3(0.65,0.3,0.05), uiRoughness),
	mat("standardText", whiteColor, uiRoughness),
	mat("disabledText", vec3(0.25,0.25,0.25), uiRoughness),
	mat("selectedText", blueColor, uiRoughness),

	mat("whiteMeat", vec3(0.5, 0.4, 0.4), 0.7),
	mat("bone", vec3(0.65, 0.6, 0.6), 1.0),
	
	mat("whiteMeatCooked", vec3(0.4, 0.24, 0.1), 0.5),
	mat("boneCooked", vec3(0.45, 0.35, 0.3), 0.8),

	
	mat("boneCooked", vec3(0.45, 0.35, 0.3), 0.8),

	mat("charcoal", vec3(0.1, 0.1, 0.1), 0.8),
	mat("ash", vec3(0.3, 0.3, 0.3), 0.9),
	mat("burntHay", vec3(0.1, 0.1, 0.1), 0.8),

	mat("flint", vec3(0.1,0.09,0.08), 0.4),

	
	mat("mood_severeNegative", getMoodColor(moodColors.severeNegative), 0.9),
	mat("mood_moderateNegative", getMoodColor(moodColors.moderateNegative), 0.9),
	mat("mood_mildNegative", getMoodColor(moodColors.mildNegative), 0.9),
	mat("mood_mildPositive", getMoodColor(moodColors.mildPositive), 0.9),
	mat("mood_moderatePositive", getMoodColor(moodColors.moderatePositive), 0.9),
	mat("mood_severePositive", getMoodColor(moodColors.severePositive), 0.9),

	
	mat("mood_uiBackground_severeNegative", 	getMoodBackgroundColor(moodColors.severeNegative), uiRoughness),
	mat("mood_uiBackground_moderateNegative", 	getMoodBackgroundColor(moodColors.moderateNegative), uiRoughness),
	mat("mood_uiBackground_mildNegative", 		getMoodBackgroundColor(moodColors.mildNegative), uiRoughness),
	mat("mood_uiBackground_mildPositive", 		getMoodBackgroundColor(moodColors.mildPositive), uiRoughness),
	mat("mood_uiBackground_moderatePositive", 	getMoodBackgroundColor(moodColors.moderatePositive), uiRoughness),
	mat("mood_uiBackground_severePositive", 	getMoodBackgroundColor(moodColors.severePositive), uiRoughness),

	--mat("ui_selected", vec3(0.3,0.65,0.75), 0.5,1.0), --nice blue
}



local function cloneMaterial(baseMatType, newName)
	local matCopy = mj:cloneTable(baseMatType)
	matCopy.key = newName
	mj:insertIndexed(material.types, matCopy)
end


local function setMaterialB(baseTypeKey, color, roughness, metalOrNil)
	material.types[baseTypeKey].colorB = color
	material.types[baseTypeKey].roughnessB = roughness
	material.types[baseTypeKey].metalB = metalOrNil or 0.0
end

setMaterialB("sand", material.types.sand.color * 1.2, material.types.sand.roughness * 0.8)
setMaterialB("desertRedSand", material.types.desertRedSand.color * 1.2, material.types.desertRedSand.roughness * 0.8)
setMaterialB("redSand", material.types.redSand.color * 1.2, material.types.redSand.roughness * 0.8)
setMaterialB("dirt", material.types.dirt.color * 1.4, material.types.dirt.roughness * 0.8)
setMaterialB("clay", material.types.clay.color * 1.1, material.types.clay.roughness * 0.9)
setMaterialB("richDirt", material.types.richDirt.color * 1.4, material.types.richDirt.roughness * 0.6)
setMaterialB("poorDirt", material.types.poorDirt.color * 1.4, material.types.poorDirt.roughness * 0.6)
setMaterialB("rock", material.types.rock.color * 1.1, material.types.rock.roughness * 0.6)
setMaterialB("redRock", material.types.redRock.color * 1.5, material.types.redRock.roughness * 0.8)
setMaterialB("greenRock", material.types.greenRock.color * 0.3, material.types.greenRock.roughness * 0.2)
setMaterialB("limestone", material.types.limestone.color * 1.5, material.types.limestone.roughness * 0.8)
setMaterialB("gravel", vec3(0.33, 0.3, 0.25), 0.6)
setMaterialB("riverSand", vec3(0.37, 0.36, 0.35) * 0.6, 0.6)
--setMaterialB("redSand", vec3(0.37, 0.36, 0.35) * 0.6, 0.6)
setMaterialB("temperateGrassRich", material.types.temperateGrassRich.color * 0.8, material.types.temperateGrassRich.roughness)
setMaterialB("temperateGrassWinter", material.types.temperateGrassWinter.color * 0.8, material.types.temperateGrassWinter.roughness)

setMaterialB("grassSnowTerrain", material.types.temperateGrassWinter.color * 0.4 + material.types.snow.color * 0.6, material.types.temperateGrassWinter.roughness * 0.4 + material.types.snow.roughness * 0.6)

setMaterialB("haySmaller", material.types.haySmaller.color, material.types.haySmaller.roughness * 0.6)
setMaterialB("hay", material.types.hay.color, material.types.hay.roughness * 0.6)
setMaterialB("thatch", thatchBaseColor * 1.2 + vec3(0.05,0.05,0.05), material.types.thatch.roughness * 0.95)
setMaterialB("thatchDecal", thatchBaseColor * 1.4 + vec3(0.05,0.05,0.05), material.types.thatch.roughness * 0.95)
setMaterialB("thatchDecalShort", thatchBaseColor * 1.4 + vec3(0.05,0.05,0.05), material.types.thatch.roughness * 0.95)
setMaterialB("thatchDecalLonger", thatchBaseColor * 1.4 + vec3(0.05,0.05,0.05), material.types.thatch.roughness * 0.95)
setMaterialB("thatchDecalLongerLonger", thatchBaseColor * 1.4 + vec3(0.05,0.05,0.05), material.types.thatch.roughness * 0.95)
setMaterialB("thatchEdgeDecal", thatchBaseColor * 1.4 + vec3(0.05,0.05,0.05), material.types.thatch.roughness * 0.95)
setMaterialB("hayNoDecal", material.types.hay.color, material.types.hay.roughness * 0.6)
--material.types.hay.color = material.types.hay.color * 0.8

setMaterialB("wheatGrainRotten", material.types.darkRottenBread.color, 1.0)
setMaterialB("flourRotten", vec3(0.7,0.7,0.7), 1.0)

setMaterialB("mammoth", mammothColor * 1.02, 1.0)
setMaterialB("mammothFur1", mammothColor * 1.5, 1.0)
setMaterialB("clothingFur", vec3(0.1, 0.09, 0.08) * 1.1, 1.0)
setMaterialB("clothingFurShort", vec3(0.1, 0.09, 0.08) * 1.1, 1.0)
setMaterialB("clothingMammothFur", mammothColor * 1.1, 1.0)
setMaterialB("clothingMammothFurShort", mammothColor * 1.1, 1.0)

setMaterialB("bread", material.types.darkBread.color, 1.0)
setMaterialB("rottenBread", material.types.darkRottenBread.color, 1.0)
setMaterialB("breadDoughRotten", material.types.darkRottenBread.color, 1.0)

setMaterialB("terracotta", material.types.terracottaDark.color, 0.8)
setMaterialB("terracottaDark", material.types.terracottaDark.color * 0.3, 0.2)

setMaterialB("firedBrick_sand", material.types.firedBrickDark_sand.color, 0.8)
setMaterialB("firedBrick_riverSand", material.types.firedBrickDark_riverSand.color, 0.8)
setMaterialB("firedBrick_redSand", material.types.firedBrickDark_redSand.color, 0.8)
setMaterialB("firedBrick_hay", material.types.firedBrickDark_hay.color, 0.8)

local function setBushMaterialB(baseKey)
	setMaterialB(baseKey, material.types[baseKey].color * 1.1, material.types[baseKey].roughness * 0.8)
end

setBushMaterialB("bushDecal")
setBushMaterialB("darkBushDecal")
setBushMaterialB("leafy")

setBushMaterialB("leafyBushA")
setBushMaterialB("leafyBushASpring")
setBushMaterialB("leafyBushMid")
setBushMaterialB("leafyBushMidSpring")
setBushMaterialB("leafyBushOlive")
setBushMaterialB("leafyBushOliveWinter")
setBushMaterialB("leafyBushSmall")
setBushMaterialB("leafyBushSmallSpring")
setBushMaterialB("leafyBushB")
setBushMaterialB("leafyBushBSpring")
setBushMaterialB("leafyBushC")
setBushMaterialB("leafyBushCSpring")
setBushMaterialB("leafyPine")
setBushMaterialB("leafyPineSmall")
setBushMaterialB("leafyBushAspen")
setBushMaterialB("leafyBushAspenSpring")
setBushMaterialB("leafyBushAspenSmall")
setBushMaterialB("leafyBushAspenSmallSpring")
setBushMaterialB("raspberryBush")
setBushMaterialB("shrub")
setBushMaterialB("orangeTreeFoliageNoBush")
setBushMaterialB("orangeTreeFoliage")
setBushMaterialB("oliveTreeFoliageNoBush")
setBushMaterialB("oliveTreeFoliage")
setBushMaterialB("wheatFlower")
setBushMaterialB("wheatFlowerDecal")
setBushMaterialB("bananaLeafNoBush")
setBushMaterialB("bananaLeaf")
setBushMaterialB("flaxFlower")
setBushMaterialB("bambooLeafNoBush")
setBushMaterialB("bambooLeaf")
setBushMaterialB("bambooLeafSmall")
setBushMaterialB("coconutLeafNoBush")
setBushMaterialB("coconutLeaf")
setBushMaterialB("coconutLeafSmall")

setMaterialB("flaxFlower", vec3(0.1,0.05,0.5), 0.5)


local leavesADecal = edgeDecal.groupTypes.leavesA
local leavesSmallerDecal = edgeDecal.groupTypes.leavesSmaller
local leavesBiggerDecal = edgeDecal.groupTypes.leavesBigger

for i=1,16 do
	local name = "autumn" .. i
	local leafyName = name .. "Leaf"
	local matCopy = mj:cloneTable(material.types[name])
	matCopy.key = leafyName
	matCopy.edgeDecal = leavesADecal
	mj:insertIndexed(material.types, matCopy)
	setMaterialB(leafyName, vec3(matCopy.color.x * 1.1, matCopy.color.y * 1.05, matCopy.color.z), 0.6)
end

for i=1,16 do
	local name = "autumn" .. i
	local leafyName = name .. "Small"
	local matCopy = mj:cloneTable(material.types[name])
	matCopy.key = leafyName
	matCopy.edgeDecal = leavesSmallerDecal
	mj:insertIndexed(material.types, matCopy)
	setMaterialB(leafyName, vec3(matCopy.color.x * 1.1, matCopy.color.y * 1.05, matCopy.color.z), 0.6)
end

for i=1,2 do
	local name = "winter" .. i
	local leafyName = name .. "Leaf"
	local matCopy = mj:cloneTable(material.types[name])
	matCopy.key = leafyName
	matCopy.edgeDecal = leavesADecal
	mj:insertIndexed(material.types, matCopy)
end

for i=1,2 do
	local name = "winter" .. i
	local leafyName = name .. "Small"
	local matCopy = mj:cloneTable(material.types[name])
	matCopy.key = leafyName
	matCopy.edgeDecal = leavesSmallerDecal
	mj:insertIndexed(material.types, matCopy)
end

material.types.bushDecal.decal = {
	--matB = material.types.bushShiny.index
	true
}
material.types.darkBushDecal.decal = {
	true
	--matB = material.types.darkBushShiny.index
}
material.types.leafy.decal = {
	true
	--matB = material.types.darkBushShiny.index
}
material.types.wheatFlowerDecal.decal = {
	true
	--matB = material.types.darkBushShiny.index
}

material.types.leafyBushA.edgeDecal = leavesADecal
material.types.leafyBushASpring.edgeDecal = leavesADecal

material.types.bananaLeaf.edgeDecal = edgeDecal.groupTypes.bananaLeaf
material.types.coconutLeaf.edgeDecal = edgeDecal.groupTypes.bananaLeaf
material.types.coconutLeafSmall.edgeDecal = edgeDecal.groupTypes.bananaLeafSmall

material.types.bananaBark.edgeDecal = edgeDecal.groupTypes.bananaBark

material.types.leafyBushMid.edgeDecal = leavesADecal
material.types.leafyBushMidSpring.edgeDecal = leavesADecal

material.types.leafyBushOlive.edgeDecal = leavesADecal
material.types.leafyBushOliveWinter.edgeDecal = leavesADecal

material.types.leafyBushSmall.edgeDecal = leavesSmallerDecal
material.types.leafyBushSmallSpring.edgeDecal = leavesSmallerDecal

material.types.leafyBushB.edgeDecal = leavesBiggerDecal
material.types.leafyBushBSpring.edgeDecal = leavesBiggerDecal
material.types.leafyBushC.edgeDecal = leavesBiggerDecal
material.types.leafyBushCSpring.edgeDecal = leavesBiggerDecal

material.types.leafyPine.edgeDecal = edgeDecal.groupTypes.pine
material.types.leafyPineSmall.edgeDecal = edgeDecal.groupTypes.pineSmall

material.types.thatchDecal.edgeDecal = edgeDecal.groupTypes.thatch
material.types.thatchDecalShort.edgeDecal = edgeDecal.groupTypes.thatchShort
material.types.thatchDecalLonger.edgeDecal = edgeDecal.groupTypes.thatchLonger
material.types.thatchDecalLongerLonger.edgeDecal = edgeDecal.groupTypes.thatchLongerLonger
material.types.thatchEdgeDecal.edgeDecal = edgeDecal.groupTypes.thatchEdge

material.types.leafyBushAspen.edgeDecal = leavesBiggerDecal
material.types.leafyBushAspenSpring.edgeDecal = leavesBiggerDecal
material.types.leafyBushAspenSmall.edgeDecal = leavesSmallerDecal
material.types.leafyBushAspenSmallSpring.edgeDecal = leavesSmallerDecal


material.types.bambooLeaf.edgeDecal = leavesADecal
material.types.bambooLeafSmall.edgeDecal = leavesSmallerDecal

material.types.raspberryBush.edgeDecal = leavesSmallerDecal

material.types.shrub.edgeDecal = leavesSmallerDecal
material.types.orangeTreeFoliage.edgeDecal = leavesBiggerDecal
material.types.oliveTreeFoliage.edgeDecal = leavesBiggerDecal



material.types.wheatFlower.edgeDecal = edgeDecal.groupTypes.wheatFlower
material.types.flaxFlower.edgeDecal = edgeDecal.groupTypes.flaxFlower


cloneMaterial(material.types.flaxFlower, "flaxFlowerPicked")
cloneMaterial(material.types.flaxFlower, "flaxFlowerDry")
cloneMaterial(material.types.flaxLeaf, "flaxLeafDry")

material.types.flaxFlowerPicked.color = material.types.flaxFlowerPicked.color * 0.5 + vec3(0.05,0.05,0.0)
material.types.flaxFlowerPicked.edgeDecal = edgeDecal.groupTypes.flaxFlowerPicked
material.types.flaxFlowerPicked.colorB = material.types.flaxFlowerPicked.colorB * 0.7 + vec3(0.05,0.05,0.0)

material.types.flaxFlowerPicked.color = mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1)
material.types.flaxFlowerPicked.edgeDecal = edgeDecal.groupTypes.flaxFlowerPicked
material.types.flaxFlowerPicked.colorB = mediterrainianGrassBaseColor + vec3(0.16, 0.12, 0.1)

material.types.flaxLeafDry.color = material.types.flaxLeafDry.color * 0.5 + vec3(0.15,0.12,0.1)
material.types.flaxFlowerDry.color = material.types.flaxFlowerDry.color * 0.5 + vec3(0.15,0.12,0.1)
material.types.flaxFlowerDry.colorB = material.types.flaxFlowerDry.color
material.types.flaxFlowerDry.edgeDecal = edgeDecal.groupTypes.flaxFlowerPicked

cloneMaterial(material.types.flaxLeaf, "flaxTwine")
material.types.flaxTwine.color = material.types.flaxLeafDry.color * 2.0
material.types.flaxTwine.roughness = 1.0
cloneMaterial(material.types.flaxTwine, "flaxTwineDecal")
material.types.flaxTwineDecal.edgeDecal = edgeDecal.groupTypes.flaxTwine

material.types.mammothFur1.edgeDecal = edgeDecal.groupTypes.mammothEdgeOnly
material.types.mammoth.edgeDecal = edgeDecal.groupTypes.mammoth
material.types.clothingFur.edgeDecal = edgeDecal.groupTypes.clothingFur
material.types.clothingFurShort.edgeDecal = edgeDecal.groupTypes.clothingFurShort
material.types.clothingMammothFur.edgeDecal = edgeDecal.groupTypes.clothingFur
material.types.clothingMammothFurShort.edgeDecal = edgeDecal.groupTypes.clothingFurShort
material.types.clothes.edgeDecal = edgeDecal.groupTypes.clothes
material.types.clothesMammoth.edgeDecal = edgeDecal.groupTypes.clothes

material.types.hair.edgeDecal = edgeDecal.groupTypes.hair
material.types.hairBlond.edgeDecal = edgeDecal.groupTypes.hair
material.types.hairDarker.edgeDecal = edgeDecal.groupTypes.hair
material.types.hairDarkest.edgeDecal = edgeDecal.groupTypes.hair
material.types.hairRed.edgeDecal = edgeDecal.groupTypes.hair
material.types.greyHair.edgeDecal = edgeDecal.groupTypes.hair

cloneMaterial(material.types.hair, "eyebrows")
cloneMaterial(material.types.hairBlond, "eyebrowsBlond")
cloneMaterial(material.types.hairDarker, "eyebrowsDarker")
cloneMaterial(material.types.hairDarkest, "eyebrowsDarkest")
cloneMaterial(material.types.hairRed, "eyebrowsRed")
cloneMaterial(material.types.greyHair, "eyebrowsGrey")

material.types.eyebrows.edgeDecal = edgeDecal.groupTypes.eyebrows
material.types.eyebrowsBlond.edgeDecal = edgeDecal.groupTypes.eyebrows
material.types.eyebrowsDarker.edgeDecal = edgeDecal.groupTypes.eyebrows
material.types.eyebrowsDarkest.edgeDecal = edgeDecal.groupTypes.eyebrows
material.types.eyebrowsRed.edgeDecal = edgeDecal.groupTypes.eyebrows
material.types.eyebrowsGrey.edgeDecal = edgeDecal.groupTypes.eyebrows


cloneMaterial(material.types.hair, "eyelashes")
cloneMaterial(material.types.hairBlond, "eyelashesBlond")
cloneMaterial(material.types.hairDarker, "eyelashesDarker")
cloneMaterial(material.types.hairDarkest, "eyelashesDarkest")
cloneMaterial(material.types.hairRed, "eyelashesRed")
cloneMaterial(material.types.greyHair, "eyelashesGrey")

material.types.eyelashes.color = material.types.eyelashes.color * 0.6
material.types.eyelashesBlond.color = material.types.eyelashesBlond.color * 0.6
material.types.eyelashesDarker.color = material.types.eyelashesDarker.color * 0.6
material.types.eyelashesDarkest.color = material.types.eyelashesDarkest.color * 0.6
material.types.eyelashesRed.color = material.types.eyelashesRed.color * 0.6
material.types.eyelashesGrey.color = material.types.eyelashesGrey.color * 0.6

cloneMaterial(material.types.eyelashes, "eyelashesLong")
cloneMaterial(material.types.eyelashesBlond, "eyelashesBlondLong")
cloneMaterial(material.types.eyelashesDarker, "eyelashesDarkerLong")
cloneMaterial(material.types.eyelashesDarkest, "eyelashesDarkestLong")
cloneMaterial(material.types.eyelashesRed, "eyelashesRedLong")
cloneMaterial(material.types.eyelashesGrey, "eyelashesGreyLong")


material.types.eyelashes.edgeDecal = edgeDecal.groupTypes.eyelashes
material.types.eyelashesBlond.edgeDecal = edgeDecal.groupTypes.eyelashes
material.types.eyelashesDarker.edgeDecal = edgeDecal.groupTypes.eyelashes
material.types.eyelashesDarkest.edgeDecal = edgeDecal.groupTypes.eyelashes
material.types.eyelashesRed.edgeDecal = edgeDecal.groupTypes.eyelashes
material.types.eyelashesGrey.edgeDecal = edgeDecal.groupTypes.eyelashes

material.types.eyelashesLong.edgeDecal = edgeDecal.groupTypes.eyelashesLong
material.types.eyelashesBlondLong.edgeDecal = edgeDecal.groupTypes.eyelashesLong
material.types.eyelashesDarkerLong.edgeDecal = edgeDecal.groupTypes.eyelashesLong
material.types.eyelashesDarkestLong.edgeDecal = edgeDecal.groupTypes.eyelashesLong
material.types.eyelashesRedLong.edgeDecal = edgeDecal.groupTypes.eyelashesLong
material.types.eyelashesGreyLong.edgeDecal = edgeDecal.groupTypes.eyelashesLong

material.types.hay.edgeDecal = edgeDecal.groupTypes.hay
material.types.haySmaller.edgeDecal = edgeDecal.groupTypes.haySmaller
material.types.greenHay.edgeDecal = edgeDecal.groupTypes.haySmaller
material.types.hayRotten.edgeDecal = edgeDecal.groupTypes.haySmaller

-- called by engine

function material:materialTypeForName(name)
	return material.types[name].index
end

function material:materials()
    return material.types
end


return material