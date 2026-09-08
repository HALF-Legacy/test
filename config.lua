Config = {}

-- ====================================================
-- [ 1. ОСНОВНЫЕ НАСТРОЙКИ ]
-- ====================================================
Config.MinSpawnDistance = 60
Config.MaxSpawnDistance = 250
Config.DespawnDistance = 300

Config.Blackout = false
Config.MuteAmbience = false
Config.NotHealthRecharge = true

-- Настройки динамической дистанции (урезание дальности при высокой скорости)
Config.DynamicSpawnDistance = {
    enabled = true,
    speedThreshold = 90.0, -- Скорость (км/ч), при которой урезается дистанция
    multiplier = 0.5       -- Множитель (0.5 = урезать дистанции в 2 раза)
}

-- ====================================================
-- [ 1.1 УПРАВЛЕНИЕ ТРАФИКОМ И ПЕДАМИ (РУЧНЫЕ ПЕРЕКЛЮЧАТЕЛИ) ]
-- ====================================================
-- ВНЕ SafeZone (Зомби-мир)
Config.NoPeds = false                  -- Отключить обычных пешеходов вне SafeZone
Config.NoPedsScenario = false          -- Отключить пешеходов в сценариях вне SafeZone
Config.NoTraffic = false               -- Отключить движущийся трафик вне SafeZone
Config.NoTrafficParking = false        -- Отключить припаркованные машины вне SafeZone

-- ВНУТРИ SafeZone (Безопасные зоны)
Config.NoPedsSafeZone = false          -- Отключить обычных пешеходов в SafeZone
Config.NoPedsScenarioSafeZone = false  -- Отключить пешеходов в сценариях в SafeZone
Config.NoTrafficSafeZone = false       -- Отключить движущийся трафик в SafeZone
Config.NoTrafficParkingSafeZone = false-- Отключить припаркованные машины в SafeZone

-- ====================================================
-- [ 2. ПЛОТНОСТЬ МИРА (DENSITY) ]
-- ====================================================

-- Плотность спавна в SafeZone
Config.SafeZoneDensity = {
	ped = 1.0,               -- Обычные пешеходы в сейфзоне
	scenarioInterior = 1.0,  -- Сценарии пешеходов (интерьеры)
	vehicle = 0.3,           -- Машины в сейфзоне
	randomVehicle = 1.0,     -- Случайные машины в сейфзоне
	parkedVehicle = 0.3,     -- Припаркованные машины в сейфзоне
}

-- Плотность ВНЕ SafeZone (зомби-мир)
Config.WorldDensity = {
	ped = 0.5,               -- Пешеходы вне сейфзоны (0 = нет живых)
	scenarioPed = 0.5,       -- Сценарные пешеходы
	vehicle = 0.01,           -- Машины вне сейфзоны (0.1 = редкие брошенные)
	randomVehicle = 0.01,     -- Случайные машины
	parkedVehicle = 1.0,    -- Припаркованные машины
}


-- ====================================================
-- [ 3. НАСТРОЙКИ ЗОМБИ (ПОВЕДЕНИЕ И БОЙ) ]
-- ====================================================
Config.ZombieRunSpeed = 2.5                  -- Скорость бега зомби (2.5 = быстрее игрока, L4D стиль)
Config.CloseRangeCombatDistance = 3.0        -- Дистанция рукопашного боя (метры)
Config.ZombiesUseLadders = true              -- Зомби могут использовать лестницы
Config.ZombiesUseClimbovers = true           -- Зомби могут перелезать через заборы, машины, крыши

-- Взаимодействие с транспортом перенесено в настройки классов

-- Сигнализация и Орда (Left 4 Dead style)
Config.CarAlarmHordeEnabled = true               -- Включить привлечение/спавн Орды на звук сигнализации
Config.CarAlarmHordeCount = 8                    -- Количество дополнительных зомби орды
Config.CarAlarmAttractRadius = 120.0             -- Радиус привлечения ВСЕХ находящихся поблизости зомби

-- Приманки (Pipe Bomb)
Config.PipeBombAttractEnabled = true             -- Зомби сбегаются на брошенную пищащую бомбу
Config.PipeBombAttractRadius = 65.0              -- Радиус привлечения зомби к бомбе (метры)
Config.DefaultPipeBombAttractRadius = 65.0
Config.PipeBombBeepDuration = 40

-- Оружие и пропы-приманки (PipeBomb / Proximity Mine)
Config.PipeBombModels = {
	GetHashKey("w_ex_pipebomb"),
	GetHashKey("w_ex_proxmine"),
	GetHashKey("prop_prx_mine_01"),
	GetHashKey("p_prox_mine_01_s"),
	GetHashKey("prop_bomb_01"),
	GetHashKey("prop_ld_bomb"),
	-17345401,   -- Proximity Mine из игры
	1716188406,  -- w_ex_pipebomb
	-142055724,  -- w_ex_proxmine
	-1165979207, -- prop_prx_mine_01
	601007887    -- p_prox_mine_01_s
}
Config.PipeBombWeaponHash = GetHashKey("WEAPON_PROXMINE")

-- Глобальные дефолтные значения (используются, если они не указаны в классе)
Config.DefaultZombieWalks = { "move_m@drunk@verydrunk" }
Config.DefaultZombieScenarios = { "WORLD_HUMAN_STUPOR", "WORLD_HUMAN_STUPOR", "WORLD_HUMAN_VOMITING", "WORLD_HUMAN_DRUG_OVERDOSE" }
Config.DefaultZombieSenses = { 
    stealthRange = 3.0, 
    seeingRange = 25.0,
    multipliers = {
        loud = 2.0,
        shooting = 3.2,
        light = 2.4,
        fastVehicle = 4.0,
        hearingWithoutLOS = 1.5
    }
}
Config.DefaultZombieHealth = 200
Config.DefaultZombieRunSpeed = 2.5
Config.DefaultZombieCombatMovement = 3
Config.DefaultZombieVehicleDamage = 2.0 -- Урон транспорту по умолчанию (двигатель/кузов)
Config.DefaultZombieMeleeClipset = "melee@unarmed@streamed_core" -- Нативный стиль ближнего боя по умолчанию

-- Анимации поедания трупов (Eating)
Config.EatingAnimations = {
    ["l4d-common"] = {
        { dict = "amb@world_human_bum_wash@male@low@idle_a", name = "idle_b" },
        { dict = "zombies_animations", name = "biting_01" },
        { dict = "zombies_animations", name = "biting_02" }
    },
    ["resident"] = {
        { dict = "zombies_animations", name = "biting_01" },
        { dict = "zombies_animations", name = "biting_02" },
        { dict = "amb@world_human_bum_wash@male@low@idle_a", name = "idle_b" }
    },
    ["freakers"] = {
        { dict = "zombies_animations", name = "biting_01" },
        { dict = "zombies_animations", name = "biting_02" }
    },
    ["animal"] = {
        { dict = "creatures@deer@amb@world_deer_grazing@base", name = "base" },
        { dict = "creatures@boar@amb@world_boar_rooting@base", name = "base" },
        { dict = "creatures@rottweiler@amb@world_dog_eating@base", name = "base" },
        { dict = "creatures@cougar@amb@world_cougar_rest@base", name = "base" }
    }
}

Config.EatingDuration = 15000 -- Время (в мс), необходимое для полного съедения трупа (15 сек)

-- Модели обглоданных трупов (во что превращается труп после съедения)
Config.EatenCorpses = {
    {
        model = "u_m_y_zombie_01",
        components = {
            -- { componentId, drawable, texture }
            { 0, 1, 0 }, -- Голова/Лицо
            { 3, 2, 0 }, -- Торс/Руки
            { 4, 1, 0 }, -- Ноги
            { 8, 0, 0 }  -- Аксессуары
        }
    },
    {
        model = "u_f_y_corpse_01",
        components = {
            { 0, 0, 0 },
            { 3, 0, 0 },
            { 4, 0, 0 }
        }
    }
}

-- ====================================================
-- [ 4. АТМОСФЕРА И ТРАФИК ]
-- ====================================================

-- Защищенные модели транспорта (Зомби-мод не будет их ломать, удалять водителей и делать заброшенными)
-- Вписывай сюда названия машин копов, медиков, лодок, поездов и т.д.
Config.ProtectedVehicles = {
    "police",
    "police2",
    "police3",
    "police4",
    "ambulance",
    "firetruk",
    "polmav",
    "predator"
}

-- Защищенные модели прицепов (Не удалять и не обрабатывать как обычный трафик)
Config.ProtectedTrailers = {
    "boattrailer",
    "trailersmall",
    "trailerlogs",
    "trailers",
    "tvtrailer"
}

-- Защищенные модели копов (NPC, которые считаются настоящими копами для системы розыска)
Config.ProtectedCops = {
    "s_m_y_cop_01",
    "s_m_y_sheriff_01",
    "s_m_y_hwaycop_01",
    "s_m_y_ranger_01",
    "s_m_y_swat_01",
    "s_m_m_marine_01"
}

-- Модели бронированного/защищенного транспорта, из которого зомби не смогут вытащить игрока
-- Зомби не смогут разбить окно и применить анимацию вытаскивания на этих машинах
-- Достаточно добавить spawn name модели — дистанция подхода и точка удара считаются автоматически по габаритам (GetModelDimensions)
Config.NoPullVehicles = {
    "rhino",
    "insurgent",
    "insurgent2",
    "riot",
    "polavengo",
    "khanjali"
}

-- Настройки заброшенного траффика
Config.AbandonedTraffic = true -- Включить систему заброшенного траффика вне safezone
Config.AbandonedTrafficDamageMin = 0.3 -- Минимальный урон (0.0-1.0)
Config.AbandonedTrafficDamageMax = 0.8 -- Максимальный урон (0.0-1.0)
Config.AbandonedTrafficDoorChance = 20 -- % шанс открытой двери/капота/багажника
Config.AbandonedTrafficWindowChance = 40 -- % шанс разбитого окна
Config.AbandonedTrafficCorpseChance = 30 -- % шанс трупа внутри
Config.AbandonedTrafficProcessRadius = 350 -- Радиус обработки от игрока (метры)
Config.AbandonedTrafficExitDelay = 10 -- Задержка (сек) применения трафика после выхода из Safezone

-- Состояние брошенных машин в движении
Config.AbandonedTrafficEngineChance = 35 -- % шанс что двигатель работает
Config.AbandonedTrafficLightChance = 45 -- % шанс что фары горят
Config.AbandonedTrafficHazardChance = 25 -- % шанс аварийки
Config.AbandonedTrafficSirenChance = 15 -- % шанс мигалок (если спецтранспорт)
Config.AbandonedTrafficRadioChance = 40 -- % шанс что в спецтранспорте играет рация/статический шум
Config.AbandonedTrafficCivilianRadioChance = 15 -- % шанс что в обычном авто играет радио (требует включенный двигатель)
Config.AbandonedTrafficDirtMin = 5.0              -- Минимальное загрязнение кузова (0.0 - 15.0)
Config.AbandonedTrafficDirtMax = 15.0             -- Максимальное загрязнение кузова (0.0 - 15.0)

-- Настройки заброшенного припаркованного транспорта (БЕЗ фар, аварийки и заведенных двигателей)
Config.ParkedAbandonedTraffic = true              -- Включить состаривание припаркованных авто вне SafeZone
Config.ParkedAbandonedTrafficChance = 60         -- % шанс что стоячая машина станет заброшенной
Config.ParkedTrafficDamageMin = 0.3              -- Минимальный урон кузова/двигателя (0.0-1.0)
Config.ParkedTrafficDamageMax = 0.8              -- Максимальный урон кузова/двигателя (0.0-1.0)
Config.ParkedTrafficDoorChance = 25              -- % шанс открытых дверей/капота/багажника
Config.ParkedTrafficWindowChance = 45            -- % шанс разбитых стекол
Config.ParkedTrafficCorpseChance = 20            -- % шанс трупа на сиденье
Config.ParkedTrafficDirtMin = 8.0                -- Минимальное загрязнение кузова (0.0 - 15.0)
Config.ParkedTrafficDirtMax = 15.0               -- Максимальное загрязнение кузова (0.0 - 15.0)

-- Радиостанции для заброшенных авто
Config.AbandonedTrafficRadioStations = {
    "RADIO_01_CLASS_ROCK", "RADIO_02_POP", "RADIO_03_HIPHOP_NEW", "RADIO_04_PUNK", "RADIO_05_TALK_01"
}

-- Режимы разрешения трафика: "safezone" (только в сейфзоне), "world" (только вне сейфзон), "global" (везде), "disabled" (отключено)
Config.PoliceChasesMode = "global"
Config.AirTrafficMode = "global"

-- ====================================================
-- [ 5. ВЫЖИВШИЕ И БАНДИТЫ (NPC) ]
-- ====================================================
Config.PedProcessRadius = 150 -- Радиус обработки NPC
Config.PedCorpseChance = 15 -- % шанс что NPC будет мертв (уже труп)

-- Из оставшихся 85% живых:
Config.PedBanditChance = 13 -- % что это бандит (атакует всех, крадет авто)
Config.PedArmedChance = 10 -- % что это вооруженный выживший (защищается)

-- Оружие выживших NPC
Config.BanditWeapons = {"WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTRIFLE"}
Config.SurvivorWeapons = {"WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTRIFLE", "WEAPON_CARBINERIFLE"}
Config.PanicWeapons = {"WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN", "WEAPON_MICROSMG"}

-- Отношения фракций/отрядов к игроку в зависимости от работы
-- Здесь указаны дефолтные группы отношений GTA 5 + кастомные (SURVIVOR, BANDIT)
Config.GroupRelationships = {
	["BANDIT"] = {
		["police"] = "hostile",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["SURVIVOR"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["COP"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["MEDIC"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["FIREMAN"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["ARMY"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["CIVMALE"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["CIVFEMALE"] = {
		["police"] = "neutral",
		["ambulance"] = "neutral",
		["default"] = "neutral"
	},
	["DEALER"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["PRISONER"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["AMBIENT_GANG_LOST"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["AMBIENT_GANG_HILLBILLY"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["AMBIENT_GANG_BALLAS"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["AMBIENT_GANG_MEXICAN"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["AMBIENT_GANG_FAMILY"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["AMBIENT_GANG_SALVA"] = {
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["GANG_1"] = { -- Ballas
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["GANG_2"] = { -- Vagos
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["GANG_9"] = { -- Lost MC
		["police"] = "hostile",
		["default"] = "neutral"
	},
	["GANG_10"] = { -- Families
		["police"] = "hostile",
		["default"] = "neutral"
	}
}

-- Отношения между самими NPC группировками (Кто с кем воюет или дружит)
-- Возможные уровни отношений: 'hostile' (вражда) или 'neutral' (нейтрально)
Config.NPCRelationships = {
	-- Зомби ненавидят всех людей
	{group1 = "ZOMBIES", group2 = "PLAYER", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "SURVIVOR", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "BANDIT", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "COP", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "MEDIC", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "FIREMAN", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "ARMY", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "CIVMALE", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "CIVFEMALE", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "DEALER", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "PRISONER", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "AMBIENT_GANG_LOST", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "AMBIENT_GANG_HILLBILLY", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "AMBIENT_GANG_BALLAS", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "AMBIENT_GANG_MEXICAN", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "AMBIENT_GANG_FAMILY", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "AMBIENT_GANG_SALVA", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "GANG_1", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "GANG_2", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "GANG_9", relation = "hostile"},
	{group1 = "ZOMBIES", group2 = "GANG_10", relation = "hostile"},

	-- Отношения между бандами, копами и выжившими
	{group1 = "BANDIT", group2 = "SURVIVOR", relation = "neutral"},
	{group1 = "BANDIT", group2 = "COP", relation = "hostile"},
	{group1 = "BANDIT", group2 = "ARMY", relation = "hostile"},
	{group1 = "BANDIT", group2 = "CIVMALE", relation = "neutral"},
	{group1 = "BANDIT", group2 = "CIVFEMALE", relation = "neutral"},

	{group1 = "SURVIVOR", group2 = "COP", relation = "neutral"},
	{group1 = "SURVIVOR", group2 = "ARMY", relation = "neutral"},
	{group1 = "SURVIVOR", group2 = "CIVMALE", relation = "neutral"},
	{group1 = "SURVIVOR", group2 = "CIVFEMALE", relation = "neutral"},

	-- Враждующие банды
	{group1 = "GANG_1", group2 = "GANG_2", relation = "hostile"}, -- Ballas vs Vagos
	{group1 = "GANG_1", group2 = "GANG_10", relation = "hostile"}, -- Ballas vs Families
	{group1 = "GANG_2", group2 = "GANG_10", relation = "hostile"}, -- Vagos vs Families
	
	{group1 = "AMBIENT_GANG_BALLAS", group2 = "AMBIENT_GANG_MEXICAN", relation = "hostile"},
	{group1 = "AMBIENT_GANG_BALLAS", group2 = "AMBIENT_GANG_FAMILY", relation = "hostile"},
	{group1 = "AMBIENT_GANG_MEXICAN", group2 = "AMBIENT_GANG_FAMILY", relation = "hostile"},

	-- Вражда между разными видами зомби (Freakers vs L4D)
	{group1 = "freakers_zombie", group2 = "l4d_zombie", relation = "hostile"}
}

-- НАСТРОЙКИ ОТНОШЕНИЙ ГРУПП (ВЗАИМНАЯ ДРУЖБА)
-- Группы в этом списке не будут атаковать друг друга.
-- Freakers и L4D враждебны друг к другу, со всеми остальными классами дружат.
Config.MutualFriendships = {
    ["l4d_zombie"] = { "zanimal", "ghost", "resident_zombie" },
    ["freakers_zombie"] = { "zanimal", "ghost", "resident_zombie" },
    ["resident_zombie"] = { "l4d_zombie", "zanimal", "ghost", "freakers_zombie" },
    ["zanimal"] = { "l4d_zombie", "ghost", "resident_zombie", "freakers_zombie" },
    ["ghost"] = { "l4d_zombie", "zanimal", "resident_zombie", "freakers_zombie" }
}
-- ====================================================
-- [ 6. АТМОСФЕРНЫЕ ПРОПЫ (КРОВЬ, ОСТОВЫ МАШИН) ]
-- ====================================================

-- Настройки спавна атмосферных пропов вне SafeZone (остовы машин, мусор, ограджения и т.д.)
Config.SpawnAbandonedProps = false                 -- Включить спавн пропов в мире вне SafeZone
Config.AbandonedPropsMaxCount = 45                -- Максимальное количество пропов вокруг игрока
Config.AbandonedPropsRadius = 350                 -- Радиус спавна пропов вокруг игрока (метры)
Config.AbandonedPropsList = {
	-- === ХОРРОР: кровь, тела, органы ===
	-- (Спавнящиеся объекты GTA V, в отличие от prop_gibb_* которые внутренние рэгдолл-гибы)
	"prop_body_bag_01",           -- Мешок с трупом
	"prop_body_bag_01",           -- Мешок с трупом (дублируем для частоты)
	"ch_prop_ch_body_bag_01",     -- Мешок с трупом (казино хейст DLC)
	"hei_prop_heist_bloodbag_01", -- Мешок с кровью/кровяной пакет
	"hei_prop_heist_bloodbag_01", -- Мешок с кровью (дублируем)
	"prop_cs_meat_bone_01",       -- Кость (мясного типа, из катсцен)
	"prop_cs_meat_bone_01",       -- Кость
	"prop_cs_meat_hook",          -- Мясной крюк
	"p_cs_meat_bone_01",          -- Кость (альтернативное имя)
	"prop_hospital_stretcher",    -- Каталка из больницы
	"prop_wheelchair_01",         -- Брошенная инвалидная коляска

	-- === ОБЛОМКИ, ОСТОВЫ МАШИН И ЗАПЧАСТИ ===
	"prop_rub_carwreck_1",
	"prop_rub_carwreck_2",
	"prop_rub_carwreck_3",
	"prop_rub_carwreck_5",
	"prop_rub_buswreck",
	"prop_rub_trucwreck_1",
	"prop_rub_trucwreck_2",
	"prop_wrecked_bus",
	"prop_wheel_01",
	"prop_car_door_01",
	"prop_barricade_01a",
	"prop_rub_rubble_01",
	"prop_rub_rubble_03"
}

-- Авиация
Config.AirTrafficCrashChance = 20 -- % шанс что пролетающий самолет/вертолет упадет вне safezone

-- ====================================================
-- [ 7. ЛУТ И ПРЕДМЕТЫ ]
-- ====================================================
Config.ZombieDropLoot = true
Config.ProbabilityWeaponLoot = 3 -- 3%
Config.ProbabilityMoneyLoot = 33 -- 3-33 = 30%
Config.ProbabilityItemLoot = 53 -- 53-43-3 = 7%

--Weapons and Money are 40% and 60% is 'you not found nothing' alert, see the code to understand.
Config.WeaponLoot = {
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_PISTOL",
	"WEAPON_MACHETE",
	"WEAPON_CROWBAR",
	"WEAPON_BAT",
	"WEAPON_HATCHET"
}
Config.ItemLoot = {
	'bandage',
	'medikit'
}



Config.ObjectDropLoot = true --false if you experience low performance of server
Config.ObjectsLoot = {
    'prop_box_ammo03a'
}

Config.ProbabilityWeaponLootObject = 2 -- 2%
Config.ProbabilityMoneyLootObject = 22 -- 22-2 20%
Config.ProbabilityItemLootObject = 42 -- 52-22-2 18%
--Weapons and Money are 40% and 60% is 'you not found nothing' alert, see the code to understand.
Config.WeaponLootObject ={
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_PISTOL",
	"WEAPON_MACHETE",
	"WEAPON_CROWBAR",
	"WEAPON_BAT",
	"WEAPON_HATCHET"
}
Config.ItemLootObject = {
	'bread',
	'water'
}

-- ====================================================
-- [ 8. БЕЗОПАСНЫЕ И КРАСНЫЕ ЗОНЫ (ZONES) ]
-- ====================================================
Config.SafeZone = true
Config.SafeZoneRadioBlip = true
Config.SafeZoneCoords = {

	}

-- Автоматические безопасные зоны по названиям районов GTA 5 (Весь Лос-Сантос)
Config.SafeZoneNames = {
    -- Даунтаун и Деловой Центр (Downtown & Central)
    "DOWNT", "DTVINE", "TEXTI", "SKID", "PBOX", "LEGSQU", "BURTON", "HAWICK", "ALTA",
    
    -- Западный Лос-Сантос (West Los Santos, Rockford, Vespucci)
    "ROCKF", "MORN", "DELPE", "DELBE", "PBLUFF", "RGLEN", "RICHM", "MOVIE", "VCANA", "VESP", "BEACH", "CHU",
    
    -- Южный Лос-Сантос (South LS, Davis, Strawberry)
    "STRAW", "RANCHO", "DAVIS", "CHAMH", "BIGH",
    
    -- Восточный Лос-Сантос (East LS, La Mesa, Murrieta)
    "LMESA", "CYPRE", "EBURO", "MURRI", "MIRR", "EAST_V",
    
    -- Вайнвуд и Холмы (Vinewood & Hills)
    "VINE", "WVINE", "GOLF", "STAD", "KOREAT", "CHIL", "HORS", "LACT", "LDAM",
    
    -- Порт и Аэропорт (Airport & Port of LS)
    "AIRP", "ELYSIAN", "LOSPUER", "TERMINA", "ZP_ORT", "BANNING"
}

-- ТОЧНЫЕ ПОЛИГОНЫ ЗОН (ox_lib Zones) - Точность до сантиметра!
-- Генерируются автоматически через игровой редактор (/zonecreate, /zoneadd, /zoneundo, /zonesave)
Config.PolyZones = {
	safe = {
		{
			name = 'Fort Zancudo',
			thickness = 100.0,
			points = {
				vec3(-2564.22, 3320.09, 31.69),
				vec3(-2350.78, 3447.90, 30.97),
				vec3(-2215.00, 3504.37, 29.46),
				vec3(-2005.48, 3434.38, 31.35),
				vec3(-1657.73, 3228.99, 34.89),
				vec3(-1567.60, 3096.31, 31.14),
				vec3(-1582.10, 2972.08, 33.28),
				vec3(-1641.81, 2895.17, 29.52),
				vec3(-1567.44, 2791.63, 18.00),
				vec3(-1584.60, 2771.74, 18.29),
				vec3(-1669.07, 2870.57, 29.34),
				vec3(-1708.88, 2820.07, 32.75),
				vec3(-1733.38, 2809.99, 32.73),
				vec3(-1796.99, 2806.06, 32.87),
				vec3(-1826.28, 2755.09, 30.86),
				vec3(-1848.34, 2757.37, 32.33),
				vec3(-2024.27, 2805.11, 32.80),
				vec3(-2064.48, 2780.58, 31.77),
				vec3(-2117.59, 2785.96, 32.77),
				vec3(-2138.11, 2799.19, 32.36),
				vec3(-2182.39, 2855.24, 31.84),
				vec3(-2284.49, 2917.95, 32.01),
				vec3(-2347.39, 2934.94, 32.80),
				vec3(-2406.37, 2919.80, 32.81),
				vec3(-2442.39, 2885.97, 33.28),
				vec3(-2511.00, 2925.38, 32.39),
				vec3(-2541.42, 3057.19, 32.84),
				vec3(-2763.25, 3188.49, 32.43),
				vec3(-2818.00, 3259.07, 32.80),
				vec3(-2894.38, 3307.98, 32.61),
				vec3(-2853.20, 3388.93, 32.62),
				vec3(-2837.37, 3399.75, 30.36),
				vec3(-2760.13, 3357.37, 32.79),
				vec3(-2732.83, 3354.54, 32.64),
				vec3(-2670.21, 3377.92, 31.15)
			}
		}
	},
	redZone = {
    { name = 'Tunnel Zancudo', 
      thickness = 100.0, 
      points = {
               vec3(-2604.33, 2909.99, 16.69),
               vec3(-2630.72, 2913.63, 16.69),
               vec3(-2574.48, 3479.11, 14.15),
               vec3(-2521.88, 3556.29, 15.16),
               vec3(-2482.81, 3537.67, 14.94)
               }
}

	}


}

-- =====================================
-- НАСТРОЙКИ КРАСНЫХ ЗОН (БЕЗ БРОШЕННОГО ТРАФИКА)
-- =====================================
-- Имена районов GTA V (GetNameOfZone), где заброшенный трафик СТРОГО ЗАПРЕЩЕН
Config.RedZoneNames = {
	-- Пример: "AIRP", "ARMY"

}

-- Ручные координаты SafeZone (сохранены, но закомментированы в конфиге)
-- Config.SafeZoneCoords = {
-- 	{x = -221.970520, y = -525.402710, z = 34.275810, radio = 1200}, -- Лос-Анджелес
-- 	{x = 1118.490234, y = -528.973206, z = 63.002319, radio = 300}, -- Никола-Авенью
-- 	{x = 1000.776917, y = 136.772583, z = 80.990456, radio = 300}, -- Казино
-- 	{x = 1021.554626, y = -201.143661, z = 70.246422, radio = 300}, -- Миррор Парк
-- 	{x = 980.305847, y = -3105.701660, z = 5.579880, radio = 400}, -- Буканир-вей
-- 	{x = -1096.738770, y = -2673.554688, z = 13.459760, radio = 1000}, -- Нью-Эмпайр бей (Аэропорт)
-- 	{x = -1255.148193, y = -1478.372559, z = 4.035913, radio = 700}, -- Агуха-стрит (Пляж)
-- 	{x = -1752.939819, y = -566.202759, z = 37.118721, radio = 600}, -- Бей-Сити (Пляж)
-- 	{x = -2057.626709, y = 3157.861816, z = 32.363007, radio = 400}, -- Армейская база
-- }

Config.Debug = false

-- ====================================================
-- [ 9. КЛАССЫ И МОДЕЛИ (CLASSES & MODELS) ]
-- ====================================================

Config.CorpseModels = {
		"A_M_M_AfriAmer_01", "A_M_M_Beach_01", "A_M_M_Beach_02", "A_M_M_BevHills_01", "A_M_M_BevHills_02",
		"A_M_M_Business_01", "A_M_M_EastSA_01", "A_M_M_EastSA_02", "A_M_M_Farmer_01", "A_M_M_FatLatin_01",
		"A_M_M_GenFat_01", "A_M_M_GenFat_02", "A_M_M_Golfer_01", "A_M_M_HasJew_01", "A_M_M_Hillbilly_01",
		"A_M_M_Hillbilly_02", "A_M_M_Indian_01", "A_M_M_KTown_01", "A_M_M_Malibu_01", "A_M_M_MexCntry_01",
		"A_M_M_MexLabor_01", "A_M_M_OG_Boss_01", "A_M_M_Paparazzi_01", "A_M_M_Polynesian_01", "A_M_M_ProlHost_01",
		"A_M_M_RurMeth_01", "A_M_M_Salton_01", "A_M_M_Salton_02", "A_M_M_Salton_03", "A_M_M_Salton_04",
		"A_M_M_Skater_01", "A_M_M_Skidrow_01", "A_M_M_SoCenLat_01", "A_M_M_SouCent_01", "A_M_M_SouCent_02",
		"A_M_M_SouCent_03", "A_M_M_SouCent_04", "A_M_M_StLat_02", "A_M_M_Tennis_01", "A_M_M_Tourist_01",
		"A_M_M_TrampBeac_01", "A_M_M_Tramp_01", "A_M_M_TranVest_01", "A_M_M_TranVest_02", "A_M_O_ACult_01",
		"A_M_O_ACult_02", "A_M_O_Beach_01", "A_M_O_GenStreet_01", "A_M_O_KTown_01", "A_M_O_Salton_01",
		"A_M_O_SouCent_01", "A_M_O_SouCent_02", "A_M_O_SouCent_03", "A_M_O_Tramp_01", "A_M_Y_ACult_02",
		"A_M_Y_BeachVesp_01", "A_M_Y_BeachVesp_02", "A_M_Y_Beach_01", "A_M_Y_Beach_02", "A_M_Y_Beach_03",
		"A_M_Y_BevHills_01", "A_M_Y_BevHills_02", "A_M_Y_BreakDance_01", "A_M_Y_BusiCas_01", "A_M_Y_Business_01",
		"A_M_Y_Business_02", "A_M_Y_Business_03", "A_M_Y_Cyclist_01", "A_M_Y_DHill_01", "A_M_Y_Downtown_01",
		"A_M_Y_EastSA_01", "A_M_Y_EastSA_02", "A_M_Y_Epsilon_01", "A_M_Y_Epsilon_02", "A_M_Y_Gay_01",
		"A_M_Y_Gay_02", "A_M_Y_GenStreet_01", "A_M_Y_GenStreet_02", "A_M_Y_Golfer_01", "A_M_Y_HasJew_01",
		"A_M_Y_Hiker_01", "A_M_Y_Hippy_01", "A_M_Y_Hipster_01", "A_M_Y_Hipster_02", "A_M_Y_Hipster_03",
		"A_M_Y_Indian_01", "A_M_Y_Jetski_01", "A_M_Y_Juggalo_01", "A_M_Y_KTown_01", "A_M_Y_KTown_02",
		"A_M_Y_Latino_01", "A_M_Y_MethHead_01", "A_M_Y_MexThug_01", "A_M_Y_MotoX_01", "A_M_Y_MotoX_02",
		"A_M_Y_MusclBeac_01", "A_M_Y_MusclBeac_02", "A_M_Y_Polynesian_01", "A_M_Y_RoadCyc_01", "A_M_Y_Runner_01",
		"A_M_Y_Runner_02", "A_M_Y_Salton_01", "A_M_Y_Skater_01", "A_M_Y_Skater_02", "A_M_Y_SouCent_01",
		"A_M_Y_SouCent_02", "A_M_Y_SouCent_03", "A_M_Y_SouCent_04", "A_M_Y_StBla_01", "A_M_Y_StBla_02",
		"A_M_Y_StLat_01", "A_M_Y_StWhi_01", "A_M_Y_StWhi_02", "A_M_Y_Sunbathe_01", "A_M_Y_Surfer_01",
		"A_M_Y_VinDouche_01", "A_M_Y_Vinewood_01", "A_M_Y_Vinewood_02", "A_M_Y_Vinewood_03", "A_M_Y_Vinewood_04",
		"A_M_Y_Yoga_01", "G_M_M_ArmBoss_01", "G_M_M_ArmGoon_01", "G_M_M_ArmLieut_01", "G_M_M_ChemWork_01",
		"G_M_M_ChiBoss_01", "G_M_M_ChiCold_01", "G_M_M_ChiGoon_01", "G_M_M_ChiGoon_02", "G_M_M_KorBoss_01",
		"G_M_M_MexBoss_01", "G_M_M_MexBoss_02", "G_M_Y_ArmGoon_02", "G_M_Y_Azteca_01", "G_M_Y_BallaEast_01",
		"G_M_Y_BallaOrig_01", "G_M_Y_BallaSout_01", "G_M_Y_FamCA_01", "G_M_Y_FamDNF_01", "G_M_Y_FamFor_01",
		"G_M_Y_Korean_01", "G_M_Y_Korean_02", "G_M_Y_KorLieut_01", "G_M_Y_Lost_01", "G_M_Y_Lost_02",
		"G_M_Y_Lost_03", "G_M_Y_MexGang_01", "G_M_Y_MexGoon_01", "G_M_Y_MexGoon_02", "G_M_Y_MexGoon_03",
		"G_M_Y_PoloGoon_01", "G_M_Y_PoloGoon_02", "G_M_Y_SalvaBoss_01", "G_M_Y_SalvaGoon_01", "G_M_Y_SalvaGoon_02",
		"G_M_Y_SalvaGoon_03", "G_M_Y_StrPunk_01", "G_M_Y_StrPunk_02", "IG_Bankman", "IG_Barry", "IG_BestMen",
		"IG_Beverly", "IG_Car3guy1", "IG_Car3guy2", "IG_Chef", "IG_ChengSr", "IG_ChrisFormage", "IG_Clay",
		"IG_ClayPain", "IG_Cletus", "IG_Dale", "IG_Dreyfuss", "IG_FBISuit_01", "IG_Groom", "IG_Hao", "IG_Hunter",
		"IG_JimmyBoston", "IG_JoeMinuteMan", "IG_Josef", "IG_Josh", "IG_LifeInvad_01", "IG_LifeInvad_02",
		"IG_Nigel", "IG_Old_Man1A", "IG_Old_Man2", "IG_ONeil", "IG_Ortega", "IG_Paper", "IG_Priest",
		"IG_ProlSec_02", "IG_Ramp_Gang", "IG_Ramp_Hic", "IG_Ramp_Hipster", "IG_Ramp_Mex", "IG_RoccoPelosi",
		"IG_RussianDrunk", "IG_Screen_Writer",
		-- Спецслужбы (Копы, Медики, Пожарные, Спецназ, Военные)
		"s_m_y_cop_01", "s_m_y_sheriff_01", "s_m_y_hwaycop_01", "s_m_y_ranger_01", "s_m_y_swat_01",
		"s_m_m_paramedic_01", "s_m_y_autopsy", "s_m_m_doctor_01", "s_m_y_fireman_01", "s_m_y_marine_01", "s_m_m_armored_01",
		-- Городские службы (Газовики, Строители, Механики, Мусорщики, Почта, HAZMAT)
		"s_m_y_construct_01", "s_m_y_construct_02", "s_m_m_dockwork_01", "s_m_y_garbage", "s_m_y_wammotech_01",
		"s_m_y_automan_01", "s_m_y_mechanic_08", "s_m_m_postal_01", "s_m_y_pestcont_01", "s_m_m_trucker_01", "s_m_m_security_01",
		-- Женские
		"A_F_M_Beach_01", "A_F_M_BevHills_01", "A_F_M_BevHills_02", "A_F_M_BodyBuild_01", "A_F_M_Business_02",
		"A_F_M_Downtown_01", "A_F_M_EastSA_01", "A_F_M_EastSA_02", "A_F_M_FatBla_01", "A_F_M_FatCult_01",
		"A_F_M_FatWhite_01", "A_F_M_KTown_01", "A_F_M_KTown_02", "A_F_M_ProlHost_01", "A_F_M_Salton_01",
		"A_F_M_SkidRow_01", "A_F_M_SouCentMC_01", "A_F_M_SouCent_01", "A_F_M_SouCent_02", "A_F_M_Tourist_01",
		"A_F_M_TrampBeac_01", "A_F_M_Tramp_01", "A_F_O_GenStreet_01", "A_F_O_Indian_01", "A_F_O_KTown_01",
		"A_F_O_Salton_01", "A_F_O_SouCent_01", "A_F_O_SouCent_02", "A_F_Y_Beach_01", "A_F_Y_BevHills_01",
		"A_F_Y_BevHills_02", "A_F_Y_BevHills_03", "A_F_Y_BevHills_04", "A_F_Y_Business_01", "A_F_Y_Business_02",
		"A_F_Y_Business_03", "A_F_Y_Business_04", "A_F_Y_EastSA_01", "A_F_Y_EastSA_02", "A_F_Y_EastSA_03",
		"A_F_Y_Epsilon_01", "A_F_Y_Fitness_01", "A_F_Y_Fitness_02", "A_F_Y_GenHot_01", "A_F_Y_Golfer_01",
		"A_F_Y_Hiker_01", "A_F_Y_Hippie_01", "A_F_Y_Hipster_01", "A_F_Y_Hipster_02", "A_F_Y_Hipster_03",
		"A_F_Y_Hipster_04", "A_F_Y_Indian_01", "A_F_Y_Juggalo_01", "A_F_Y_Runner_01", "A_F_Y_RurMeth_01",
		"A_F_Y_SCDressy_01", "A_F_Y_Skater_01", "A_F_Y_SouCent_01", "A_F_Y_SouCent_02", "A_F_Y_SouCent_03",
		"A_F_Y_Tennis_01", "A_F_Y_Topless_01", "A_F_Y_Tourist_01", "A_F_Y_Tourist_02", "A_F_Y_Vinewood_01",
		"A_F_Y_Vinewood_02", "A_F_Y_Vinewood_03", "A_F_Y_Vinewood_04", "A_F_Y_Yoga_01", "G_F_Y_ballas_01",
		"G_F_Y_Families_01", "G_F_Y_Lost_01", "G_F_Y_Vagos_01", "IG_Abigail", "IG_Ashley", "IG_Bride",
		"IG_Janet", "IG_JewelAss", "IG_KerryMcIntosh", "IG_Magenta", "IG_Marnie", "IG_MaryAnn", "IG_Maude",
		"IG_Michelle", "IG_MrsPhillips", "IG_MRS_Thornhill", "IG_Natalia", "IG_Talina", "IG_Tanisha",
		-- Женские спецслужбы и рабочие
		"s_f_y_cop_01", "s_f_y_sheriff_01", "s_f_y_ranger_01", "s_f_y_scrubs_01", "s_f_y_dockwork_01",
		-- Прочее
	        "ig_skeleton_01", "ig_zombie_dj_01", "ig_gustavo_02", "g_m_m_zombie_05", "g_m_m_zombie_04",
                "mp_f_deadhooker"
}

-- Базовая зона спавна по умолчанию ("global" - весь мир)
Config.DefaultSpawnZone = "global"

-- Классы Зомби (Модели, Звуки, Поведение)
Config.Classes = {
    ["l4d-common"] = {
        spawnEnable = true, -- Включить/выключить спавн класса
        spawnZone = "global", -- "global" (весь мир) или "zone" (по районам и полигонам ниже)
        names = {
            -- "DOWNT", "TEXTI", "SKID"
        },
        polyzone = {
            -- { name = "CityZone", points = { vec3(0,0,0), vec3(1,1,1) } }
        },
        walkRun = false, -- true = только ходьба (шаг), false = дефолт движка (может бегать)
        spawnTime = "Any", -- Время спавна: "Night", "Day", "Any"
        spawnLimit = 3,
        spawnFrequency = "high", -- Частота спавна (таймаут между спавнами): "high" (0с), "average" (10с), "low" (30с), "very low" (2м)
        eating = true, -- Зомби будут поедать трупы
        vehicleAttack = true, -- Могут ли атаковать игроков в транспорте
        vehicleDamage = 2.0, -- Урон транспорту (двигатель/кузов за один удар)
        models = {
            male = {
                "A_M_M_AfriAmer_01", "A_M_M_Beach_01", "A_M_M_Beach_02", "A_M_M_BevHills_01", "A_M_M_BevHills_02",
                "A_M_M_Business_01", "A_M_M_EastSA_01", "A_M_M_EastSA_02", "A_M_M_Farmer_01", "A_M_M_FatLatin_01",
                "A_M_M_GenFat_01", "A_M_M_GenFat_02", "A_M_M_Golfer_01", "A_M_M_HasJew_01", "A_M_M_Hillbilly_01",
                "A_M_M_Hillbilly_02", "A_M_M_Indian_01", "A_M_M_KTown_01", "A_M_M_Malibu_01", "A_M_M_MexCntry_01",
                "A_M_M_MexLabor_01", "A_M_M_OG_Boss_01", "A_M_M_Paparazzi_01", "A_M_M_Polynesian_01", "A_M_M_ProlHost_01",
                "A_M_M_RurMeth_01", "A_M_M_Salton_01", "A_M_M_Salton_02", "A_M_M_Salton_03", "A_M_M_Salton_04",
                "A_M_M_Skater_01", "A_M_M_Skidrow_01", "A_M_M_SoCenLat_01", "A_M_M_SouCent_01", "A_M_M_SouCent_02",
                "A_M_M_SouCent_03", "A_M_M_SouCent_04", "A_M_M_StLat_02", "A_M_M_Tennis_01", "A_M_M_Tourist_01",
                "A_M_M_TrampBeac_01", "A_M_M_Tramp_01", "A_M_M_TranVest_01", "A_M_M_TranVest_02", "A_M_O_ACult_01",
                "A_M_O_ACult_02", "A_M_O_Beach_01", "A_M_O_GenStreet_01", "A_M_O_KTown_01", "A_M_O_Salton_01",
                "A_M_O_SouCent_01", "A_M_O_SouCent_02", "A_M_O_SouCent_03", "A_M_O_Tramp_01", "A_M_Y_ACult_02",
                "A_M_Y_BeachVesp_01", "A_M_Y_BeachVesp_02", "A_M_Y_Beach_01", "A_M_Y_Beach_02", "A_M_Y_Beach_03",
                "A_M_Y_BevHills_01", "A_M_Y_BevHills_02", "A_M_Y_BreakDance_01", "A_M_Y_BusiCas_01", "A_M_Y_Business_01",
                "A_M_Y_Business_02", "A_M_Y_Business_03", "A_M_Y_DHill_01", "A_M_Y_Downtown_01",
                "A_M_Y_EastSA_01", "A_M_Y_EastSA_02", "A_M_Y_Epsilon_01", "A_M_Y_Epsilon_02", "A_M_Y_Gay_01",
                "A_M_Y_Gay_02", "A_M_Y_GenStreet_01", "A_M_Y_GenStreet_02", "A_M_Y_Golfer_01", "A_M_Y_HasJew_01",
                "A_M_Y_Hippy_01", "A_M_Y_Hipster_01", "A_M_Y_Hipster_02", "A_M_Y_Hipster_03",
                "A_M_Y_Indian_01", "A_M_Y_Jetski_01", "A_M_Y_Juggalo_01", "A_M_Y_KTown_01", "A_M_Y_KTown_02",
                "A_M_Y_Latino_01", "A_M_Y_MethHead_01", "A_M_Y_MexThug_01", "A_M_Y_MotoX_01", "A_M_Y_MotoX_02",
                "A_M_Y_MusclBeac_01", "A_M_Y_MusclBeac_02", "A_M_Y_Polynesian_01", "A_M_Y_RoadCyc_01",
                "A_M_Y_Salton_01", "A_M_Y_Skater_01", "A_M_Y_Skater_02", "A_M_Y_SouCent_01",
                "A_M_Y_SouCent_02", "A_M_Y_SouCent_03", "A_M_Y_SouCent_04", "A_M_Y_StBla_01", "A_M_Y_StBla_02",
                "A_M_Y_StLat_01", "A_M_Y_StWhi_01", "A_M_Y_StWhi_02", "A_M_Y_Sunbathe_01", "A_M_Y_Surfer_01",
                "A_M_Y_VinDouche_01", "A_M_Y_Vinewood_01", "A_M_Y_Vinewood_02", "A_M_Y_Vinewood_03", "A_M_Y_Vinewood_04",
                "A_M_Y_Yoga_01", "G_M_M_ArmBoss_01", "G_M_M_ArmGoon_01", "G_M_M_ArmLieut_01",
                "G_M_M_ChiBoss_01", "G_M_M_ChiCold_01", "G_M_M_ChiGoon_01", "G_M_M_ChiGoon_02", "G_M_M_KorBoss_01",
                "G_M_M_MexBoss_01", "G_M_M_MexBoss_02", "G_M_Y_ArmGoon_02", "G_M_Y_Azteca_01", "G_M_Y_BallaEast_01",
                "G_M_Y_BallaOrig_01", "G_M_Y_BallaSout_01", "G_M_Y_FamCA_01", "G_M_Y_FamDNF_01", "G_M_Y_FamFor_01",
                "G_M_Y_Korean_01", "G_M_Y_Korean_02", "G_M_Y_KorLieut_01", "G_M_Y_Lost_01", "G_M_Y_Lost_02",
                "G_M_Y_Lost_03", "G_M_Y_MexGang_01", "G_M_Y_MexGoon_01", "G_M_Y_MexGoon_02", "G_M_Y_MexGoon_03",
                "G_M_Y_PoloGoon_01", "G_M_Y_PoloGoon_02", "G_M_Y_SalvaBoss_01", "G_M_Y_SalvaGoon_01", "G_M_Y_SalvaGoon_02",
                "G_M_Y_SalvaGoon_03", "G_M_Y_StrPunk_01", "G_M_Y_StrPunk_02", "IG_Bankman", "IG_Barry", "IG_BestMen",
                "IG_Beverly", "IG_Car3guy1", "IG_Car3guy2", "IG_Chef", "IG_ChengSr", "IG_ChrisFormage", "IG_Clay",
                "IG_ClayPain", "IG_Cletus", "IG_Dale", "IG_Dreyfuss", "IG_FBISuit_01", "IG_Groom", "IG_Hao", "IG_Hunter",
                "IG_JimmyBoston", "IG_JoeMinuteMan", "IG_Josef", "IG_Josh", "IG_LifeInvad_01", "IG_LifeInvad_02",
                "IG_Nigel", "IG_Old_Man1A", "IG_Old_Man2", "IG_ONeil", "IG_Ortega", "IG_Paper", "IG_Priest",
                "IG_ProlSec_02", "IG_Ramp_Gang", "IG_Ramp_Hic", "IG_Ramp_Hipster", "IG_Ramp_Mex", "IG_RoccoPelosi",
                "IG_RussianDrunk", "IG_Screen_Writer",
                "s_m_m_paramedic_01",
                -- Городские службы
                "s_m_y_garbage", "s_m_y_wammotech_01",
                "s_m_y_automan_01", "s_m_y_mechanic_08", "s_m_m_postal_01", "s_m_m_trucker_01",
                -- Прочее
                "ig_zombie_dj_01", "ig_gustavo_02", "g_m_m_zombie_05", "g_m_m_zombie_04"
            },
            female = {
                "A_F_M_Beach_01", "A_F_M_BevHills_01", "A_F_M_BevHills_02", "A_F_M_BodyBuild_01", "A_F_M_Business_02",
                "A_F_M_Downtown_01", "A_F_M_EastSA_01", "A_F_M_EastSA_02", "A_F_M_FatBla_01", "A_F_M_FatCult_01",
                "A_F_M_FatWhite_01", "A_F_M_KTown_01", "A_F_M_KTown_02", "A_F_M_ProlHost_01", "A_F_M_Salton_01",
                "A_F_M_SkidRow_01", "A_F_M_SouCentMC_01", "A_F_M_SouCent_01", "A_F_M_SouCent_02", "A_F_M_Tourist_01",
                "A_F_M_TrampBeac_01", "A_F_M_Tramp_01", "A_F_O_GenStreet_01", "A_F_O_Indian_01", "A_F_O_KTown_01",
                "A_F_O_Salton_01", "A_F_O_SouCent_01", "A_F_O_SouCent_02", "A_F_Y_Beach_01", "A_F_Y_BevHills_01",
                "A_F_Y_BevHills_02", "A_F_Y_BevHills_03", "A_F_Y_BevHills_04", "A_F_Y_Business_01", "A_F_Y_Business_02",
                "A_F_Y_Business_03", "A_F_Y_Business_04", "A_F_Y_EastSA_01", "A_F_Y_EastSA_02", "A_F_Y_EastSA_03",
                "A_F_Y_Epsilon_01", "A_F_Y_GenHot_01", "A_F_Y_Golfer_01",
                "A_F_Y_Hippie_01", "A_F_Y_Hipster_01", "A_F_Y_Hipster_02", "A_F_Y_Hipster_03",
                "A_F_Y_Hipster_04", "A_F_Y_Indian_01", "A_F_Y_Juggalo_01", "A_F_Y_RurMeth_01",
                "A_F_Y_SCDressy_01", "A_F_Y_Skater_01", "A_F_Y_SouCent_01", "A_F_Y_SouCent_02", "A_F_Y_SouCent_03",
                "A_F_Y_Tennis_01", "A_F_Y_Topless_01", "A_F_Y_Tourist_01", "A_F_Y_Tourist_02", "A_F_Y_Vinewood_01",
                "A_F_Y_Vinewood_02", "A_F_Y_Vinewood_03", "A_F_Y_Vinewood_04", "A_F_Y_Yoga_01", "G_F_Y_ballas_01",
                "G_F_Y_Families_01", "G_F_Y_Lost_01", "G_F_Y_Vagos_01", "IG_Abigail", "IG_Ashley", "IG_Bride",
                "IG_Janet", "IG_JewelAss", "IG_KerryMcIntosh", "IG_Magenta", "IG_Marnie", "IG_MaryAnn", "IG_Maude",
                "IG_Michelle", "IG_MrsPhillips", "IG_MRS_Thornhill", "IG_Natalia", "IG_Talina", "IG_Tanisha",
                -- Прочее
                "mp_f_deadhooker"
            }
        },
        -- СПЕЦИАЛИЗИРОВАННЫЕ ПОДТИПЫ МОДЕЛЕЙ (UNCOMMON INFECTED)
        uncommon = {
            deaf = { -- Строители в наушниках: глухие к бомбам и сиренам
                spawnEnable = true,
                spawnZone = "global", -- "global" или "zone"
                names = { -- "AIRP", "TERMINA", "PORT"
                },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "s_m_y_construct_01", "s_m_y_construct_02", "s_m_y_airworker", "s_m_y_winclean_01", "s_m_m_dockwork_01" },
                female = { "s_f_y_dockwork_01" },
                reactions = { carAlarms = false, bombs = false }
            },
            hazmat = { -- CEDA / Химзащита: огнеупорные
                spawnEnable = true,
                spawnZone = "global", -- "global" или "zone"
                names = { -- "HUMANELABS", "TATAMO"
                },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "s_m_m_chemwork_01", "s_m_m_scientist_01", "s_m_m_doctor_01", "s_m_y_autopsy", "s_m_y_pestcont_01" },
                female = { "s_f_y_scrubs_01" },
                immuneToFire = true
            },
            armored = { -- Броневики / SWAT / Военные: тяжелая броня
                spawnEnable = true,
                spawnZone = "global", -- "global" или "zone"
                names = { -- "ARMYB", "PRISON"
                },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "s_m_y_swat_01", "s_m_y_marine_01", "s_m_y_marine_02", "s_m_y_marine_03", "s_m_y_blackops_01", "s_m_y_blackops_02", "s_m_m_prisguard_01", "s_m_y_prisguard_01", "s_m_m_highsec_01", "s_m_m_highsec_02", "s_m_m_security_01", "s_m_m_armored_01" },
                female = {},
                armour = 100
            },
            fireman = { -- Пожарные: огнеупорность + повышенное хп
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "s_m_y_fireman_01" },
                female = {},
                immuneToFire = true,
                health = 300
            },
            cops = { -- Полиция: легкая броня
                spawnEnable = true,
                spawnZone = "global", -- "global" или "zone"
                names = { -- "DOWNT", "MISSIONB", "TEXTI"
                },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "s_m_y_cop_01", "s_m_y_sheriff_01", "s_m_y_hwaycop_01", "s_m_y_ranger_01" },
                female = { "s_f_y_cop_01", "s_f_y_sheriff_01", "s_f_y_ranger_01" },
                armour = 50
            },
            clowns = { -- Клоуны: привлекают толпу
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "s_m_y_clown_01", "s_m_m_strperf_01", "s_m_y_mime" },
                female = {},
                clownAttract = true
            },
            runners = { -- Спортсмены: супербыстрый спринт
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "a_m_y_runner_01", "a_m_y_runner_02", "a_m_y_cyclist_01" },
                female = { "a_f_y_runner_01", "a_f_y_fitness_01", "a_f_y_fitness_02" },
                runSpeed = 3.2
            },
            scavengers = { -- Падшие выжившие: ценный лут
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "u_m_y_militarybum", "s_m_m_cntrybar_01", "a_m_y_hiker_01" },
                female = { "a_f_y_hiker_01" },
                lootBonus = true
            }
        },
        -- НАСТРОЙКИ ЗВУКОВ
        sounds = {
            useCustom = true,                            -- Использовать ли кастомные звуки (true) или дефолтные игровые (false)
            audioBank = "audiodirectory/l4d_common_audio", -- Путь к банку звуков (если требуется загрузка)
            audioRef = "l4d_common_sounds",              -- Название аудио-референса (Event из банка)
            alertChance = 30,                            -- Шанс (в %) издать звук тревоги при обнаружении вместо ярости
            idleChance = 5,                              -- Шанс (в %) издать звук бормотания в спокойном состоянии
            male = {
                prefix = "m_",                           -- Префикс перед названием файла (например: m_rage_at_victim)
                -- Настройки генерации имен звуков (если не используются пулы)
                idle = { breathing = 14, moaning = 9, mumbling = 8 }, 
                alert = { count = 6, base = "alert", startIdx = 50 },
                rage = { count = 18, base = "rage_at_victim", startIdx = 20 },
                pain = { count = 8, base = "been_shot_", startIdx = 30 },
                death = { count = 10, base = "death_", startIdx = 40 }
            },
            female = {
                prefix = "f_",                           -- Префикс для женских звуков (например: f_rage_at_victim)
                idle = { breathing = 14, moaning = 9, mumbling = 8 },
                alert = { count = 6, base = "alert", startIdx = 50 },
                rage = { count = 18, base = "rage_at_victim", startIdx = 20 },
                pain = { count = 8, base = "been_shot_", startIdx = 30 },
                death = { count = 10, base = "death_", startIdx = 40 }
            },
            durations = {                                -- Длительность проигрывания (в мс) [min, max]
                idle = {1500, 1500},
                rage = {1800, 2800},
                alert = {1000, 1500},
                pain = {500, 800},
                death = {1000, 1800}
            },
            -- Конкретные названия аудио-эвентов для случайного воспроизведения
            pools = {
                breathing = { -- Спокойное дыхание
                    "breathing01", "breathing08", "breathing09", "breathing10", "breathing13", "breathing16", "breathing18", "breathing25", "breathing26",
                    "idle_breath_01", "idle_breath_02", "idle_breath_03", "idle_breath_04", "idle_breath_06"
                },
                moaning = { -- Стоны (редко)
                    "moan01", "moan02", "moan03", "moan04", "moan05", "moan06", "moan07", "moan08", "moan09"
                },
                mumbling = { -- Бормотание
                    "mumbling01", "mumbling02", "mumbling03", "mumbling04", "mumbling05", "mumbling06", "mumbling07", "mumbling08"
                },
                alert_generic = { -- Реакция на шум (без префикса пола)
                    "alert13", "alert16", "alert22", "alert23", "alert25", "alert26", "alert27", "alert36", 
                    "alert37", "alert38", "alert39", "alert40", "alert41", "alert42", "alert43", "alert44"
                }
            },
            lipsync = {                                  -- Настройки анимации лица (мимики) при звуках
                enabled = true,                          -- Включена ли лицевая анимация
                dictMale = "facials@gen_male@base",      -- Словарь для мужчин
                dictFemale = "facials@gen_female@base",  -- Словарь для женщин
                moodIdle = "mood_normal_1",              -- Эмоция покоя
                moodRage = "mood_angry_1",               -- Эмоция ярости/атаки
                moodPain = "pain_1",                     -- Эмоция боли/смерти
                chatterDict = "mp_facial",               -- Словарь движения губ
                chatterAnim = "mic_chatter"              -- Анимация движения губ
            }
        },
        muteDefault = true,
        headshot = true,
        headshotOnly = false,
        
        -- СТИЛИ ПОХОДКИ (Анимации движения зомби в спокойном состоянии)
        walks = {
            "move_m@drunk@verydrunk",
            "move_m@drunk@moderatedrunk",
            "move_m@drunk@a",
            "anim_group_move_ballistic",
            "move_lester_CaneUp",
        },
        
        -- СЦЕНАРИИ БЕЗДЕЙСТВИЯ (idle)
        idle = {
            wander = true,               -- Разрешить зомби бесцельно бродить (TaskWanderStandard)
            infighting = true,           -- Разрешить драки между собой в Idle
            infightingChance = 20,       -- Шанс (в %), что зомби нападут друг на друга
            infightingRadius = 6.0,      -- Радиус поиска соперника (в метрах)
            scenarios = {                -- Список сценариев для проигрывания на месте
                "WORLD_HUMAN_STUPOR", 
                "WORLD_HUMAN_VOMITING", 
                "WORLD_HUMAN_DRUG_OVERDOSE"
            }
        },
        
        -- НАСТРОЙКИ БОЯ И ДВИЖЕНИЯ (АГРЕССИЯ)
        combat = {
            ability = 100,               -- Боевая способность (100 = максимум агрессии)
            range = 0,                   -- Дистанция боя (0 = ближний бой, только рукопашка)
            movement = false,            -- false = не трогать SetPedCombatMovement (как animal). 0-3 = stationary..flank
            runSpeed = 2.5,              -- Множитель скорости бега (TaskGoToEntity / MoveRateOverride)
            moveBlendRatio = 2.0,        -- Интенсивность анимации бега
            flee = false,                -- Убегает ли пед (false = бесстрашный)
            preferMelee = true,          -- Флаг 100: предпочитать ближний бой
            enableWeaponBlocking = false,-- Разрешить блочить атаки (false = принимает урон лицом)
            group = "l4d_zombie"         -- Группа отношений (кто свой, а кто враг)
        },
        
        -- ОРГАНЫ ЧУВСТВ И ОБНАРУЖЕНИЕ
        senses = {
            seeingRange = 100.0,         -- Дальность зрения (в метрах)
            hearingRange = 100.0,        -- Дальность слуха
            idRange = 100.0,             -- Дальность распознавания (идентификации)
            alertness = 3                -- Бдительность (3 = максимальная, реагирует на всё)
        },
        
        -- РЕАКЦИИ НА ИВЕНТЫ (Приманки и орды)
        reactions = {
            carAlarms = true,            -- Реагирует ли на сигнализацию машин (и спавнится ли в орде)
            bombs = true                 -- Бежит ли на звук мин и пайп-бомб
        },
        
        -- ФИЗИЧЕСКИЕ ПАРАМЕТРЫ И ВИЗУАЛ
        physical = {
            useLadders = true,           -- Использование лестниц
            useClimbovers = true,        -- Перелезание через заборы, машины, крыши
            canRagdoll = true,           -- Может ли падать (тряпичная кукла) при столкновении/выстреле
            disableSwimming = true,      -- Тонет ли в воде (true = тонет камнем)
            damagePacks = {              -- Визуальные эффекты ранений (кровь, ссадины)
                "BigHitByVehicle", 
                "SCR_Dumpster", 
                "SCR_Torture" 
            }
        }
    },

    ["animal"] = {
        spawnEnable = true, -- Включить/выключить спавн класса
        spawnZone = "global", -- "global" или "zone"
        names = {},
        polyzone = {},
        walkRun = false, -- true = только ходьба (шаг), false = дефолт движка (может бегать)
        spawnTime = "Any", -- Время спавна: "Night", "Day", "Any"
        spawnLimit = 3,
        spawnFrequency = "average", -- Частота спавна: "high" (0с), "average" (10с), "low" (30с), "very low" (2м)
        eating = true, -- Животные будут поедать трупы
        vehicleAttack = true, -- Могут ли атаковать игроков в транспорте
        vehicleDamage = 2.0, -- Урон транспорту (двигатель/кузов за один удар)
        models = {
            male = { "a_c_coyote_02" },
            female = {} -- Оставим пустым, для животных чаще всего достаточно male массива
        },
        -- СПЕЦИАЛИЗИРОВАННЫЕ ПОДТИПЫ ЖИВОТНЫХ
        uncommon = {
            deer = { -- Олени / рогатые
                spawnEnable = true,
                spawnZone = "zone",
                names = { "MTCHIL", "TONGVAH", "PALETO", "TATAMO", "CCREAK" },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.5,
                health = 300,
                male = { "a_c_deer_02" },
                female = {}
            },
            boar = { -- Кабаны
                spawnEnable = true,
                spawnZone = "zone",
                names = { "SANDY", "GRAPES", "HARMO", "CANNY" },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 3.0,
                health = 350,
                male = { "a_c_boar_02" },
                female = {}
            },
            mtlion = { -- Пумы / горные львы
                spawnEnable = true,
                spawnZone = "zone",
                names = { "MTCHIL", "TONGVAH", "CANNY", "PALETO", "CHIL" },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.0,
                male = { "a_c_mtlion_02" },
                female = {}
            },
            chimp = { -- Обезьяны
                spawnEnable = true,
                spawnZone = "zone",
                names = { "PALHIGH", "MTGORDO" },
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 1.5,
                male = { "a_c_chimp_02" },
                female = {}
            }
        },
        -- НАСТРОЙКИ ЗВУКОВ
        sounds = {
            useCustom = false,                           -- Использовать ли кастомные звуки (true) или дефолтные игровые (false)
            -- audioBank = "audiodirectory/z_animals_audio", -- Путь к банку звуков (если требуется загрузка)
            -- audioRef = "z_animals_sounds",              -- Название аудио-референса (Event из банка)
            male = {
                prefix = "m_",                           -- Префикс перед названием файла (например: m_rage_at_victim)
                -- Настройки генерации имен звуков
                idle = { breathing = 0, moaning = 0, mumbling = 0 },
                alert = { count = 0, base = "alert", startIdx = 1 },
                rage = { count = 0, base = "rage", startIdx = 1 },
                pain = { count = 0, base = "pain", startIdx = 1 },
                death = { count = 0, base = "death", startIdx = 1 }
            },
            female = {
                prefix = "f_",                           -- Префикс для женских звуков
                idle = { breathing = 0, moaning = 0, mumbling = 0 },
                alert = { count = 0, base = "alert", startIdx = 1 },
                rage = { count = 0, base = "rage", startIdx = 1 },
                pain = { count = 0, base = "pain", startIdx = 1 },
                death = { count = 0, base = "death", startIdx = 1 }
            },
            durations = {                                -- Длительность проигрывания (в мс) [min, max]
                idle = {1500, 1500},
                rage = {1800, 2800},
                alert = {1000, 1500},
                pain = {500, 800},
                death = {1000, 1800}
            },
            -- Конкретные названия аудио-эвентов для случайного воспроизведения
            pools = {
                breathing = {},                          -- Спокойное дыхание
                moaning = {},                            -- Стоны (редко)
                mumbling = {},                           -- Бормотание
                alert_generic = {}                       -- Реакция на шум (без префикса пола)
            },
            lipsync = {
                enabled = false                          -- Животным мимика не нужна
            }
        },
        muteDefault = true,
        headshot = true,
        headshotOnly = true,
        
        walks = false, -- Не ломаем базовую походку животного
        
        idle = {
            wander = true,
            infighting = true,           -- Животные могут грызться между собой в стае
            infightingChance = 20,
            infightingRadius = 6.0,
            scenarios = {}
        },
        combat = {
            ability = 100,
            range = 0,
            movement = false,            -- Не ломаем боевой мувсет животного
            runSpeed = false,            -- Не переопределяем скорость искусственно
            moveBlendRatio = 2.0,
            flee = false,
            preferMelee = true,
            enableWeaponBlocking = false,
            group = "zanimal"            -- В одной группе с животными
        },
        senses = {
            seeingRange = 150.0,         -- Зрение у животных лучше
            hearingRange = 150.0,        -- Слух острее
            idRange = 150.0,
            alertness = 3
        },
        reactions = {
            carAlarms = false,           -- Животные пугаются машин, в орду не собираются
            bombs = false                -- На бомбы не бегут
        },
        physical = {
            useLadders = false,          -- Животные не лазают по лестницам
            useClimbovers = false,       -- Животные не перелезают через заборы/машины
            canRagdoll = true,
            disableSwimming = false,     -- Животные могут плавать
            damagePacks = { "BigHitByVehicle" }
        }
    },

    ["ghost"] = {
        spawnEnable = true, -- Включить/выключить спавн класса
        walkRun = true, -- true = только ходьба (шаг), false = дефолт движка (может бегать)
        spawnTime = "Night", -- Время спавна: "Night", "Day", "Any"
        spawnLimit = 3,
        spawnFrequency = "very low", -- Частота спавна: "high" (0с), "average" (10с), "low" (30с), "very low" (2м)
        eating = false, -- Призракам не нужно есть
        vehicleAttack = false, -- Призраки не атакуют транспорт
        models = {
            male = { "u_f_m_drowned_01" },
            female = { "u_f_y_corpse_01", "a_f_m_skidrow_01" }
        },
        -- НАСТРОЙКИ ЗВУКОВ
        sounds = {
            useCustom = false,                           -- Использовать ли кастомные звуки (true) или дефолтные игровые (false)
            -- audioBank = "audiodirectory/ghost_audio",     -- Путь к банку звуков (если требуется загрузка)
            -- audioRef = "ghost_sounds",                  -- Название аудио-референса (Event из банка)
            male = {
                prefix = "m_",                           -- Префикс перед названием файла (например: m_rage_at_victim)
                -- Количество вариантов каждого звука (от 1 до указанного числа)
                idle = { breathing = 0, moaning = 0, mumbling = 0 },
                alert = 0, rage = 0, pain = 0, death = 0
            },
            female = {
                prefix = "f_",                           -- Префикс для женских звуков
                idle = { breathing = 0, moaning = 0, mumbling = 0 },
                alert = 0, rage = 0, pain = 0, death = 0
            },
            -- Конкретные названия аудио-эвентов для случайного воспроизведения
            pools = {
                breathing = {},                          -- Спокойное дыхание
                moaning = {},                            -- Стоны (редко)
                mumbling = {},                           -- Бормотание
                alert_generic = {}                       -- Реакция на шум (без префикса пола)
            },
            lipsync = {
                enabled = false                          -- Призракам мимика не нужна
            }
        },
        muteDefault = true,
        headshot = false,
        headshotOnly = false,
        ghostAlpha = 150,                -- Максимальная видимость (0-255)
        fadeDistance = 10.0,             -- Дистанция начала исчезновения при приближении (в метрах)
        anomalyDamage = 25,              -- Урон (как в Метро 2033), если подойти вплотную
        anomalyRadius = 3.0,             -- Радиус удара аномалии
        
        npcReactions = {
            "ignore",                    -- NPC не замечают призрака
            "surprise",                  -- NPC вскрикивают от удивления, но идут дальше
            "flee"                       -- NPC в ужасе убегают
        },
        
        walks = {
            "move_m@injured"             -- Призраки еле волочат ноги
        },
        
        idle = {
            wander = true,               -- Разрешить бесцельно бродить
            scenarios = {
                "WORLD_HUMAN_STUPOR"     -- Призрак стоит в ступоре
            }
        },
        combat = {
            ability = 0,                 -- Призраки не умеют драться
            range = 0,
            movement = 1,                -- Медленный шаг
            runSpeed = 0.5,              -- Очень медленные
            moveBlendRatio = 1.0,
            flee = true,                 -- Могут "пугаться" (хотя мы их удаляем)
            preferMelee = false,
            enableWeaponBlocking = false,
            group = "ghost"              -- Отдельная группа (чтобы зомби их не трогали или трогали - настраивается отдельно)
        },
        senses = {
            seeingRange = 20.0,
            hearingRange = 10.0,
            idRange = 20.0,
            alertness = 0
        },
        reactions = {
            carAlarms = false,           -- Призракам плевать на сигнализацию
            bombs = false                -- Призракам плевать на бомбы
        },
        physical = {
            useLadders = false,          -- Призраки не лазают по лестницам
            useClimbovers = false,       -- Призраки не перелезают через заборы/машины
            canRagdoll = false,          -- Призраки не падают, проходят сквозь пули (если отключить коллизию)
            invincible = true,           -- Призраки бессмертны к пулям
            disableSwimming = true,
            damagePacks = {}             -- Без крови
        }
    },

    ["resident"] = {
        spawnEnable = false, -- Включить/выключить спавн класса
        spawnZone = "global", -- "global" или "zone"
        names = {
            -- "PALETO", "SANDY", "GRAPES"
        },
        polyzone = {},
        walkRun = true, -- true = только ходьба (шаг), false = дефолт движка (может бегать)
        spawnTime = "Any", -- Время спавна: "Night", "Day", "Any"
        spawnLimit = 6,
        spawnFrequency = "high", -- Частота спавна: "high" (0с), "average" (10с), "low" (30с), "very low" (2м)
        eating = true, -- Зомби будут поедать трупы
        vehicleAttack = true, -- Могут ли атаковать игроков в транспорте
        vehicleDamage = 1.5, -- Урон транспорту (двигатель/кузов за один удар)
        models = {
            male = {
                "A_M_M_AfriAmer_01", "A_M_M_Beach_01", "A_M_M_Beach_02", "A_M_M_BevHills_01", "A_M_M_BevHills_02",
                "A_M_M_Business_01", "A_M_M_EastSA_01", "A_M_M_EastSA_02", "A_M_M_Farmer_01", "A_M_M_FatLatin_01",
                "A_M_M_GenFat_01", "A_M_M_GenFat_02", "A_M_M_Golfer_01", "A_M_M_HasJew_01", "A_M_M_Hillbilly_01",
                "A_M_M_Hillbilly_02", "A_M_M_Indian_01", "A_M_M_KTown_01", "A_M_M_Malibu_01", "A_M_M_MexCntry_01",
                "A_M_M_MexLabor_01", "A_M_M_OG_Boss_01", "A_M_M_Paparazzi_01", "A_M_M_Polynesian_01", "A_M_M_ProlHost_01",
                "A_M_M_RurMeth_01", "A_M_M_Salton_01", "A_M_M_Salton_02", "A_M_M_Salton_03", "A_M_M_Salton_04",
                "A_M_M_Skater_01", "A_M_M_Skidrow_01", "A_M_M_SoCenLat_01", "A_M_M_SouCent_01", "A_M_M_SouCent_02",
                "A_M_M_SouCent_03", "A_M_M_SouCent_04", "A_M_M_StLat_02", "A_M_M_Tennis_01", "A_M_M_Tourist_01",
                "A_M_M_TrampBeac_01", "A_M_M_Tramp_01", "A_M_M_TranVest_01", "A_M_M_TranVest_02", "A_M_O_ACult_01",
                "A_M_O_ACult_02", "A_M_O_Beach_01", "A_M_O_GenStreet_01", "A_M_O_KTown_01", "A_M_O_Salton_01",
                "A_M_O_SouCent_01", "A_M_O_SouCent_02", "A_M_O_SouCent_03", "A_M_O_Tramp_01", "A_M_Y_ACult_02",
                "A_M_Y_BeachVesp_01", "A_M_Y_BeachVesp_02", "A_M_Y_Beach_01", "A_M_Y_Beach_02", "A_M_Y_Beach_03",
                "A_M_Y_BevHills_01", "A_M_Y_BevHills_02", "A_M_Y_BreakDance_01", "A_M_Y_BusiCas_01", "A_M_Y_Business_01",
                "A_M_Y_Business_02", "A_M_Y_Business_03", "A_M_Y_Cyclist_01", "A_M_Y_DHill_01", "A_M_Y_Downtown_01",
                "A_M_Y_EastSA_01", "A_M_Y_EastSA_02", "A_M_Y_Epsilon_01", "A_M_Y_Epsilon_02", "A_M_Y_Gay_01",
                "A_M_Y_GenStreet_01", "A_M_Y_GenStreet_02", "A_M_Y_Golfer_01", "A_M_Y_HasJew_01", "A_M_Y_Hiker_01",
                "A_M_Y_Hippy_01", "A_M_Y_Hipster_01", "A_M_Y_Hipster_02", "A_M_Y_Hipster_03", "A_M_Y_Indian_01",
                "A_M_Y_Jetski_01", "A_M_Y_Juggalo_01", "A_M_Y_KTown_01", "A_M_Y_KTown_02", "A_M_Y_Latino_01",
                "A_M_Y_MethHead_01", "A_M_Y_MexCntry_01", "A_M_Y_MexThug_01", "A_M_Y_Motox_01", "A_M_Y_Motox_02",
                "A_M_Y_MusclBeac_01", "A_M_Y_MusclBeac_02", "A_M_Y_Polynesian_01", "A_M_Y_RoadCyc_01", "A_M_Y_Runner_01",
                "A_M_Y_Runner_02", "A_M_Y_Salton_01", "A_M_Y_Skater_01", "A_M_Y_Skater_02", "A_M_Y_SouCent_01",
                "A_M_Y_SouCent_02", "A_M_Y_StBla_01", "A_M_Y_StBla_02", "A_M_Y_StLat_01", "A_M_Y_StWhi_01",
                "A_M_Y_StWhi_02", "A_M_Y_Sunbathe_01", "A_M_Y_Surfer_01", "A_M_Y_Tattoo_01", "A_M_Y_Tennis_01",
                "A_M_Y_Tourist_01", "A_M_Y_Tourist_02", "A_M_Y_Vindouche_01", "A_M_Y_Vinewood_01", "A_M_Y_Vinewood_02",
                "A_M_Y_Vinewood_03", "A_M_Y_Vinewood_04", "A_M_Y_Yoga_01", "G_M_M_ArmBoss_01", "G_M_M_ArmGoon_01",
                "G_M_M_ArmLieut_01", "G_M_M_ChemWork_01", "G_M_M_ChiBoss_01", "G_M_M_ChiGoon_01", "G_M_M_ChiGoon_02",
                "G_M_M_KorBoss_01", "G_M_M_MexBoss_01", "G_M_M_MexBoss_02", "G_M_Y_ArmGoon_02", "G_M_Y_Azteca_01",
                "G_M_Y_Ballaeast_01", "G_M_Y_BallaOrig_01", "G_M_Y_BallaSout_01", "G_M_Y_FamCA_01", "G_M_Y_FamDNF_01",
                "G_M_Y_FamFor_01", "G_M_Y_Korean_01", "G_M_Y_Korean_02", "G_M_Y_KorLieut_01", "G_M_Y_Lost_01",
                "G_M_Y_Lost_02", "G_M_Y_Lost_03", "G_M_Y_MexGang_01", "G_M_Y_MexGoon_01", "G_M_Y_MexGoon_02",
                "G_M_Y_MexGoon_03", "G_M_Y_PoloGoon_01", "G_M_Y_PoloGoon_02", "G_M_Y_SalvaBoss_01", "G_M_Y_SalvaGoon_01",
                "G_M_Y_SalvaGoon_02", "G_M_Y_SalvaGoon_03", "G_M_Y_StrPunk_01", "G_M_Y_StrPunk_02", "HC_Driver",
                "HC_Gunman", "HC_Hacker", "IG_Abner", "IG_Bankman", "IG_Barry", "IG_BestMen", "IG_Beverly",
                "IG_Car3guy1", "IG_Car3guy2", "IG_Casey", "IG_Chef", "IG_Chef2", "IG_ClayPain", "IG_Clay_Shero",
                "IG_Cletus", "IG_Cole", "IG_Dale", "IG_DaveNorton", "IG_Dom", "IG_Dreyfuss", "IG_DrFriedlander",
                "IG_Fabien", "IG_FBISuit_01", "IG_Floyd", "IG_Groom", "IG_Hao", "IG_Hunter", "IG_Jay_Norris",
                "IG_Jerry", "IG_JJJ", "IG_JoeMin", "IG_Josef", "IG_Josh", "IG_LamarDavis", "IG_Lazlow",
                "IG_LesterCrest", "IG_Lifeinvad_01", "IG_Lifeinvad_02", "IG_Manuel", "IG_Marnie", "IG_MaryAnn",
                "IG_Milton", "IG_MrK", "IG_NervousRon", "IG_Nigel", "IG_Old_Man1a", "IG_Old_Man2", "IG_Omega",
                "IG_ONeil", "IG_Orleans", "IG_Ortega", "IG_Paper", "IG_Patricia", "IG_Priest", "IG_ProlSec_02",
                "IG_Ramp_Gang", "IG_Ramp_Hic", "IG_Ramp_Hipster", "IG_Ramp_Mex", "IG_RoccoPelosi", "IG_Russel",
                "IG_SiemonYetarian", "IG_Solomon", "IG_SteveHains", "IG_Stretch", "IG_Talina", "IG_Taocheng",
                "IG_Taostranslator", "IG_TennisCoach", "IG_Terry", "IG_Tom", "IG_Tomas", "IG_TrafficWarden",
                "IG_TylerDix", "IG_Wade", "IG_Zimbor", "S_M_M_AmmuCountry", "S_M_M_AutoShop_01", "S_M_M_AutoShop_02",
                "S_M_M_Bouncer_01", "S_M_M_CIASec_01", "S_M_M_CntryBar_01",
                "S_M_M_FIBOffice_01", "S_M_M_FIBOffice_02", "S_M_M_Gaffer_01", "S_M_M_Gardener_01",
                "S_M_M_Gentransport", "S_M_M_HairDress_01", "S_M_M_HighSec_01", "S_M_M_HighSec_02", "S_M_M_Janitor",
                "S_M_M_LathWorker", "S_M_M_LifeInvad_01", "S_M_M_LineCook", "S_M_M_LSMetro_01", "S_M_M_Mariachi_01",
                "S_M_M_Marine_02", "S_M_M_Migrant_01", "S_M_M_MovAlien_01", "S_M_M_MovPrem_01",
                "S_M_M_MovSpace_01", "S_M_M_Paramedic_01", "S_M_M_Pilot_01", "S_M_M_Pilot_02", "S_M_M_Postal_01",
                "S_M_M_Postal_02", "S_M_M_Security_01", "S_M_M_SnowCop_01",
                "S_M_M_StrPerf_01", "S_M_M_StrPreach_01", "S_M_M_StrVend_01", "S_M_M_Trucker_01", "S_M_M_UPS_01",
                "S_M_M_UPS_02", "S_M_Y_AmmuCity_01", "S_M_Y_Armymech_01",
                "S_M_Y_Barman_01", "S_M_Y_Baywatch_01", "S_M_Y_BlackOps_02", "S_M_Y_BusBoy_01",
                "S_M_Y_Chef_01", "S_M_Y_Clown_01",
                "S_M_Y_Dealer_01", "S_M_Y_DevinSec_01", "S_M_Y_Doorman_01", "S_M_Y_DwService_01",
                "S_M_Y_DwService_02", "S_M_Y_Factory_01", "S_M_Y_Fireman_01", "S_M_Y_Garbage_01", "S_M_Y_Grip_01",
                "S_M_Y_Marine_02", "S_M_Y_Marine_03", "S_M_Y_MIME",
                "S_M_Y_PestCont_01", "S_M_Y_Pilot_01", "S_M_Y_Robber_01",
                "S_M_Y_ShopBounc_01", "S_M_Y_StrVend_01", "S_M_Y_USCG_01",
                "S_M_Y_Valet_01", "S_M_Y_Waiter_01", "S_M_Y_Winclean_01", "S_M_Y_XMech_01", "S_M_Y_XMech_02",
                "U_M_M_Aldinapoli", "U_M_M_BankMan", "U_M_M_BikeHire_01", "U_M_M_FIBArchitect", "U_M_M_FilmDirector",
                "U_M_M_GlenStank_01", "U_M_M_Griff_01", "U_M_M_Jesus_01", "U_M_M_JewelSec_01", "U_M_M_JewelThief",
                "U_M_M_MarkFost", "U_M_M_Partytarget", "U_M_M_ProlSec_01", "U_M_M_Promourn_01", "U_M_M_RivalPap",
                "U_M_M_SpyActor", "U_M_M_WillyFist", "U_M_O_FilmNoir", "U_M_O_FinGuru_01", "U_M_O_TapMan_01",
                "U_M_O_Tramp_01", "U_M_Y_Abner", "U_M_Y_AntonB", "U_M_Y_BabyD", "U_M_Y_Baygor", "U_M_Y_BurgerDrug_01",
                "U_M_Y_Chip", "U_M_Y_Cyclist_01", "U_M_Y_FIBMugger_01", "U_M_Y_Guido_01", "U_M_Y_GunVend_01",
                "U_M_Y_Hippy_01", "U_M_Y_ImproGuns_01", "U_M_Y_Justin", "U_M_Y_Mani",
                "U_M_Y_Paparazzi", "U_M_Y_Party_01", "U_M_Y_PissGoo_01", "U_M_Y_Prisoner_01", "U_M_Y_ProlDug_01",
                "U_M_Y_RSRanger_01", "U_M_Y_SBike", "U_M_Y_Stagg_01", "U_M_Y_Tattoo_01", "U_M_Y_Zombie_01",
                "A_M_M_SouCent_01", "A_M_M_SouCent_02", "A_M_M_SouCent_03", "A_M_M_SouCent_04", "A_M_Y_SouCent_01",
                "A_M_Y_SouCent_02", "G_M_Y_FamCA_01", "G_M_Y_FamDNF_01", "G_M_Y_FamFor_01", "G_M_Y_BallaOrig_01",
                "G_M_Y_BallaEast_01", "G_M_Y_BallaSout_01", "G_M_Y_Lost_01", "G_M_Y_Lost_02", "G_M_Y_Lost_03",
                "G_M_Y_SalvaGoon_01", "G_M_Y_SalvaGoon_02", "G_M_Y_SalvaGoon_03", "G_M_Y_MexGang_01", "G_M_Y_Azteca_01",
                "G_M_Y_Korean_01", "G_M_Y_Korean_02", "G_M_Y_StrPunk_01", "G_M_Y_StrPunk_02"
            },
            female = {
                "A_F_M_Beach_01", "A_F_M_BevHills_01", "A_F_M_BevHills_02", "A_F_M_BodyBuild_01", "A_F_M_Business_02",
                "A_F_M_Downtown_01", "A_F_M_EastSA_01", "A_F_M_EastSA_02", "A_F_M_FatBla_01", "A_F_M_FatCult_01",
                "A_F_M_FatWhite_01", "A_F_M_KTown_01", "A_F_M_KTown_02", "A_F_M_ProlHost_01", "A_F_M_Salton_01",
                "A_F_M_SkidRow_01", "A_F_M_SouCentMC_01", "A_F_M_SouCent_01", "A_F_M_SouCent_02", "A_F_M_Tourist_01",
                "A_F_M_TrampBeac_01", "A_F_M_Tramp_01", "A_F_O_GenStreet_01", "A_F_O_Indian_01", "A_F_O_KTown_01",
                "A_F_O_Salton_01", "A_F_O_SouCent_01", "A_F_O_SouCent_02", "A_F_Y_Beach_01", "A_F_Y_BevHills_01",
                "A_F_Y_BevHills_02", "A_F_Y_BevHills_03", "A_F_Y_BevHills_04", "A_F_Y_Business_01", "A_F_Y_Business_02",
                "A_F_Y_Business_03", "A_F_Y_Business_04", "A_F_Y_EastSA_01", "A_F_Y_EastSA_02", "A_F_Y_EastSA_03",
                "A_F_Y_Epsilon_01", "A_F_Y_Fitness_01", "A_F_Y_Fitness_02", "A_F_Y_GenHot_01", "A_F_Y_Golfer_01",
                "A_F_Y_Hippie_01", "A_F_Y_Hipster_01", "A_F_Y_Hipster_02", "A_F_Y_Hipster_03",
                "A_F_Y_Hipster_04", "A_F_Y_Indian_01", "A_F_Y_Juggalo_01", "A_F_Y_Runner_01", "A_F_Y_RurMeth_01",
                "A_F_Y_SCDressy_01", "A_F_Y_Skater_01", "A_F_Y_SouCent_01", "A_F_Y_SouCent_02", "A_F_Y_SouCent_03",
                "A_F_Y_Tennis_01", "A_F_Y_Topless_01", "A_F_Y_Tourist_01", "A_F_Y_Tourist_02", "A_F_Y_Vinewood_01",
                "A_F_Y_Vinewood_02", "A_F_Y_Vinewood_03", "A_F_Y_Vinewood_04", "A_F_Y_Yoga_01", "G_F_Y_ballas_01",
                "G_F_Y_Families_01", "G_F_Y_Lost_01", "G_F_Y_Vagos_01", "IG_Abigail", "IG_Ashley", "IG_Bride",
                "IG_Janet", "IG_JewelAss", "IG_KerryMcIntosh", "IG_Magenta", "IG_Marnie", "IG_MaryAnn", "IG_Maude",
                "IG_Michelle", "IG_MrsPhillips", "IG_MRS_Thornhill", "IG_Natalia", "IG_Talina", "IG_Tanisha",
                "ig_skeleton_01", "ig_zombie_dj_01", "ig_gustavo_02", "g_m_m_zombie_05", "g_m_m_zombie_04",
                "mp_f_deadhooker"
            }
        },
        -- СПЕЦИАЛИЗИРОВАННЫЕ ПОДТИПЫ МОДЕЛЕЙ RESIDENT
        uncommon = {
            deaf = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = true,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 1.5,
                male = { "s_m_y_construct_01", "s_m_y_construct_02", "s_m_y_airworker", "s_m_m_dockwork_01" },
                female = { "s_f_y_dockwork_01" },
                reactions = { carAlarms = false, bombs = false }
            },
            hazmat = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = true,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 1.5,
                male = { "s_m_m_chemwork_01", "s_m_m_scientist_01", "s_m_m_doctor_01", "s_m_y_autopsy" },
                female = { "s_f_y_scrubs_01" },
                immuneToFire = true
            },
            armored = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = true,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 1.5,
                male = { "s_m_y_swat_01", "s_m_y_marine_01", "s_m_y_blackops_01", "s_m_m_prisguard_01" },
                female = {},
                armour = 100
            },
            cops = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = true,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 1.5,
                male = { "s_m_y_cop_01", "s_m_y_sheriff_01", "s_m_y_ranger_01" },
                female = { "s_f_y_cop_01", "s_f_y_sheriff_01", "s_f_y_ranger_01" },
                armour = 50
            },
            scavengers = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = true,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 1.5,
                male = { "u_m_y_militarybum", "a_m_y_hiker_01" },
                female = { "a_f_y_hiker_01" },
                lootBonus = true
            }
        },
        sounds = {
            useCustom = false,
            male = {
                prefix = "m_",
                idle = { breathing = 14, moaning = 9, mumbling = 8 },
                alert = { count = 16, base = "alert", startIdx = 1 },
                rage = { count = 18, base = "rage_at_victim", startIdx = 20 },
                pain = { count = 8, base = "been_shot_", startIdx = 30 },
                death = { count = 10, base = "death_", startIdx = 40 }
            },
            female = {
                prefix = "f_",
                idle = { breathing = 14, moaning = 9, mumbling = 8 },
                alert = { count = 16, base = "alert", startIdx = 1 },
                rage = { count = 18, base = "rage_at_victim", startIdx = 20 },
                pain = { count = 8, base = "been_shot_", startIdx = 30 },
                death = { count = 10, base = "death_", startIdx = 40 }
            },
            durations = {
                idle = {1500, 1500},
                rage = {1800, 2800},
                alert = {1000, 1500},
                pain = {500, 800},
                death = {1000, 1800}
            },
            pools = {
                breathing = {
                    "breathing01", "breathing08", "breathing09", "breathing10", "breathing13", "breathing16", "breathing18", "breathing25", "breathing26",
                    "idle_breath_01", "idle_breath_02", "idle_breath_03", "idle_breath_04", "idle_breath_06"
                },
                moaning = {
                    "moan01", "moan02", "moan03", "moan04", "moan05", "moan06", "moan07", "moan08", "moan09"
                },
                mumbling = {
                    "mumbling01", "mumbling02", "mumbling03", "mumbling04", "mumbling05", "mumbling06", "mumbling07", "mumbling08"
                },
                alert_generic = {
                    "alert13", "alert16", "alert22", "alert23", "alert25", "alert26", "alert27", "alert36", 
                    "alert37", "alert38", "alert39", "alert40", "alert41", "alert42", "alert43", "alert44"
                }
            },
            lipsync = {
                enabled = true,
                dictMale = "facials@gen_male@base",
                dictFemale = "facials@gen_female@base",
                moodIdle = "mood_normal_1",
                moodRage = "mood_angry_1",
                moodPain = "pain_1",
                chatterDict = "mp_facial",
                chatterAnim = "mic_chatter"
            }
        },
        muteDefault = true,
        headshot = true,
        headshotOnly = true, -- Убийство строго в голову
        
        walks = {
            "clipset@anim@ingame@move_m@zombie@core",
            "clipset@anim@ingame@move_m@zombie@strafe"
        },
        
        idle = {
            wander = true,
            infighting = true,           -- Разрешить драки между собой в Idle
            infightingChance = 20,       -- Шанс (в %), что зомби нападут друг на друга
            infightingRadius = 6.0,      -- Радиус поиска соперника (в метрах)
            scenarios = {
                "WORLD_HUMAN_STUPOR", 
                "WORLD_HUMAN_VOMITING", 
                "WORLD_HUMAN_DRUG_OVERDOSE"
            },
            anims = {
                { dict = "zombies_animations", name = "idle_01" },
                { dict = "zombies_animations", name = "idle_02" },
                { dict = "zombies_animations", name = "idle_03" }
            }
        },
        combat = {
            ability = 100,
            range = 0,
            movement = false,
            runSpeed = 1.0,
            moveBlendRatio = 1.0,
            melee = { dict = "zombies_animations", name = "neck_bite" },
            flee = false,
            preferMelee = true,
            enableWeaponBlocking = false,
            group = "resident_zombie"
        },
        senses = {
            seeingRange = 40.0,
            hearingRange = 80.0,
            idRange = 40.0,
            alertness = 3,
            stealthRange = 2.0,
            multipliers = {
                crouch = 0.5,
                stealth = 0.5,
                sprint = 2.5,
                run = 1.8,
                walk = 1.0,
                shooting = 4.0,
                melee = 2.0
            }
        },
        reactions = {
            carAlarms = true,
            bombs = true
        },
        physical = {
            useLadders = false,
            useClimbovers = false,
            canRagdoll = true,
            immuneToFists = true,
            disableSwimming = true,
            damagePacks = {
                "BigHitByVehicle", 
                "SCR_Dumpster", 
                "SCR_Torture" 
            }
        }
    },

    ["freakers"] = {
        spawnEnable = true, -- Включить/выключить спавн класса
        spawnZone = "global", -- "global" или "zone"
        names = {
            -- "MTCHIL", "CANNY", "TONGVAH"
        },
        polyzone = {},
        walkRun = false, -- false = бег и спринт от движка (быстрые)
        spawnTime = "Any", -- Время спавна: "Night", "Day", "Any"
        spawnLimit = 6,
        spawnFrequency = "high", -- Частота спавна: "high" (0с), "average" (10с), "low" (30с), "very low" (2м)
        eating = true, -- Зомби будут поедать трупы
        vehicleAttack = true, -- Могут ли атаковать игроков в транспорте
        vehicleDamage = 2.5, -- Урон транспорту
        spawnAnim = {
            { dict = "anim@scripted@surv@ig2_zombie_spawn@runner@", name = "action_01" },
            { dict = "anim@scripted@surv@ig2_zombie_spawn@runner@", name = "action_02" },
            { dict = "anim@scripted@surv@ig2_zombie_spawn@runner@", name = "action_03" },
            { dict = "anim@scripted@surv@ig2_zombie_spawn@runner@", name = "action_04" }
        },
        models = {
            male = {
                "g_m_m_zombie_01",
                "g_m_m_zombie_02",
                "g_m_m_zombie_03",
                "g_m_m_zombie_04",
                "g_m_m_zombie_05",
                "u_m_y_zombie_01"
            },
            female = {
                "mp_f_deadhooker"
            }
        },
        -- СПЕЦИАЛИЗИРОВАННЫЕ ПОДТИПЫ МОДЕЛЕЙ FREAKERS
        uncommon = {
            deaf = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.5,
                male = { "s_m_y_construct_01", "s_m_y_airworker" },
                female = {},
                reactions = { carAlarms = false, bombs = false }
            },
            armored = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.5,
                male = { "s_m_y_swat_01", "s_m_y_blackops_01" },
                female = {},
                armour = 100
            },
            runners = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.5,
                male = { "a_m_y_runner_01", "a_m_y_runner_02" },
                female = { "a_f_y_runner_01", "a_f_y_fitness_01", "a_f_y_fitness_02" },
                runSpeed = 3.2
            },
            scavengers = {
                spawnEnable = true,
                spawnZone = "global",
                names = {},
                polyzone = {},
                walkRun = false,
                spawnTime = "Any",
                eating = true,
                vehicleAttack = true,
                vehicleDamage = 2.5,
                male = { "u_m_y_militarybum", "a_m_y_hiker_01" },
                female = { "a_f_y_hiker_01" },
                lootBonus = true
            }
        },
        sounds = {
            useCustom = false,
            male = {
                prefix = "m_",
                idle = { breathing = 14, moaning = 9, mumbling = 8 },
                alert = { count = 16, base = "alert", startIdx = 1 },
                rage = { count = 18, base = "rage_at_victim", startIdx = 20 },
                pain = { count = 8, base = "been_shot_", startIdx = 30 },
                death = { count = 10, base = "death_", startIdx = 40 }
            },
            female = {
                prefix = "f_",
                idle = { breathing = 14, moaning = 9, mumbling = 8 },
                alert = { count = 16, base = "alert", startIdx = 1 },
                rage = { count = 18, base = "rage_at_victim", startIdx = 20 },
                pain = { count = 8, base = "been_shot_", startIdx = 30 },
                death = { count = 10, base = "death_", startIdx = 40 }
            },
            durations = {
                idle = {1500, 1500},
                rage = {1800, 2800},
                alert = {1000, 1500},
                pain = {500, 800},
                death = {1000, 1800}
            },
            pools = {
                breathing = {
                    "breathing01", "breathing08", "breathing09", "breathing10", "breathing13", "breathing16", "breathing18", "breathing25", "breathing26",
                    "idle_breath_01", "idle_breath_02", "idle_breath_03", "idle_breath_04", "idle_breath_06"
                },
                moaning = {
                    "moan01", "moan02", "moan03", "moan04", "moan05", "moan06", "moan07", "moan08", "moan09"
                },
                mumbling = {
                    "mumbling01", "mumbling02", "mumbling03", "mumbling04", "mumbling05", "mumbling06", "mumbling07", "mumbling08"
                },
                alert_generic = {
                    "alert13", "alert16", "alert22", "alert23", "alert25", "alert26", "alert27", "alert36", 
                    "alert37", "alert38", "alert39", "alert40", "alert41", "alert42", "alert43", "alert44"
                }
            },
            lipsync = {
                enabled = true,
                dictMale = "facials@gen_male@base",
                dictFemale = "facials@gen_female@base",
                moodIdle = "mood_normal_1",
                moodRage = "mood_angry_1",
                moodPain = "pain_1",
                chatterDict = "mp_facial",
                chatterAnim = "mic_chatter"
            }
        },
        muteDefault = true,
        headshot = true,
        headshotOnly = false,
        
        walks = {
            "clipset@anim@ingame@move_m@zombie@core",
            "clipset@anim@ingame@move_m@zombie@strafe"
        },
        
        idle = {
            wander = true,
            infighting = true,           -- Разрешить драки между собой в Idle
            infightingChance = 20,       -- Шанс (в %), что зомби нападут друг на друга
            infightingRadius = 6.0,      -- Радиус поиска соперника (в метрах)
            scenarios = {
                "WORLD_HUMAN_STUPOR", 
                "WORLD_HUMAN_VOMITING"
            }
        },
        combat = {
            ability = 100,
            range = 0,
            movement = false,
            runSpeed = 2.8, -- Высокая скорость фрикеров
            moveBlendRatio = 2.0,
            weaponAnimOverride = "ZOMBIE", -- Нативный оверрайд ударов зомби от Rockstar
            flee = false,
            preferMelee = true,
            enableWeaponBlocking = false,
            group = "freakers_zombie"
        },
        senses = {
            seeingRange = 80.0,
            hearingRange = 120.0, -- Высокая чувствительность к шуму
            idRange = 80.0,
            alertness = 3,
            stealthRange = 2.5,
            multipliers = {
                crouch = 0.5,
                stealth = 0.5,
                sprint = 2.8,
                run = 2.0,
                walk = 1.0,
                shooting = 4.5,
                melee = 2.5
            }
        },
        reactions = {
            carAlarms = true,
            bombs = true
        },
        physical = {
            useLadders = true,
            useClimbovers = true,
            canRagdoll = true,
            disableSwimming = true,
            damagePacks = {
                "BigHitByVehicle", 
                "SCR_Dumpster", 
                "SCR_Torture" 
            }
        }
    }
}

-- Модели для трупов (Без разделения по полу)
Config.PlayerZombieModels = {
	"u_m_y_zombie_01",
}





