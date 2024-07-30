Config = {}

Config.BlackcardItemName = 'blackcard'

Config.Locations = {        -- Locations of where the ped spawns. Chosen randomly every night at 22:00. Add as many as you like.
    [1] = vector4(247.72, -34.56, 73.99, 30.18),
}

Config.Model = 'a_m_m_farmer_01' -- The model of the ped.


Config.Goodies = {
    label = "Blackmarket",
    slots = 10,
    items = {
        [1] = {
            name = "weapon_m9",
            price = 28000,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_fnx45",
            price = 33000,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_m1911",
            price = 25000,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_appistol",
            price = 65000,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_heavypistol",
            price = 50000,
            amount = 10,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "pistol_ammo",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "smg_ammo",
            price = 700,
            amount = 10,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "rifle_ammo",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "pistol_extendedclip",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "combatpistol_extendedclip",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "appistol_extendedclip",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "heavypistol_extendedclip",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "pistol_flashlight",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 13,
        }
    }
}


---------------------
-- SHOP OPEN/CLOSE --
---------------------

Config.Open = 0
Config.Close = 0 
