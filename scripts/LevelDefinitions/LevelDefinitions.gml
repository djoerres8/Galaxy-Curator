// this script holds all level data. 

global.LEVELS = [];


// LEVEL 0
global.LEVELS[0] = {
    orbits: 1,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 }
    ]
};

// LEVEL 1
global.LEVELS[1] = {
    orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "large" , count: 3 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 }
    ]
};

// LEVEL 2
global.LEVELS[2] = {
    orbits: 3,
    planets: [
        { type: obj_planet_red, count: 1 },
        { type: obj_planet_green, count: 1 },
        { type: obj_planet_blue, count: 2 }
    ]
};