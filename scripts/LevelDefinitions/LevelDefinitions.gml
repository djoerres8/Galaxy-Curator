// this script holds all level data. 


//moons temp
//{ attribute_modifier: "temperature", value: "hotter/colder" , count: 2 },
//{ attribute_modifier: "shape", value: "heart/spiky/round" , count: 2 },
//{ attribute_modifier: "size", value: "bigger/smaller" , count: 2 },

global.LEVELS = [];

// Debug Level
global.LEVELS[30] = {
    number_of_orbits: 0,
    planets: [],
	moons: [],
	rules: [],
	tutorial : ""
};

// LEVEL 0
global.LEVELS[0] = {
    number_of_orbits: 1,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [],
	tutorial : "Press the wierd purple button in the corner to go to the first level."
};

// LEVEL 1
global.LEVELS[1] = {
    number_of_orbits: 1,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [
		
	],
	tutorial : "Planets need to be in orbit. Click and drag the planet over to orbit around the sun."
};

// LEVEL 2
global.LEVELS[2] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 3 },
    ],
	moons: [],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(1, msg); },
		//function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : "Each level will have objectives to complete before you can finish the level."
};

// LEVEL 3
global.LEVELS[3] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [
		
	],
	tutorial : "Planets also have individual rules that need to be met. This planet is HOT and needs to be in an orbit closer to the sun."
};

// LEVEL 4
global.LEVELS[4] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(1, msg); },
		//function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : "Other planets maye have differant preferences."
};

// LEVEL 5
global.LEVELS[5] = {
    number_of_orbits: 5,
    planets: [
        { temperature: "hot", shape: "spiky", size: "medium" , count: 2 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "spiky", size: "medium" , count: 2 },
    ],
	moons: [],
	rules: [
	],
	tutorial : "Spiky planets prefer to be alone on their orbit."
};

// LEVEL 6
global.LEVELS[6] = {
    number_of_orbits: 4,
    planets: [
        { temperature: "any", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 2 },
    ],
	moons: [],
	rules: [
	],
	tutorial : "Heart planets must be with at least one other planet in the same orbit."
};

// LEVEL 7
global.LEVELS[7] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "any", shape: "circle", size: "small" , count: 4 },
		{ temperature: "any", shape: "circle", size: "large" , count: 2 },
    ],
	moons: [
		{ modifier: "hotter" , count: 1 },
		{ modifier: "colder" , count: 1 },
		{ modifier: "heart" , count: 1 },
		{ modifier: "spiky" , count: 1 },
		{ modifier: "round" , count: 1 },
		{ modifier: "smaller" , count: 1 },
		{ modifier: "bigger" , count: 1 },
	],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
	],
	tutorial : "Big planets take up 2 spaces in an orbit, while small planets take up 1/2 a space."
};

// LEVEL 8
global.LEVELS[8] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "small" , count: 1 },
		{ temperature: "temperate", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "cold", shape: "heart", size: "medium" , count: 2 },
    ],
	moons: [],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
	],
	tutorial : "Planets can have any combination of a size, temperature, and shape."
};

// LEVEL 9
global.LEVELS[9] = {
    number_of_orbits: 6,
    planets: [
        { temperature: "any", shape: "heart", size: "small" , count: 4 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "medium" , count: 4 },
		{ temperature: "temperate", shape: "spiky", size: "large" , count: 1 },
    ],
	moons: [],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(3, msg); },
	],
	tutorial : "This is a test of a slightly larger level"
};

// LEVEL 10
global.LEVELS[10] = {
    number_of_orbits: 5,
    planets: [
        { temperature: "hot", shape: "circle", size: "small" , count: 3 },
		{ temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "heart", size: "small" , count: 1 },
		{ temperature: "any", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "any", shape: "circle", size: "large" , count: 1 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 1 },
    ],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
		function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : ""
};

// LEVEL 11
global.LEVELS[11] = {
    number_of_orbits: 4,
    planets: [
        { temperature: "hot", shape: "circle", size: "small" , count: 5 },
		{ temperature: "any", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "large" , count: 1 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 }
    ],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(3, msg); },
		function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : ""
};

// LEVEL 12
global.LEVELS[12] = {
    number_of_orbits: 6,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "large" , count: 2 },
		{ temperature: "any", shape: "heart", size: "small" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "any", shape: "spiky", size: "large" , count: 1 },
    ],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
		function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : ""
};

// LEVEL 12
global.LEVELS[12] = {
    number_of_orbits: 4,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "small" , count: 1 },
		{ temperature: "any", shape: "heart", size: "small" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "any", shape: "spiky", size: "small" , count: 1 },
    ],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(1, msg); },
		function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : ""
};

// LEVEL 20
global.LEVELS[20] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "large" , count: 3 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 }
    ],
	moons: [],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(3, msg); },
		function (msg) { return noPlanetsOnBench(msg); }
	],
	tutorial : ""
};