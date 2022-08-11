local typeMaps = mjrequire "common/typeMaps"

local resource = {}

local sapienInventory = mjrequire "common/sapienInventory"
local snapGroup = mjrequire "common/snapGroup"

local locale = mjrequire "common/locale"
local gameObjectTypeIndexMap = typeMaps.types.gameObject
local skillTypeIndexMap = typeMaps.types.skill

resource.types = typeMaps:createMap("resource", {
    {
        key = "branch",
        name = locale:get("resource_branch"),
        plural = locale:get("resource_branch_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
    },
    {
        key = "log",
        name = locale:get("resource_log"),
        plural = locale:get("resource_log_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchLog,
		placeBuildableMaleSnapPoints = snapGroup.malePoints.horizontalColumnMaleSnapPoints,
    },
    {
        key = "rock",
        name = locale:get("resource_rock"),
        plural = locale:get("resource_rock_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.rock,
    },
    {
        key = "apple",
        name = locale:get("fruit_apple"),
        plural = locale:get("fruit_apple_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.apple,
    },
    {
        key = "appleRotten",
        name = locale:get("fruit_apple_rotten"),
        plural = locale:get("fruit_apple_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.appleRotten,
    },
    {
        key = "orange",
        name = locale:get("fruit_orange"),
        plural = locale:get("fruit_orange_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.orange,
    },
    {
        key = "orangeRotten",
        name = locale:get("fruit_orange_rotten"),
        plural = locale:get("fruit_orange_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.orangeRotten,
    },
    {
        key = "peach",
        name = locale:get("fruit_peach"),
        plural = locale:get("fruit_peach_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.peach,
    },
    {
        key = "peachRotten",
        name = locale:get("fruit_peach_rotten"),
        plural = locale:get("fruit_peach_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.peachRotten,
    },
    {
        key = "olive",
        name = locale:get("fruit_olive"),
        plural = locale:get("fruit_olive_plural"),
        foodValue = 0.1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.olive,
    },
    {
        key = "oliveRotten",
        name = locale:get("fruit_olive_rotten"),
        plural = locale:get("fruit_olive_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.oliveRotten,
    },
    {
        key = "banana",
        name = locale:get("fruit_banana"),
        plural = locale:get("fruit_banana_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.banana,
    },
    {
        key = "bananaRotten",
        name = locale:get("fruit_banana_rotten"),
        plural = locale:get("fruit_banana_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.bananaRotten,
    },
    {
        key = "coconut",
        name = locale:get("fruit_coconut"),
        plural = locale:get("fruit_coconut_plural"),
        foodValue = 0.7,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.coconut,
    },
    {
        key = "coconutRotten",
        name = locale:get("fruit_coconut_rotten"),
        plural = locale:get("fruit_coconut_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.coconutRotten,
    },
    {
        key = "dirt",
        name = locale:get("resource_dirt"),
        plural = locale:get("resource_dirt_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.dirt,
    },
    {
        key = "hay",
        name = locale:get("resource_hay"),
        plural = locale:get("resource_hay_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.hay,
    },
    {
        key = "hayRotten",
        name = locale:get("resource_hayRotten"),
        plural = locale:get("resource_hayRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.hayRotten,
    },
    {
        key = "grass",
        name = locale:get("resource_grass"),
        plural = locale:get("resource_grass_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.grass,
    },
    {
        key = "raspberry",
        name = locale:get("fruit_raspberry"),
        plural = locale:get("fruit_raspberry_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.raspberry,
    },
    {
        key = "raspberryRotten",
        name = locale:get("fruit_raspberry_rotten"),
        plural = locale:get("fruit_raspberry_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.raspberryRotten,
    },
    {
        key = "gooseberry",
        name = locale:get("fruit_gooseberry"),
        plural = locale:get("fruit_gooseberry_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.gooseberry,
    },
    {
        key = "gooseberryRotten",
        name = locale:get("fruit_gooseberry_rotten"),
        plural = locale:get("fruit_gooseberry_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.gooseberryRotten,
    },
    {
        key = "pumpkin",
        name = locale:get("fruit_pumpkin"),
        plural = locale:get("fruit_pumpkin_plural"),
        foodValue = 0.4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pumpkin,
    },
    {
        key = "pumpkinRotten",
        name = locale:get("fruit_pumpkin_rotten"),
        plural = locale:get("fruit_pumpkin_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pumpkinRotten,
    },
    {
        key = "pumpkinCooked",
        name = locale:get("resource_pumpkinCooked"),
        plural = locale:get("resource_pumpkinCooked_plural"),
        foodValue = 0.8,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pumpkinCooked,
    },
    {
        key = "beetroot",
        name = locale:get("fruit_beetroot"),
        plural = locale:get("fruit_beetroot_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.beetroot,
    },
    {
        key = "beetrootRotten",
        name = locale:get("fruit_beetroot_rotten"),
        plural = locale:get("fruit_beetroot_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.beetrootRotten,
    },
    {
        key = "beetrootCooked",
        name = locale:get("resource_beetrootCooked"),
        plural = locale:get("resource_beetrootCooked_plural"),
        foodValue = 0.6,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.beetrootCooked,
    },
    {
        key = "beetrootSeed",
        name = locale:get("fruit_beetrootSeed"),
        plural = locale:get("fruit_beetrootSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.beetrootSeed,
    },
    {
        key = "beetrootSeedRotten",
        name = locale:get("fruit_beetrootSeed_rotten"),
        plural = locale:get("fruit_beetrootSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.beetrootSeedRotten,
    },
    {
        key = "wheat",
        name = locale:get("fruit_wheat"),
        plural = locale:get("fruit_wheat_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.wheat,
    },
    {
        key = "wheatRotten",
        name = locale:get("fruit_wheat_rotten"),
        plural = locale:get("fruit_wheat_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.wheatRotten,
    },
    {
        key = "flax",
        name = locale:get("fruit_flax"),
        plural = locale:get("fruit_flax_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flax,
    },
    {
        key = "flaxDried",
        name = locale:get("resource_flaxDried"),
        plural = locale:get("resource_flaxDried_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flaxDried,
    },
    {
        key = "flaxRotten",
        name = locale:get("fruit_flax_rotten"),
        plural = locale:get("fruit_flax_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flaxRotten,
    },
    {
        key = "flaxSeed",
        name = locale:get("fruit_flaxSeed"),
        plural = locale:get("fruit_flaxSeed_plural"),
        foodValue = 0.1,
        defaultToEatingDisabled = true,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flaxSeed,
    },
    {
        key = "flaxSeedRotten",
        name = locale:get("fruit_flaxSeed_rotten"),
        plural = locale:get("fruit_flaxSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flaxSeedRotten,
    },
    {
        key = "sunflowerSeed",
        name = locale:get("fruit_sunflowerSeed"),
        plural = locale:get("fruit_sunflowerSeed_plural"),
        foodValue = 0.1,
        defaultToEatingDisabled = true,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.sunflowerSeed,
    },
    {
        key = "sunflowerSeedRotten",
        name = locale:get("fruit_sunflowerSeed_rotten"),
        plural = locale:get("fruit_sunflowerSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.sunflowerSeedRotten,
    },
    {
        key = "sand",
        name = locale:get("resource_sand"),
        plural = locale:get("resource_sand_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.sand,
    },
    {
        key = "rockSmall",
        name = locale:get("resource_rockSmall"),
        plural = locale:get("resource_rockSmall_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.rockSmall,
    },
    {
        key = "flint",
        name = locale:get("resource_flint"),
        plural = locale:get("resource_flint_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flint,
    },
    {
        key = "clay",
        name = locale:get("resource_clay"),
        plural = locale:get("resource_clay_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.clay,
    },
    {
        key = "deadChicken",
        name = locale:get("resource_deadChicken"),
        plural = locale:get("resource_deadChicken_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.deadChicken,
        disallowsDecorationPlacing = true,
    },
    {
        key = "deadChickenRotten",
        name = locale:get("resource_deadChickenRotten"),
        plural = locale:get("resource_deadChickenRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.deadChicken,
        disallowsDecorationPlacing = true,
    },
    {
        key = "deadAlpaca",
        name = locale:get("resource_deadAlpaca"),
        plural = locale:get("resource_deadAlpaca_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.deadAlpaca,
        disallowsDecorationPlacing = true,
    },
    {
        key = "chickenMeat",
        name = locale:get("resource_chickenMeat"),
        plural = locale:get("resource_chickenMeat_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.chickenMeat,
        disallowsDecorationPlacing = true,
    },
    {
        key = "chickenMeatCooked",
        name = locale:get("resource_chickenMeatCooked"),
        plural = locale:get("resource_chickenMeatCooked_plural"),
        foodValue = 0.7,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.chickenMeatCooked,
        disallowsDecorationPlacing = true,
    },
    {
        key = "alpacaMeat",
        name = locale:get("resource_alpacaMeat"),
        plural = locale:get("resource_alpacaMeat_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.alpacaMeatRack,
        disallowsDecorationPlacing = true,
    },
    {
        key = "alpacaMeatCooked",
        name = locale:get("resource_alpacaMeatCooked"),
        plural = locale:get("resource_alpacaMeatCooked_plural"),
        foodValue = 0.7,
        foodPortionCount = 3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.alpacaMeatRackCooked,
        disallowsDecorationPlacing = true,
    },
    {
        key = "mammothMeat",
        name = locale:get("resource_mammothMeat"),
        plural = locale:get("resource_mammothMeat_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mammothMeatTBone,
        disallowsDecorationPlacing = true,
    },
    {
        key = "mammothMeatCooked",
        name = locale:get("resource_mammothMeatCooked"),
        plural = locale:get("resource_mammothMeatCooked_plural"),
        foodValue = 0.7,
        foodPortionCount = 4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mammothMeatTBoneCooked,
        disallowsDecorationPlacing = true,
    },

    
    {
        key = "stoneSpear",
        name = locale:get("resource_stoneSpear"),
        plural = locale:get("resource_stoneSpear_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stoneSpear,
    },
    {
        key = "stonePickaxe",
        name = locale:get("resource_stonePickaxe"),
        plural = locale:get("resource_stonePickaxe_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stonePickaxe,
    },
    {
        key = "stoneHatchet",
        name = locale:get("resource_stoneHatchet"),
        plural = locale:get("resource_stoneHatchet_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stoneHatchet,
    },
    {
        key = "stoneSpearHead",
        name = locale:get("resource_stoneSpearHead"),
        plural = locale:get("resource_stoneSpearHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stoneSpearHead,
    },
    {
        key = "stonePickaxeHead",
        name = locale:get("resource_stonePickaxeHead"),
        plural = locale:get("resource_stonePickaxeHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stonePickaxeHead,
    },
    {
        key = "stoneAxeHead",
        name = locale:get("resource_stoneAxeHead"),
        plural = locale:get("resource_stoneAxeHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stoneAxeHead,
    },
    {
        key = "stoneKnife",
        name = locale:get("resource_stoneKnife"),
        plural = locale:get("resource_stoneKnife_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stoneKnife,
    },
    
    {
        key = "flintSpear",
        name = locale:get("resource_flintSpear"),
        plural = locale:get("resource_flintSpear_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintSpear,
    },
    {
        key = "boneSpear",
        name = locale:get("resource_boneSpear"),
        plural = locale:get("resource_boneSpear_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.boneSpear,
    },
    {
        key = "flintPickaxe",
        name = locale:get("resource_flintPickaxe"),
        plural = locale:get("resource_flintPickaxe_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintPickaxe,
    },
    {
        key = "flintHatchet",
        name = locale:get("resource_flintHatchet"),
        plural = locale:get("resource_flintHatchet_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintHatchet,
    },
    {
        key = "flintSpearHead",
        name = locale:get("resource_flintSpearHead"),
        plural = locale:get("resource_flintSpearHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintSpearHead,
    },
    {
        key = "boneSpearHead",
        name = locale:get("resource_boneSpearHead"),
        plural = locale:get("resource_boneSpearHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.boneSpearHead,
    },
    {
        key = "flintPickaxeHead",
        name = locale:get("resource_flintPickaxeHead"),
        plural = locale:get("resource_flintPickaxeHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintPickaxeHead,
    },
    {
        key = "flintAxeHead",
        name = locale:get("resource_flintAxeHead"),
        plural = locale:get("resource_flintAxeHead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintAxeHead,
    },
    {
        key = "flintKnife",
        name = locale:get("resource_flintKnife"),
        plural = locale:get("resource_flintKnife_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flintKnife,
    },
    {
        key = "boneKnife",
        name = locale:get("resource_boneKnife"),
        plural = locale:get("resource_boneKnife_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.boneKnife,
    },
    {
        key = "boneFlute",
        name = locale:get("resource_boneFlute"),
        plural = locale:get("resource_boneFlute_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.boneFlute,
        musicalInstrumentSkillTypeIndex = skillTypeIndexMap.flutePlaying,
    },
    {
        key = "logDrum",
        name = locale:get("resource_logDrum"),
        plural = locale:get("resource_logDrum_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.logDrum,
        musicalInstrumentSkillTypeIndex = skillTypeIndexMap.flutePlaying,
    },
    {
        key = "balafon",
        name = locale:get("resource_balafon"),
        plural = locale:get("resource_balafon_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.balafon,
        musicalInstrumentSkillTypeIndex = skillTypeIndexMap.flutePlaying,
    },

    {
        key = "woodenPole",
        name = locale:get("resource_woodenPole"),
        plural = locale:get("resource_woodenPole_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchWoodenPole,
		placeBuildableMaleSnapPoints = snapGroup.malePoints.horizontalColumnMaleSnapPoints,
        disallowsDecorationPlacing = true,
    },
    {
        key = "splitLog",
        name = locale:get("resource_splitLog"),
        plural = locale:get("resource_splitLog_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchSplitLog,
        defaultToFuelDisabled = true,
    },
    {
        key = "pineCone",
        name = locale:get("fruit_pineCone"),
        plural = locale:get("fruit_pineCone_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pineCone,
    },
    {
        key = "pineConeBig",
        name = locale:get("fruit_pineConeBig"),
        plural = locale:get("fruit_pineConeBig_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pineConeBig,
        defaultToFuelDisabled = true,
    },
    {
        key = "pineConeRotten",
        name = locale:get("fruit_pineCone_rotten"),
        plural = locale:get("fruit_pineCone_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pineConeRotten,
    },
    {
        key = "pineConeBigRotten",
        name = locale:get("fruit_pineConeBig_rotten"),
        plural = locale:get("fruit_pineConeBig_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.pineConeBigRotten,
    },
    {
        key = "birchSeed",
        name = locale:get("fruit_birchSeed"),
        plural = locale:get("fruit_birchSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchSeed,
    },
    {
        key = "birchSeedRotten",
        name = locale:get("fruit_birchSeed_rotten"),
        plural = locale:get("fruit_birchSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchSeedRotten,
    },
    {
        key = "aspenSeed",
        name = locale:get("fruit_aspenSeed"),
        plural = locale:get("fruit_aspenSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.aspenSeed,
    },
    {
        key = "aspenSeedRotten",
        name = locale:get("fruit_aspenSeed_rotten"),
        plural = locale:get("fruit_aspenSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.aspenSeedRotten,
    },
    {
        key = "aspenBigSeed",
        name = locale:get("fruit_aspenBigSeed"),
        plural = locale:get("fruit_aspenBigSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.aspenBigSeed,
    },
    {
        key = "aspenBigSeedRotten",
        name = locale:get("fruit_aspenBigSeed_rotten"),
        plural = locale:get("fruit_aspenBigSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.aspenBigSeedRotten,
    },
    {
        key = "willowSeed",
        name = locale:get("fruit_willowSeed"),
        plural = locale:get("fruit_willowSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.willowSeed,
    },
    {
        key = "willowSeedRotten",
        name = locale:get("fruit_willowSeed_rotten"),
        plural = locale:get("fruit_willowSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.willowSeedRotten,
    },
    {
        key = "bambooSeed",
        name = locale:get("fruit_bambooSeed"),
        plural = locale:get("fruit_bambooSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.bambooSeed,
    },
    {
        key = "bambooSeedRotten",
        name = locale:get("fruit_bambooSeed_rotten"),
        plural = locale:get("fruit_bambooSeed_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.bambooSeedRotten,
    },
    {
        key = "woolskin",
        name = locale:get("resource_woolskin"),
        plural = locale:get("resource_woolskin_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.alpacaWoolskin,
        clothingInventoryLocation = sapienInventory.locations.torso.index,
    },
    {
        key = "bone",
        name = locale:get("resource_bone"),
        plural = locale:get("resource_bone_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.bone,
    },
    {
        key = "burntBranch",
        name = locale:get("resource_burntBranch"),
        plural = locale:get("resource_burntBranch_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.burntBranch,
    },
    {
        key = "unfiredUrnWet",
        name = locale:get("resource_unfiredUrnWet"),
        plural = locale:get("resource_unfiredUrnWet_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.unfiredUrnWet,
    },
    {
        key = "unfiredUrnDry",
        name = locale:get("resource_unfiredUrnDry"),
        plural = locale:get("resource_unfiredUrnDry_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.unfiredUrnDry,
    },
    {
        key = "firedUrn",
        name = locale:get("resource_firedUrn"),
        plural = locale:get("resource_firedUrn_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrn,
    },
    {
        key = "unfiredUrnHulledWheat",
        name = locale:get("resource_unfiredUrnHulledWheat"),
        plural = locale:get("resource_unfiredUrnHulledWheat_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.unfiredUrnHulledWheat,
    },
    {
        key = "unfiredUrnHulledWheatRotten",
        name = locale:get("resource_unfiredUrnHulledWheatRotten"),
        plural = locale:get("resource_unfiredUrnHulledWheatRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.unfiredUrnHulledWheatRotten,
    },
    {
        key = "firedUrnHulledWheat",
        name = locale:get("resource_firedUrnHulledWheat"),
        plural = locale:get("resource_firedUrnHulledWheat_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrnHulledWheat,
    },
    {
        key = "firedUrnHulledWheatRotten",
        name = locale:get("resource_firedUrnHulledWheatRotten"),
        plural = locale:get("resource_firedUrnHulledWheatRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrnHulledWheatRotten,
    },
    {
        key = "quernstone",
        name = locale:get("resource_quernstone"),
        plural = locale:get("resource_quernstone_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.quernstone,
    },
    {
        key = "unfiredUrnFlour",
        name = locale:get("resource_unfiredUrnFlour"),
        plural = locale:get("resource_unfiredUrnFlour_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.unfiredUrnFlour,
    },
    {
        key = "unfiredUrnFlourRotten",
        name = locale:get("resource_unfiredUrnFlourRotten"),
        plural = locale:get("resource_unfiredUrnFlourRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.unfiredUrnFlourRotten,
    },
    {
        key = "firedUrnFlour",
        name = locale:get("resource_firedUrnFlour"),
        plural = locale:get("resource_firedUrnFlour_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrnFlour,
    },
    {
        key = "firedUrnFlourRotten",
        name = locale:get("resource_firedUrnFlourRotten"),
        plural = locale:get("resource_firedUrnFlourRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrnFlourRotten,
    },
    {
        key = "branchRotten",
        name = locale:get("resource_branch_rotten"),
        plural = locale:get("resource_branch_rotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.branchRotten,
    },
    {
        key = "breadDough",
        name = locale:get("resource_breadDough"),
        plural = locale:get("resource_breadDough_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.breadDough,
    },
    {
        key = "breadDoughRotten",
        name = locale:get("resource_breadDoughRotten"),
        plural = locale:get("resource_breadDoughRotten_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.breadDoughRotten,
    },
    {
        key = "flaxTwine",
        name = locale:get("resource_flaxTwine"),
        plural = locale:get("resource_flaxTwine_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flaxTwine,
    },
    {
        key = "flatbread",
        name = locale:get("resource_flatbread"),
        plural = locale:get("resource_flatbread_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flatbread,
    },
    {
        key = "flatbreadRotten",
        name = locale:get("resource_flatbreadRotten"),
        plural = locale:get("resource_flatbreadRotten_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.flatbreadRotten,
    },
    {
        key = "mudBrickWet",
        name = locale:get("resource_mudBrickWet"),
        plural = locale:get("resource_mudBrickWet_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mudBrickWet_sand,
    },
    {
        key = "mudBrickDry",
        name = locale:get("resource_mudBrickDry"),
        plural = locale:get("resource_mudBrickDry_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mudBrickDry_sand,
    },
    {
        key = "mudTileWet",
        name = locale:get("resource_mudTileWet"),
        plural = locale:get("resource_mudTileWet_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mudTileWet,
    },
    {
        key = "mudTileDry",
        name = locale:get("resource_mudTileDry"),
        plural = locale:get("resource_mudTileDry_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mudTileDry,
    },
    {
        key = "firedTile",
        name = locale:get("resource_firedTile"),
        plural = locale:get("resource_firedTile_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedTile,
    },
    {
        key = "firedBrick",
        name = locale:get("resource_firedBrick"),
        plural = locale:get("resource_firedBrick_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedBrick_sand,
    },
})

-- ^^^^^^^^^^^^^ WHEN ADDING RESOURCE TYPES: Dont forget to add to storage.lua ^^^^^^^^^^^^^

resource.groups = typeMaps:createMap("resourceGroup", {
    {
        key = "seed",
        name = locale:get("resource_group_seed"),
        plural = locale:get("resource_group_seed_plural"),
        resourceTypes = {},
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.beetrootSeed,
    },
    {
        key = "container",
        name = locale:get("resource_group_container"),
        plural = locale:get("resource_group_container_plural"),
        resourceTypes = {
            resource.types.unfiredUrnDry.index,
            resource.types.firedUrn.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrn,
    },
    {
        key = "urnHulledWheat",
        name = locale:get("resource_group_urnHulledWheat"),
        plural = locale:get("resource_group_urnHulledWheat_plural"),
        resourceTypes = {
            resource.types.unfiredUrnHulledWheat.index,
            resource.types.firedUrnHulledWheat.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrnHulledWheat,
    },
    {
        key = "urnFlour",
        name = locale:get("resource_group_urnFlour"),
        plural = locale:get("resource_group_urnFlour_plural"),
        resourceTypes = {
            resource.types.unfiredUrnFlour.index,
            resource.types.firedUrnFlour.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.firedUrnFlour,
    },
    {
        key = "campfireFuel",
        name = locale:get("resource_group_campfireFuel"),
        plural = locale:get("resource_group_campfireFuel_plural"),
        resourceTypes = {
            resource.types.branch.index,
            resource.types.log.index,
            resource.types.pineCone.index,
            resource.types.pineConeBig.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
    },
    {
        key = "kilnFuel",
        name = locale:get("resource_group_kilnFuel"),
        plural = locale:get("resource_group_kilnFuel_plural"),
        resourceTypes = {
            resource.types.branch.index,
            resource.types.log.index,
            resource.types.pineCone.index,
            resource.types.pineConeBig.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.birchBranch,
    },
    {
        key = "torchFuel",
        name = locale:get("resource_group_torchFuel"),
        plural = locale:get("resource_group_torchFuel_plural"),
        resourceTypes = {
            resource.types.hay.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.hay,
    },
    {
        key = "brickBinder",
        name = locale:get("resource_group_brickBinder"),
        plural = locale:get("resource_group_brickBinder_plural"),
        resourceTypes = {
            resource.types.sand.index,
            resource.types.hay.index,
        },
        containsTypesHash = {},
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.sand,
    },
})

local function createGroupHashesForBuiltInTypes()
    local validGroupTypes = typeMaps:createValidTypesArray("resourceGroup", resource.groups)
    for i,groupType in ipairs(validGroupTypes) do
        for j, resourceTypeIndex in ipairs(groupType.resourceTypes) do
            groupType.containsTypesHash[resourceTypeIndex] = true
        end
    end
end

local function updateGroupContainedTypesHashForAddition(groupTypeIndex)
    local groupType = resource.groups[groupTypeIndex]
    for i, resourceTypeIndex in ipairs(groupType.resourceTypes) do
        groupType.containsTypesHash[resourceTypeIndex] = true
    end
end

function resource:setSeedResourceTypeIndexes(seedResourceTypeIndexes)
    resource.groups.seed.resourceTypes = seedResourceTypeIndexes
    updateGroupContainedTypesHashForAddition(resource.groups.seed.index)
end

function resource:groupOrResourceMatchesResource(groupOrResourceTypeIndex, resourceTypeIndex)
    if groupOrResourceTypeIndex == resourceTypeIndex then
        return true
    end
    local resourceGroup = resource.groups[groupOrResourceTypeIndex]
    if resourceGroup then
        return resourceGroup.containsTypesHash[resourceTypeIndex]
    end
    return false
end

function resource:placheolderKeyForGroupOrResource(groupOrResourceTypeIndex)
    local resourceGroup = resource.groups[groupOrResourceTypeIndex]
    if resourceGroup then
        return resourceGroup.key
    end
    return resource.types[groupOrResourceTypeIndex].key
end

function resource:stringForResourceTypeAndCount(typeIndex, count)
    local resourceType = resource.types[typeIndex]
    if count == 1 then
        return string.format("%d %s", count, resourceType.name)
    end

    return string.format("%d %s", count, resourceType.plural)
end

function resource:stringForResourceGroupTypeAndCount(groupTypeIndex, count)
    local resourceGroupType = resource.groups[groupTypeIndex]
    if count == 1 then
        return string.format("%d %s", count, resourceGroupType.name)
    end

    return string.format("%d %s", count, resourceGroupType.plural)
end


function resource:stringForResourceTypeAndCountWithRequiredCount(typeIndex, count, requiredCount)
    local resourceType = resource.types[typeIndex]
    if count == 1 then
        return string.format("%d/%d %s", count, requiredCount, resourceType.name)
    end

    return string.format("%d/%d %s", count, requiredCount, resourceType.plural)
end

function resource:outputStringFromOutputs(outputs)
    local outputsString = ""
    for resourceTypeIndex, count in pairs(outputs) do
        local resourceString = self:stringForResourceTypeAndCount(resourceTypeIndex, count)
        outputsString = outputsString .. resourceString
        if next(outputs, resourceTypeIndex) ~= nil then
            outputsString = outputsString .. ", "
        end
    end

    return outputsString
end

function resource:stringForListOfResourceTypes(resourceTypes)
    local outputsString = ""
    for i,resourceTypeIndex in ipairs(resourceTypes) do
        local resourceType = resource.types[resourceTypeIndex]
        local resourceString = resourceType.plural
        outputsString = outputsString .. resourceString
        if i < #resourceTypes then
            outputsString = outputsString .. ", "
        end
    end

    return outputsString
end

function resource:mjInit()
    resource.validTypes = typeMaps:createValidTypesArray("resource", resource.types)
    createGroupHashesForBuiltInTypes()

    resource.alphabeticallyOrderedTypes = {}
    
    for i,resourceType in ipairs(resource.validTypes) do
        table.insert(resource.alphabeticallyOrderedTypes, resourceType)
    end
    
    
    local function sortByName(a,b)
        return a.name < b.name
    end

    table.sort(resource.alphabeticallyOrderedTypes, sortByName)
end

return resource