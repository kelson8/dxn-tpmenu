Config = {}

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
            }
        }
    },
    {
        name = "Law Enforcement",
        ace_perm = "teleport.police", -- Requires police permission to see category
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
