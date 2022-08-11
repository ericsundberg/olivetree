local mjm = mjrequire "common/mjm"
local vec2 = mjm.vec2


local modManager = mjrequire "common/modManager"

local debugLowDetail = false

local model = { 
	clones = {}
}

local modelsWithoutVolume = {
	"grass3",
	"grass4",
	"grass5",
	"grassNew1",
}

local windStrengths = { -- vec2(main object triangles, decals)
	appleTree = vec2(0.9, 0.8),
	appleHangingFruit = vec2(0.9, 0.8),
	appleTreeSapling = vec2(0.8, 0.8),
	orangeHangingFruit = vec2(0.9, 0.8),
	orangeTree = vec2(0.9, 0.8),
	orangeTreeSapling = vec2(0.8, 0.8),
	peachHangingFruit = vec2(0.9, 0.8),
	peachTree = vec2(0.9, 0.8),
	peachTreeSapling = vec2(0.8, 0.8),
	oliveHangingFruit = vec2(0.99, 0.89),
	oliveTree = vec2(0.9, 0.8),
	oliveTreeSapling = vec2(0.8, 0.8),
	aspen1 = vec2(0.95, 0.9),
	aspen2 = vec2(0.95, 0.9),
	aspen3 = vec2(0.98, 0.95),
	aspenSapling = vec2(0.8, 0.8),
	aspenSaplingWinter = vec2(0.9, 0.9),
	birch1 = vec2(0.95,0.8),
	birch2 = vec2(0.95,0.8),
	birch3 = vec2(0.95,0.8),
	birch4 = vec2(0.95,0.8),
	birchSapling = vec2(0.8, 0.8),
	birchSaplingWinter = vec2(0.95, 0.9),
	willow1 = vec2(0.95,0.8),
	willow2 = vec2(0.95,0.8),
	willowSapling = vec2(0.8, 0.8),
	willowSaplingWinter = vec2(0.9, 0.9),
	bush2 = vec2(0.2,0.0),
	cactus = vec2(0.9,0.0),
	palm = vec2(0.9,0.0),
	pine1 = vec2(0.95,0.9),
	pine2 = vec2(0.95,0.9),
	pine3 = vec2(0.95,0.9),
	pine4 = vec2(0.95,0.9),
	pine1Snow = vec2(0.95,0.9),
	pine2Snow = vec2(0.95,0.9),
	pine3Snow = vec2(0.95,0.9),
	pine4Snow = vec2(0.95,0.9),
	pineSapling = vec2(0.8, 0.8),
	pineBig1 = vec2(0.9,0.9),
	pineBigSapling = vec2(0.9, 0.8),
	raspberryHangingFruit = vec2(0.9,0.8),
	raspberryBush = vec2(0.9,0.8),
	raspberryBushSapling = vec2(0.7,0.2),
	gooseberryHangingFruit = vec2(0.9,0.8),
	gooseberryBush = vec2(0.9,0.8),
	gooseberryBushSapling = vec2(0.7,0.2),
	shrub = vec2(0.6,0.8),
	sunflower = vec2(0.4,0.0),
	beetrootPlant = vec2(0.2,0.0),
	beetrootPlantSapling = vec2(0.1,0.0),
	wheatPlant = vec2(0.8,0.0),
	wheatPlantSapling = vec2(0.6,0.0),
	bananaHangingFruit = vec2(0.8, 0.8),
	bananaTree = vec2(0.8, 0.8),
	bananaTreeSapling = vec2(0.7, 0.8),
	flaxPlant = vec2(0.4,0.0),
	flaxPlantSapling = vec2(0.4,0.0),
	bamboo1 = vec2(0.9, 0.9),
	bamboo2 = vec2(0.8, 0.9),
	coconutTree = vec2(0.9, 0.8),
	coconutHangingFruit = vec2(0.9, 0.8),
	coconutTreeSapling = vec2(0.7, 0.8),
	aspenBig1 = vec2(0.9,0.9),
	aspenBigSapling = vec2(0.9, 0.8),
	aspenBigSaplingWinter = vec2(0.9, 0.8),
	pumpkinPlant = vec2(0.7,0.2),
	pumpkinPlantSapling = vec2(0.7,0.2),
}

model.windStrengths = windStrengths

local remapModels = {
	appleTree = {
		appleTreeAutumn = {
			leafyBushA = "autumn1Leaf",
			bush = "autumn1"
		},
		appleTreeSpring = {
			leafyBushA = "leafyBushASpring",
			bush = "bushASpring"
		},
	},
	icon_sapiens = {
		icon_sapiensWhite = {
			logoColor = "ui_standard"
		},
	},
	appleTreeSapling = {
		appleTreeSaplingAutumn = {
			leafyBushSmall = "autumn1Small",
			bush = "autumn1"
		},
		appleTreeSaplingSpring = {
			leafyBushSmall = "leafyBushSmallSpring",
			bush = "bushASpring"
		},
	},
	peachTree = {
		peachTreeAutumn = {
			leafyBushMid = "autumn4Leaf",
			bushMid = "autumn4"
		},
		peachTreeSpring = {
			leafyBushMid = "leafyBushMidSpring",
			bushMid = "bushMidSpring"
		},
	},
	peachTreeSapling = {
		peachTreeSaplingAutumn = {
			leafyBushSmall = "autumn4Small",
			bushMid = "autumn4"
		},
		peachTreeSaplingSpring = {
			leafyBushSmall = "leafyBushSmallSpring",
			bushMid = "bushMidSpring"
		},
	},
	willow1 = {
		willow1Autumn = {
			leafyBushC = "autumn2Leaf",
			bushC = "autumn2"
		},
		willow1Spring = {
			leafyBushC = "leafyBushCSpring",
			bushC = "bushCSpring"
		},
	},
	willow2 = {
		willow2Autumn = {
			leafyBushC = "autumn3Leaf",
			bushC = "autumn3"
		},
		willow2Spring = {
			leafyBushC = "leafyBushCSpring",
			bushC = "bushCSpring"
		},
	},
	birchSapling = {
		birchSaplingAutumn = {
			leafyBushSmall = "autumn5Small"
		},
		birchSaplingSpring = {
			leafyBushSmall = "leafyBushSmallSpring"
		},
	},
	aspenSapling = {
		aspenSaplingAutumn = {
			leafyBushAspenSmall = "autumn8Small"
		},
		aspenSaplingSpring = {
			leafyBushAspenSmall = "leafyBushAspenSmallSpring"
		},
	},

	dirt = {
		richDirt = {
			dirt = "richDirt"
		},
		poorDirt = {
			dirt = "poorDirt"
		},
		sand = {
			dirt = "sand"
		},
		riverSand = {
			dirt = "riverSand"
		},
		redSand = {
			dirt = "redSand"
		},
		clay = {
			dirt = "clay"
		},
	},

	pathNode_dirt_1 = {
		pathNode_richDirt_1 = {
			dirt = "richDirt"
		},
		pathNode_poorDirt_1 = {
			dirt = "poorDirt"
		},
		pathNode_sand_1 = {
			dirt = "sand"
		},
		pathNode_riverSand_1 = {
			dirt = "riverSand"
		},
		pathNode_redSand_1 = {
			dirt = "redSand"
		},
		pathNode_clay_1 = {
			dirt = "clay"
		},
	},
	pathNode_dirt_small = {
		pathNode_richDirt_small = {
			dirt = "richDirt"
		},
		pathNode_poorDirt_small = {
			dirt = "poorDirt"
		},
		pathNode_sand_small = {
			dirt = "sand"
		},
		pathNode_riverSand_small = {
			dirt = "riverSand"
		},
		pathNode_redSand_small = {
			dirt = "redSand"
		},
		pathNode_clay_small = {
			dirt = "clay"
		},
	},

	rock1 = {
		redRock = {
			rock = "redRock"
		},
		greenRock = {
			rock = "greenRock"
		},
		limestoneRock = {
			rock = "limestone"
		},
	},
	rockSmall = {
		redRockSmall = {
			rock = "redRock"
		},
		greenRockSmall = {
			rock = "greenRock"
		},
		limestoneRockSmall = {
			rock = "limestone"
		},
	},
	rockLarge = {
		redRockLarge = {
			rock = "redRock"
		},
		greenRockLarge = {
			rock = "greenRock"
		},
		limestoneRockLarge = {
			rock = "limestone"
		},
	},

	pathNode_rock_1 = {
		pathNode_limestoneRock_1 = {
			rock = "limestone"
		},
		pathNode_redRock_1 = {
			rock = "redRock"
		},
		pathNode_greenRock_1 = {
			rock = "greenRock"
		},
	},
	pathNode_rock_2 = {
		pathNode_limestoneRock_2 = {
			rock = "limestone"
		},
		pathNode_redRock_2 = {
			rock = "redRock"
		},
		pathNode_greenRock_2 = {
			rock = "greenRock"
		},
	},

	pathNode_rock_small = {
		pathNode_limestoneRock_small = {
			rock = "limestone"
		},
		pathNode_redRock_small = {
			rock = "redRock"
		},
		pathNode_greenRock_small = {
			rock = "greenRock"
		},
	},

	
	pathNode_tile_1 = {
		pathNode_firedTile_1 = {},
	},
	
	pathNode_tile_2 = {
		pathNode_firedTile_2 = {},
	},
	pathNode_tile_small = {
		pathNode_firedTile_small = {},
	},

	stoneKnife_rock1 = {
		stoneKnife_limestone = {
			rock = "limestone"
		},
		stoneKnife_redRock = {
			rock = "redRock"
		},
		stoneKnife_greenRock = {
			rock = "greenRock"
		},
	},

	stoneAxeHead_rock1 = {
		stoneAxeHead_limestone = {
			rock = "limestone"
		},
		stoneAxeHead_redRock = {
			rock = "redRock"
		},
		stoneAxeHead_greenRock = {
			rock = "greenRock"
		},
	},

	stoneSpearHead_rock1 = {
		stoneSpearHead_limestone = {
			rock = "limestone"
		},
		stoneSpearHead_redRock = {
			rock = "redRock"
		},
		stoneSpearHead_greenRock = {
			rock = "greenRock"
		},
	},
	stonePickaxeHead_rock1 = {
		stonePickaxeHead_limestone = {
			rock = "limestone"
		},
		stonePickaxeHead_redRock = {
			rock = "redRock"
		},
		stonePickaxeHead_greenRock = {
			rock = "greenRock"
		},
	},

	hayBed_hay_1 = {
		woolskinBed_woolskin_1 = {
			haySmaller = "clothes",
			hayNoDecal = "clothesNoDecal",
		},
		woolskinBed_woolskinMammoth_1 = {
			haySmaller = "clothesMammoth",
			hayNoDecal = "clothesMammothNoDecal",
		},
	},

	hayBed_hay_2 = {
		woolskinBed_woolskin_2 = {
			haySmaller = "clothes",
			hayNoDecal = "clothesNoDecal",
		},
		woolskinBed_woolskinMammoth_2 = {
			haySmaller = "clothesMammoth",
			hayNoDecal = "clothesMammothNoDecal",
		},
	},

	hayBed_hay_3 = {
		woolskinBed_woolskin_3 = {
			haySmaller = "clothes",
			hayNoDecal = "clothesNoDecal",
		},
		woolskinBed_woolskinMammoth_3 = {
			haySmaller = "clothesMammoth",
			hayNoDecal = "clothesMammothNoDecal",
		},
	},
	
	unfiredUrn = {
		unfiredUrnWet = {
			clay = "clayWet"
		},
	},
	
	mudBrick = {
		mudBrickWet_sand = {
			brick = "mudBrickWet_sand"
		},
		mudBrickWet_hay = {
			brick = "mudBrickWet_hay"
		},
				mudBrickWet_hay = {
			brick = "mudBrickWet_limewashed"
		},
		mudBrickWet_riverSand = {
			brick = "mudBrickWet_riverSand"
		},
		mudBrickWet_redSand = {
			brick = "mudBrickWet_redSand"
		},

		mudBrickDry_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickDry_hay = {
			brick = "mudBrickDry_hay"
		},
		mudBrickDry_limewashed = {
			brick = "mudBrickDry_limewashed"
		},
		mudBrickDry_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickDry_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	
	brick = {
		firedBrick_sand = {
			brick = "firedBrick_sand"
		},
		firedBrick_hay = {
			brick = "firedBrick_hay"
		},
		firedBrick_riverSand = {
			brick = "firedBrick_riverSand"
		},
		firedBrick_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	tile = {
		mudTileWet = {
			brick = "clayWet"
		},
		mudTileDry = {
			brick = "clay"
		},
		firedTile = {
			brick = "terracotta"
		},
	},

	mudBrickWallSection = {
		mudBrickWallSection_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSection_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},

	mudBrickKilnSection = {
		mudBrickKilnSection_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickKilnSection_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickKilnSection_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickKilnSection_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},

	mudBrickKilnSectionWithOpening = {
		mudBrickKilnSectionWithOpening_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickKilnSectionWithOpening_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickKilnSectionWithOpening_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickKilnSectionWithOpening_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},

	mudBrickKilnSectionTop = {
		mudBrickKilnSectionTop_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickKilnSectionTop_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickKilnSectionTop_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickKilnSectionTop_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	
	
	mudBrickColumnTop = {
		mudBrickColumnTop_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickColumnTop_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickColumnTop_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickColumnTop_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	mudBrickColumnBottom = {
		mudBrickColumnBottom_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickColumnBottom_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickColumnBottom_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickColumnBottom_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	mudBrickColumnFullLow = {
		mudBrickColumnFullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickColumnFullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickColumnFullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickColumnFullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},

	mudBrickWallSectionSingleHigh = {
		mudBrickWallSectionSingleHigh_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionSingleHigh_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionSingleHigh_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSectionSingleHigh_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	
	mudBrickWallSection_075 = {
		mudBrickWallSection_075_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection_075_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection_075_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSection_075_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},

	mudBrickWallSectionDoorTop = {
		mudBrickWallSectionDoorTop_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionDoorTop_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionDoorTop_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSectionDoorTop_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	
	mudBrickWallSectionFullLow = {
		mudBrickWallSectionFullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionFullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionFullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSectionFullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},
		
		brickWallSectionFullLow_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSectionFullLow_hay = {
			brick = "firedBrick_sand"
		},
		brickWallSectionFullLow_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSectionFullLow_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	mudBrickWallSection4x1FullLow = {
		mudBrickWallSection4x1FullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection4x1FullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection4x1FullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSection4x1FullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},
		
		brickWallSection4x1FullLow_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSection4x1FullLow_hay = {
			brick = "firedBrick_sand"
		},
		brickWallSection4x1FullLow_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSection4x1FullLow_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	mudBrickWallSection2x2FullLow = {
		mudBrickWallSection2x2FullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection2x2FullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSection2x2FullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSection2x2FullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},

		brickWallSection2x2FullLow_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSection2x2FullLow_hay = {
			brick = "firedBrick_sand"
		},
		brickWallSection2x2FullLow_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSection2x2FullLow_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	mudBrickWallSectionWindowFullLow = {
		mudBrickWallSectionWindowFullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionWindowFullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionWindowFullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSectionWindowFullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},

		brickWallSectionWindowFullLow_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSectionWindowFullLow_hay = {
			brick = "firedBrick_sand"
		},
		brickWallSectionWindowFullLow_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSectionWindowFullLow_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	mudBrickWallSectionDoorFullLow = {
		mudBrickWallSectionDoorFullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionDoorFullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallSectionDoorFullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallSectionDoorFullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},

		brickWallSectionDoorFullLow_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSectionDoorFullLow_hay = {
			brick = "firedBrick_sand"
		},
		brickWallSectionDoorFullLow_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSectionDoorFullLow_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	mudBrickWallColumn = {
		mudBrickWallColumn_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallColumn_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickWallColumn_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickWallColumn_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},
	
	
	mudBrickFloorSection4x4FullLow = {
		mudBrickFloorSection4x4FullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickFloorSection4x4FullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickFloorSection4x4FullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickFloorSection4x4FullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},
		--tile
		tileFloorSection4x4FullLow_firedTile = {
			brick = "terracotta"
		},
	},
	
	
	mudBrickFloorSection2x2FullLow = {
		mudBrickFloorSection2x2FullLow_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickFloorSection2x2FullLow_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickFloorSection2x2FullLow_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickFloorSection2x2FullLow_redSand = {
			brick = "mudBrickDry_redSand"
		},
		--tile
		tileFloorSection2x2FullLow_firedTile = {
			brick = "terracotta"
		},
	},
	
	
	mudBrickFloorSection2x1 = {
		mudBrickFloorSection2x1_sand = {
			brick = "mudBrickDry_sand"
		},
		mudBrickFloorSection2x1_hay = {
			brick = "mudBrickDry_sand"
		},
		mudBrickFloorSection2x1_riverSand = {
			brick = "mudBrickDry_riverSand"
		},
		mudBrickFloorSection2x1_redSand = {
			brick = "mudBrickDry_redSand"
		},
	},


	brickWallSection = {
		brickWallSection_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSection_hay = {
			brick = "firedBrick_hay"
		},
		brickWallSection_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSection_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	brickWallSection_075 = {
		brickWallSection_075_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSection_075_hay = {
			brick = "firedBrick_hay"
		},
		brickWallSection_075_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSection_075_redSand = {
			brick = "firedBrick_redSand"
		},
	},

	brickWallSectionDoorTop = {
		brickWallSectionDoorTop_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSectionDoorTop_hay = {
			brick = "firedBrick_hay"
		},
		brickWallSectionDoorTop_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSectionDoorTop_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	brickWallColumn = {
		brickWallColumn_sand = {
			brick = "firedBrick_sand"
		},
		brickWallColumn_hay = {
			brick = "firedBrick_hay"
		},
		brickWallColumn_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallColumn_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	

	brickWallSectionSingleHigh = {
		brickWallSectionSingleHigh_sand = {
			brick = "firedBrick_sand"
		},
		brickWallSectionSingleHigh_hay = {
			brick = "firedBrick_hay"
		},
		brickWallSectionSingleHigh_riverSand = {
			brick = "firedBrick_riverSand"
		},
		brickWallSectionSingleHigh_redSand = {
			brick = "firedBrick_redSand"
		},
	},
	
	
	tileFloorSection2x1 = {
		tileFloorSection2x1_firedTile = {
			brick = "terracotta"
		},
	},
	
	unfiredUrnGrain = {
		unfiredUrnWheat = {
			grain = "wheatGrain"
		},
		unfiredUrnFlour = {
			grain = "flour"
		},
		unfiredUrnWheatRotten = {
			grain = "wheatGrainRotten"
		},
		unfiredUrnFlourRotten = {
			grain = "flourRotten"
		},
	},
	
	
	firedUrnGrain = {
		firedUrnWheat = {
			grain = "wheatGrain"
		},
		firedUrnFlour = {
			grain = "flour"
		},
		firedUrnWheatRotten = {
			grain = "wheatGrainRotten"
		},
		firedUrnFlourRotten = {
			grain = "flourRotten"
		},
	},

	quernstone_rock1 = {
		quernstone_limestone = {
			rock = "limestone"
		},
		quernstone_redRock = {
			rock = "redRock"
		},
		quernstone_greenRock = {
			rock = "greenRock"
		},
	},

	craftArea_rock1 = {
		craftArea_limestoneRock1 = {
			rock = "limestone"
		},
		craftArea_redRock1 = {
			rock = "redRock"
		},
		craftArea_greenRock1 = {
			rock = "greenRock"
		},
	},

	flatbread = {
		flatbreadRotten = {
			bread = "rottenBread",
			darkBread = "darkRottenBread",
		}
	},
	
	breadDough = {
		breadDoughRotten = {
			breadDough = "breadDoughRotten",
		}
	},

	chickenMeat = {
		chickenMeatCooked = {
			whiteMeat = "whiteMeatCooked",
			bone = "boneCooked",
		}
	},
	chickenMeatBreast = {
		chickenMeatBreastCooked = {
			whiteMeat = "whiteMeatCooked",
			bone = "boneCooked",
		}
	},
	

	alpacaMeatRack = {
		alpacaMeatRackCooked = {
			redMeat = "redMeatCooked"
		}
	},
	alpacaMeatLeg = {
		alpacaMeatLegCooked = {
			redMeat = "redMeatCooked"
		}
	},
	mammothMeat = {
		mammothMeatCooked = {
			redMeat = "redMeatCooked"
		}
	},
	mammothMeatTBone = {
		mammothMeatTBoneCooked = {
			redMeat = "redMeatCooked"
		}
	},

	
	alpacaWoolskin = {
		mammothWoolskin = {
			alpacaWool = "mammothHide",
			alpacaWoolNoDecal = "mammothHide",
		}
	},
	
	
	coconut = {
		coconutRotten = {
			coconut = "coconutRotten"
		},
		coconutHangingFruit = {}
	},
	
	bambooSeed = {
		bambooSeedRotten = {
			bambooSeed = "bambooSeedRotten"
		},
	},
	
	apple = {
		appleHangingFruit = {}
	},
	banana = {
		bananaHangingFruit = {}
	},
	orange = {
		orangeHangingFruit = {}
	},
	peach = {
		peachHangingFruit = {}
	},
	olive = {
		oliveHangingFruit = {}
	},
	raspberry = {
		raspberryHangingFruit = {}
	},
	gooseberry = {
		gooseberryHangingFruit = {}
	},
	pumpkin = {
		pumpkinHangingFruit = {},
		pumpkinCooked = {
			pumpkin = "pumpkinCooked",
			wood = "charcoal",
		}
	},
	beetroot = {
		beetrootCooked = {
			beetroot = "beetrootCooked",
			beetleaf = "charcoal",
		}
	},

	-- branches
	birchBranch = {
		aspenBranch = {},
	},
	birchBranchLong = {
		aspenBranchLong = {},
	},
	birchBranchHalf = {
		aspenBranchHalf = {},
	},
	willowBranch = {
		appleBranch = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeBranch = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachBranch = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveBranch = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowBranchLong = {
		appleBranchLong = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeBranchLong = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachBranchLong = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveBranchLong = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowBranchHalf = {
		appleBranchHalf = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeBranchHalf = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachBranchHalf = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		orangeBranchHalf = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},

	-- woodenPole
	woodenPole_birch = {
		woodenPole_aspen = {},
	},
	woodenPoleShort_birch = {
		woodenPoleShort_aspen = {},
	},
	woodenPoleLong_birch = {
		woodenPoleLong_aspen = {},
	},
	woodenPole_willow = {
		woodenPole_apple = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		woodenPole_orange = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		woodenPole_peach = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		woodenPole_olive = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	woodenPoleShort_willow = {
		woodenPoleShort_apple = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		woodenPoleShort_orange = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		woodenPoleShort_peach = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
	},
	woodenPoleLong_willow = {
		woodenPoleLong_apple = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		woodenPoleLong_orange = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		woodenPoleLong_peach = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		woodenPoleLong_orange = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},

	
	-- log
	birchLog = {
		aspenLog = {},
	},
	birchLogShort = {
		aspenLogShort = {},
	},
	birchLog4 = {
		aspenLog4 = {},
	},
	birchLog3 = {
		aspenLog3 = {},
	},
	birchLogHalf = {
		aspenLogHalf = {},
	},
	
	pineLog = {
		coconutLog = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineLogShort = {
		coconutLogShort = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineLog4 = {
		coconutLog4 = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineLog3 = {
		coconutLog3 = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineLogHalf = {
		coconutLogHalf = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	
	willowLog = {
		appleLog = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeLog = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachLog = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveLog = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowLogShort = {
		appleLogShort = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeLogShort = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachLogShort = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveLogShort = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowLog4 = {
		appleLog4 = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeLog4 = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachLog4 = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		olivLog4 = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowLog3 = {
		appleLog3 = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeLog3 = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachLog3 = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveLog3 = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowLogHalf = {
		appleLogHalf = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeLogHalf = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachLogHalf = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveLogHalf = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},

	-- splitLog
	birchSplitLog = {
		aspenSplitLog = {},
	},
	birchSplitLogLong = {
		aspenSplitLogLong = {},
	},
	birchSplitLog3 = {
		aspenSplitLog3 = {},
	},
	birchSplitLogLongAngleCut = {
		aspenSplitLogLongAngleCut = {},
	},
	birchSplitLog075 = {
		aspenSplitLog075 = {},
	},
	birchSplitLog075AngleCut = {
		aspenSplitLog075AngleCut = {},
	},
	birchSplitLog2x1Grad = {
		aspenSplitLog2x1Grad = {},
	},
	birchSplitLog2x1GradAngleCut = {
		aspenSplitLog2x1GradAngleCut = {},
	},
	birchSplitLog2x2Grad = {
		aspenSplitLog2x2Grad = {},
	},
	birchSplitLog2x2GradAngleCut = {
		aspenSplitLog2x2GradAngleCut = {},
	},
	birchSplitLog05 = {
		aspenSplitLog05 = {},
	},
	birchSplitLog05AngleCut = {
		aspenSplitLog05AngleCut = {},
	},
	
	pineSplitLog = {
		coconutSplitLog = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLogLong = {
		coconutSplitLogLong = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog3 = {
		coconutSplitLog3 = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLogLongAngleCut = {
		coconutSplitLogLongAngleCut = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog075 = {
		coconutSplitLog075 = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog075AngleCut = {
		coconutSplitLog075AngleCut = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog2x1Grad = {
		coconutSplitLog2x1Grad = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog2x1GradAngleCut = {
		coconutSplitLog2x1GradAngleCut = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog2x2Grad = {
		coconutSplitLog2x2Grad = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog2x2GradAngleCut = {
		coconutSplitLog2x2GradAngleCut = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog05 = {
		coconutSplitLog05 = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	pineSplitLog05AngleCut = {
		coconutSplitLog05AngleCut = {
			wood = "coconutWood",
			trunk = "coconutBark",
		},
	},
	
	willowSplitLog = {
		appleSplitLog = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLogLong = {
		appleSplitLogLong = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLogLong = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLogLong = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLogLong = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog3 = {
		appleSplitLog3 = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog3 = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog3= {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog3 = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLogLongAngleCut = {
		appleSplitLogLongAngleCut = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLogLongAngleCut = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLogLongAngleCut = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLogLongAngleCut = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog075 = {
		appleSplitLog075 = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog075 = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog075 = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog075 = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog075AngleCut = {
		appleSplitLog075AngleCut = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog075AngleCut = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog075AngleCut = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog075AngleCut = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog2x1Grad = {
		appleSplitLog2x1Grad = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog2x1Grad = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog2x1Grad = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog2x1Grad = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog2x1GradAngleCut = {
		appleSplitLog2x1GradAngleCut = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog2x1GradAngleCut = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog2x1GradAngleCut = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog2x1GradAngleCut = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog2x2Grad = {
		appleSplitLog2x2Grad = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog2x2Grad = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog2x2Grad = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog2x2Grad = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog2x2GradAngleCut = {
		appleSplitLog2x2GradAngleCut = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog2x2GradAngleCut = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog2x2GradAngleCut = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog2x2GradAngleCut = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog05 = {
		appleSplitLog05 = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog05 = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog05 = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog05 = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	willowSplitLog05AngleCut = {
		appleSplitLog05AngleCut = {
			darkBark = "appleBark",
			willowWood = "appleWood",
		},
		orangeSplitLog05AngleCut = {
			darkBark = "orangeBark",
			willowWood = "orangeWood",
		},
		peachSplitLog05AngleCut = {
			darkBark = "peachBark",
			willowWood = "peachWood",
		},
		oliveSplitLog05AngleCut = {
			darkBark = "oliveBark",
			willowWood = "oliveWood",
		},
	},
	

	--[[splitLogFloor4x4FullLow = {
		splitLogFloor4x4FullLow_pine = {},
		splitLogFloor4x4FullLow_birch = {
			trunk = "whiteTrunk",
			wood = "lightWood",
		},
		splitLogFloor4x4FullLow_aspen = {
			trunk = "whiteTrunk",
			wood = "lightWood",
		},
		splitLogFloor4x4FullLow_willow = {
			trunk = "darkBark",
			wood = "willowWood",
		},
		splitLogFloor4x4FullLow_coconut = {
			trunk = "coconutBark",
			wood = "coconutWood",
		},
		splitLogFloor4x4FullLow_apple = {
			trunk = "appleBark",
			wood = "appleWood",
		},
		splitLogFloor4x4FullLow_orange = {
			trunk = "orangeBark",
			wood = "orangeWood",
		},
		splitLogFloor4x4FullLow_peach = {
			trunk = "peachBark",
			wood = "peachWood",
		},
	},]]
}

local woodRemaps = {
	pine = {},
	birch = {
		trunk = "whiteTrunk",
		wood = "lightWood",
	},
	aspen = {
		trunk = "whiteTrunk",
		wood = "lightWood",
	},
	willow = {
		trunk = "darkBark",
		wood = "willowWood",
	},
	coconut = {
		trunk = "coconutBark",
		wood = "coconutWood",
	},
	apple = {
		trunk = "appleBark",
		wood = "appleWood",
	},
	orange = {
		trunk = "orangeBark",
		wood = "orangeWood",
	},
	peach = {
		trunk = "peachBark",
		wood = "peachWood",
	},
	olive = {
		trunk = "oliveBark",
		wood = "oliveWood",
	},
}

remapModels.splitLogFloor4x4FullLow = {}
remapModels.splitLogFloor2x2FullLow = {}
remapModels.woodenPole_pine_low = {}
remapModels.woodenPoleShort_pine_low = {}
remapModels.woodenPoleLong_pine_low = {}

for k,v in pairs(woodRemaps) do
	remapModels.splitLogFloor4x4FullLow["splitLogFloor4x4FullLow_"..k] = v
	remapModels.splitLogFloor2x2FullLow["splitLogFloor2x2FullLow_"..k] = v

	if k ~= "pine" then
		remapModels.woodenPole_pine_low["woodenPole_"..k.."_low"] = v
		remapModels.woodenPoleShort_pine_low["woodenPoleShort_"..k.."_low"] = v
		remapModels.woodenPoleLong_pine_low["woodenPoleLong_"..k.."_low"] = v
	end
end


for i=1,4 do
	local modelName = "birch" .. mj:tostring(i)
	local autumnName = modelName .. "Autumn"
	local springName = modelName .. "Spring"

	local function addRemaps(modelName_, autumnName_, springName_)
		remapModels[modelName_] = {
			[autumnName_] = {
				leafyBushB = "autumn" .. i + 3 .. "Leaf",
				bush = "autumn" .. i + 3,
				bushB = "autumn" .. i + 3
			},
			[springName_] = {
				leafyBushB = "leafyBushBSpring",
				bush = "bushBSpring",
				bushB = "bushBSpring"
			},
		}
	end

	addRemaps(modelName, autumnName, springName)
	--addRemaps(modelName .. "_low", autumnName .. "_low", springName .. "_low")

end

for i=1,3 do
	local modelName = "aspen" .. mj:tostring(i)
	local autumnName = modelName .. "Autumn"
	local springName = modelName .. "Spring"
	remapModels[modelName] = {
		[autumnName] = {
			leafyBushAspen = "autumn" .. i + 7 .. "Leaf",
			bushAspen = "autumn" .. i + 7
		},
		[springName] = {
			leafyBushAspen = "leafyBushAspenSpring",
			bushAspen = "bushAspenSpring"
		},
	}
end

local modelIndexesByName = {}
local modelsByIndex = {}

model.modelsByIndex = modelsByIndex
model.modelIndexesByName = modelIndexesByName
model.remapModels = remapModels


local modelIndex = 1



local modelLevelsBySubdivLevel = {}
local modelDetailLevelsByHighestDetailIndex = {}

local function setupModelDetailLevels(renderDistance)
	
	for i=1,mj.SUBDIVISIONS do
		if i < mj.SUBDIVISIONS - 5 and renderDistance > 5.5 then
			modelLevelsBySubdivLevel[i] = 4
		elseif i < mj.SUBDIVISIONS - 4 and renderDistance > 9.5 then
			modelLevelsBySubdivLevel[i] = 4
		elseif i < mj.SUBDIVISIONS - 3 and renderDistance > 2.5 then
			modelLevelsBySubdivLevel[i] = 3
		else
			local minLowDetailDistance = 1
			--[[if renderDistance < 3.5 then
				minLowDetailDistance = 2
			end]]
			if debugLowDetail then
				minLowDetailDistance = 0
			end
			if i < mj.SUBDIVISIONS - minLowDetailDistance then
				modelLevelsBySubdivLevel[i] = 2
			else
				modelLevelsBySubdivLevel[i] = 1
			end
		end
	end
end

function model:addModel(fileName)
	local nameWithoutExtension = fileName:match("^(.+).glb$")
	if nameWithoutExtension then
		local existingMoodelIndex = modelIndexesByName[nameWithoutExtension]
		if existingMoodelIndex then
			local modelInfo = modelsByIndex[existingMoodelIndex]
			modelInfo.path = fileName
		else
			modelIndexesByName[nameWithoutExtension] = modelIndex
			
			local modelInfo = {
				path = fileName, 
				hasVolume = true, 
				materialRemap = nil,
				windStrength = vec2(1.0, 1.0)
			}

			if windStrengths[nameWithoutExtension] ~= nil then
				modelInfo.windStrength = windStrengths[nameWithoutExtension]
			end

			for unused, withoutVolume in ipairs(modelsWithoutVolume) do
				if withoutVolume == nameWithoutExtension then
					modelInfo.hasVolume = false
				end
			end

			modelsByIndex[modelIndex] = modelInfo

			modelIndex = modelIndex + 1
		end

	end
end

function model:searchModelDir(modelsDirPath)
	local fileList = fileUtils.getDirectoryContents(modelsDirPath)

	for i,fileName in ipairs(fileList) do
		model:addModel(fileName)
	end
end

function model:addModModels()
	local resourceAdditions = modManager.resourceAdditions["models"]
	--mj:log("addModModels resourceAdditions:", resourceAdditions)

	if resourceAdditions then
		for resourcesRelativePath, fullPath in pairs(resourceAdditions) do
			local nameWithoutModelsPath = resourcesRelativePath:match("^models/(.+.glb)$")
			if nameWithoutModelsPath then
				--mj:log("addModModels nameWithoutModelsPath:", nameWithoutModelsPath)
				model:addModel(nameWithoutModelsPath)
			end
		end
	end
end


function model:loadRemaps()
	local modelIndexesByNameCopy = mj:cloneTable(modelIndexesByName)

	for nameWithoutExtension,existingModelIndex in pairs(modelIndexesByNameCopy) do
		local remaps = remapModels[nameWithoutExtension]
		if remaps then
			for remapName,materialRemap in pairs(remaps) do
				if modelIndexesByName[remapName] then
					mj:warn("Remap model:", remapName, " is overwriting an existing model.")
				end

				local function addClone(remapNameToUse, modelIndexToClone)
					local remapModelInfo = mj:cloneTable(modelsByIndex[modelIndexToClone])
					remapModelInfo.materialRemap = materialRemap
					modelIndexesByName[remapNameToUse] = modelIndex
					modelsByIndex[modelIndex] = remapModelInfo

					
					if windStrengths[remapNameToUse] ~= nil then
						remapModelInfo.windStrength = windStrengths[remapNameToUse]
					end

					for unused, withoutVolume in ipairs(modelsWithoutVolume) do
						if withoutVolume == remapNameToUse then
							remapModelInfo.hasVolume = false
						end
					end

					model.clones[modelIndex] = modelIndexToClone
					modelIndex = modelIndex + 1
				end

				--mj:log("adding remap:", remapName, " for base:", nameWithoutExtension)
				addClone(remapName, existingModelIndex)

				local existingNameWithDetail = nameWithoutExtension .. "_low"
				if modelIndexesByNameCopy[existingNameWithDetail] then
					local remapNameWithDetail = remapName .. "_low"
					addClone(remapNameWithDetail, modelIndexesByNameCopy[existingNameWithDetail])
				end
				existingNameWithDetail = nameWithoutExtension .. "_lowest"
				if modelIndexesByNameCopy[existingNameWithDetail] then
					local remapNameWithDetail = remapName .. "_lowest"
					addClone(remapNameWithDetail, modelIndexesByNameCopy[existingNameWithDetail])
				end
				existingNameWithDetail = nameWithoutExtension .. "_distant"
				if modelIndexesByNameCopy[existingNameWithDetail] then
					local remapNameWithDetail = remapName .. "_distant"
					addClone(remapNameWithDetail, modelIndexesByNameCopy[existingNameWithDetail])
				end
				
			end
		end
	end
end

function model:loadLODs()
	for nameWithoutExtension,existingModelIndex in pairs(modelIndexesByName) do
		local info = {}
		modelDetailLevelsByHighestDetailIndex[existingModelIndex] = info

		info[1] = existingModelIndex

		local existingNameWithDetail = nameWithoutExtension .. "_low"
		local otherDetailIndex = modelIndexesByName[existingNameWithDetail]
		if otherDetailIndex then
			info[2] = otherDetailIndex
		else
			info[2] = existingModelIndex
		end
		
		existingNameWithDetail = nameWithoutExtension .. "_lowest"
		otherDetailIndex = modelIndexesByName[existingNameWithDetail]
		if otherDetailIndex then
			info[3] = otherDetailIndex
		else
			info[3] = existingModelIndex
		end
		
		existingNameWithDetail = nameWithoutExtension .. "_distant"
		otherDetailIndex = modelIndexesByName[existingNameWithDetail]
		if otherDetailIndex then
			info[4] = otherDetailIndex
		else
			info[4] = existingModelIndex
		end

	end
end

function model:setup()
	
	local modelsDirPath = fileUtils.getResourcePath("models")
	model:searchModelDir(modelsDirPath)
	model:addModModels()

	model:loadRemaps()
	model:loadLODs()

	--mj:log("modelIndexesByName:", modelIndexesByName)
	setupModelDetailLevels(4.0)
end

local cachedCompositeModelIndexes = {}

function model:getModelIndexForCompositeModel(compositeInfo)
	if cachedCompositeModelIndexes[compositeInfo.hash] then
		return cachedCompositeModelIndexes[compositeInfo.hash]
	end

	local newModelIndex = modelIndex

	modelsByIndex[newModelIndex] = {
		compositeInfo = compositeInfo.paths, 
		hasVolume = true, 
		materialRemap = compositeInfo.materialRemap,
	}

	modelIndex = modelIndex + 1

	cachedCompositeModelIndexes[compositeInfo.hash] = newModelIndex

	return newModelIndex
end

local cachedModelNames = {}

function model:modelIndexForModelNameAndDetailLevel(modelName, level)
	if modelName then
		local cachedModelName = cachedModelNames[modelName]
		if cachedModelName then
			return cachedModelName[level]
		end

		cachedModelName = {}
		cachedModelNames[modelName] = cachedModelName

		local lowestDetailIndex = modelIndexesByName[modelName]
		cachedModelName[1] = lowestDetailIndex

		local lowDetail = modelName .. "_low"
		lowestDetailIndex = modelIndexesByName[lowDetail] or lowestDetailIndex
		cachedModelName[2] = lowestDetailIndex
		
		local lowestDetail = modelName .. "_lowest"
		lowestDetailIndex = modelIndexesByName[lowestDetail] or lowestDetailIndex
		cachedModelName[3] = lowestDetailIndex
		
		local distantDetail = modelName .. "_distant"
		lowestDetailIndex = modelIndexesByName[distantDetail] or lowestDetailIndex
		cachedModelName[4] = lowestDetailIndex

		return cachedModelName[level]
	end
	return nil
end


function model:modelIndexForDetailedModelIndexAndDetailLevel(detailedModelIndex, level)
	local modelDetailLevels = modelDetailLevelsByHighestDetailIndex[detailedModelIndex]
	--mj:log("modelDetailLevels:", modelDetailLevels, " level:", level)
	if modelDetailLevels then
		return modelDetailLevels[level]
	end

	return detailedModelIndex
end


function model:modelLevelForSubdivLevel(subdivLevel)
	return modelLevelsBySubdivLevel[math.min(subdivLevel, mj.SUBDIVISIONS - 1)]
end

function model:modelIndexForName(modelName)
	if modelName then
		local foundModel = modelIndexesByName[modelName]
		if not foundModel then
			mj:log("ERROR: model not found in modelIndexForName:", modelName)
			error("ERROR: model not found")
		end
		return  foundModel
	end
	return nil
end

function model:renderDistanceChanged(renderDistance)
	--mj:log("model:renderDistanceChanged:", renderDistance)
	setupModelDetailLevels(renderDistance)
end


function model:mjInit()
	model:setup()
end

-- called by engine

function model:modelInfoForModelIndex(modelIndexToFind)
	local foundModel = modelsByIndex[modelIndexToFind]
	return foundModel
end

return model