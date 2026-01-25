// this script holds all level data. 

global.LEVELS = [];

// Debug Level
global.LEVELS[30] = {
    orbits: 0,
    planets: []
};

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
    orbits: 5,
    planets: [
        { temperature: "any", shape: "circle", size: "small" , count: 1 },
		{ temperature: "any", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "any", shape: "circle", size: "large" , count: 1 },
		{ temperature: "hot", shape: "circle", size: "medium" , count: 7 },
    ],
	rules: [],
};

// LEVEL 2
global.LEVELS[2] = {
    orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "large" , count: 3 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 }
    ]
};