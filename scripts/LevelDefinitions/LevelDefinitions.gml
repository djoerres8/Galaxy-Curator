// this script holds all level data. 

global.LEVELS = [];

// Debug Level
global.LEVELS[30] = {
    orbits: 0,
    planets: [],
	rules: [],
};

// LEVEL 0
global.LEVELS[0] = {
    orbits: 1,
    planets: [],
	rules: [],
	tutorial : "Press the wierd purple button in the corner to go to the first level."
};

// LEVEL 1
global.LEVELS[1] = {
    orbits: 1,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 1 },
    ],
	rules: [
		
	],
	tutorial : "Planets need to be in orbit. Click and drag the planet over to orbit around the sun."
};

// LEVEL 2
global.LEVELS[2] = {
    orbits: 3,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 3 },
    ],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(1, msg); },
		//function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : "Each level will have objectives to complete before you can finish the level."
};

// LEVEL 3
global.LEVELS[3] = {
    orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
    ],
	rules: [
		
	],
	tutorial : "Planets also have individual rules that need to be met. This planet is HOT and needs to be in an orbit closer to the sun."
};

// LEVEL 4
global.LEVELS[4] = {
    orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
    ],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(1, msg); },
		//function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : "Other planets maye have differant preferences."
};

// LEVEL 5
global.LEVELS[5] = {
    orbits: 5,
    planets: [
        { temperature: "hot", shape: "spiky", size: "medium" , count: 2 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "spiky", size: "medium" , count: 2 },
    ],
	rules: [
	],
	tutorial : "Spiky planets prefer to be alone on their orbit."
};

// LEVEL 6
global.LEVELS[6] = {
    orbits: 4,
    planets: [
        { temperature: "any", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 2 },
    ],
	rules: [
	],
	tutorial : "Heart planets must be with at least one other planet in the same orbit."
};

// LEVEL 7
global.LEVELS[7] = {
    orbits: 6,
    planets: [
        { temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "medium" , count: 4 },
		{ temperature: "temperate", shape: "spiky", size: "medium" , count: 1 },
    ],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(3, msg); },
	],
	tutorial : ""
};

// LEVEL 20
global.LEVELS[20] = {
    orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "large" , count: 3 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 }
    ],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(3, msg); },
		function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : ""
};