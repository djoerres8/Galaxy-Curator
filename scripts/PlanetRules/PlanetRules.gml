// rules for all planet types go here
// better to have them all centralized and global so during validation they can be checked easier.

// orbits are counted center -> out. orbit closest to sun is 1.
global.PlanetRules = {
    red: {
        min_orbit: 1,
        max_orbit: 2,
    },
    blue: {
        min_orbit: 4,
        max_orbit: 999,
    },
    green: {
        min_orbit: 1,
        max_orbit: 999,
    },
	// gray planets have 0 requirements. they can exist in any orbit with any other planets
    gray: {
        min_orbit: 0,
        max_orbit: 999,
    }
	
};