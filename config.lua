Config = {}

-- TODO Setup permissions for this later
Config.UseAcePerms = false -- Toggle ACE permission system

Config.Categories = {
    {
        name = "Popular Locations",
        ace_perm = nil, -- No permission required
        locations = {
            {
                name = "Legion Square",
                desc = "Central Los Santos",
                coords = vector3(215.98, -810.16, 30.72),
                icon = "fa-map-marker-alt",
                ace_perm = nil
            },
            {
                name = "LSIA Airport",
                desc = "Los Santos International",
                coords = vector3(-1037.51, -2737.81, 13.77),
                icon = "fa-plane",
                ace_perm = "teleport.airport" -- Specific permission for this location
            },

            {
                name = "Casino Outside",
                desc = "Diamond Casino & Resort",
                coords = vector3(917.58, 45.5, 80.9),
                icon = "fa-map-marker-alt",
            },

            {
                name = "Casino Interior",
                desc = "Diamond Casino & Resort",
                coords = vector3(2468.59, -279.71, -58.4),
                icon = "fa-map-marker-alt",
            }

        }
    },
    {
        name = "Law Enforcement",
        ace_perm = nil,
        -- ace_perm = "teleport.police", -- Requires police permission to see category
        locations = {
            {
                name = "Mission Row PD",
                desc = "Police Department",
                coords = vector3(432.14, -982.41, 30.71),
                icon = "fa-shield-alt",
                ace_perm = nil
            }
        }
    }
}
