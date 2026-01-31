// this script holds all level data. 

/*
moons:
		{ modifier: "hotter" , count: 3 },
		{ modifier: "colder" , count: 2 },
		{ modifier: "heart" , count: 2 },
		{ modifier: "spiky" , count: 2 },
		{ modifier: "circle" , count: 2 },
		{ modifier: "smaller" , count: 2 },
		{ modifier: "larger" , count: 2 },
*/

global.LEVELS = [];

// LEVEL 0 (debug level)
global.LEVELS[0] = {
    number_of_orbits: 1,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [],
	tutorial : ""
};

// LEVEL 1
global.LEVELS[1] = {
    number_of_orbits: 1,
    planets: [
        { temperature: "any", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [],
	tutorial : "Welcome to Orbits! In this game you are building stable solar systems by placing planets in orbit around the sun. Try it now, grab and place the planet onto the orbit."
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
		function (msg) { return allPlanetsPassing(msg); },
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
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Other planets may have different preferences. Cold planets like being far away from the sun, while temperate planets like that sweet spot right in the middle."
};

// LEVEL 5
global.LEVELS[5] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "any", shape: "spiky", size: "medium" , count: 2 },
		{ temperature: "cold", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [],
	rules: [
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Spiky planets prefer to be alone on their orbit."
};

// LEVEL 6
global.LEVELS[6] = {
    number_of_orbits: 4,
    planets: [
        { temperature: "any", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 2 },
    ],
	moons: [],
	rules: [
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Heart shaped planets must be with at least one other planet in the same orbit."
};

// LEVEL 7
global.LEVELS[7] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "any", shape: "circle", size: "small" , count: 4 },
		{ temperature: "any", shape: "circle", size: "large" , count: 2 },
    ],
	moons: [],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
		function (msg) { return allPlanetsPassing(msg); },
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
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Planets can have any combination of a size, temperature, and shape."
};

//TODO: add 1-3 puzzley levels with no moons here

// LEVEL 9
global.LEVELS[9] = {
    number_of_orbits: 1,
    planets: [
        { temperature: "any", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "any", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [{ modifier: "circle" , count: 1 },],
	rules: [
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Hey, thats not a small planet, thats a MOON! Moons orbit planets and can change their preferences. This Rounding moon will make a heart or spiky planet round instead."
};

// LEVEL 10
global.LEVELS[10] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "cold", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "medium" , count: 1 },
    ],
	moons: [
		{ modifier: "hotter" , count: 1 },
		{ modifier: "colder" , count: 1 },
	],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Each moon will only modify 1 rule of a planet. These warming and cooling moons, for example, will only change the temperature preference of the planet. It will not change it's shape."
};

// LEVEL 11 TODO: fix this tutorial level
global.LEVELS[11] = {
    number_of_orbits: 3,
    planets: [
		{ temperature: "any", shape: "circle", size: "small" , count: 1 },
		{ temperature: "any", shape: "circle", size: "large" , count: 2 },
		{ temperature: "any", shape: "circle", size: "medium" , count: 2 },
    ],
	moons: [
		{ modifier: "larger" , count: 1 },
		{ modifier: "smaller" , count: 1 },
	],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(2,msg); },
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Growing moons will increase the planets size, while shrinking moons will decrease it."
};

// LEVEL 12
global.LEVELS[12] = {
    number_of_orbits: 2,
    planets: [
        { temperature: "hot", shape: "spiky", size: "large" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [
		{ modifier: "colder" , count: 1 },
		{ modifier: "circle" , count: 1 },
		{ modifier: "smaller" , count: 1 },
	],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Planets can also have more than 1 moon! Some might even have up to 5! (subtle foreshadowing)"
};

// LEVEL 13
global.LEVELS[13] = {
    number_of_orbits: 3,
    planets: [
		{ temperature: "cold", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "any", shape: "circle", size: "small" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
    ],
	moons: [
		{ modifier: "colder" , count: 1 },
		{ modifier: "smaller" , count: 2 },
		{ modifier: "heart", count: 1 },
		{ modifier: "circle", count: 1 },
		
	],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(1.5, msg); },
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : ""
};

// LEVEL 14
global.LEVELS[14] = {
    number_of_orbits: 3,
    planets: [
        { temperature: "hot", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "cold", shape: "heart", size: "large" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 },
		{ temperature: "any", shape: "heart", size: "large" , count: 1 }
    ],
	moons: [
		{ modifier: "smaller" , count: 4 },
		{ modifier: "circle" , count: 1 },
		],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(2, msg); },
	],
	tutorial : ""
};
    
// LEVEL 15
global.LEVELS[15] = {
    number_of_orbits: 4,
    planets: [
        { temperature: "hot", shape: "heart", size: "small" , count: 1 },
		{ temperature: "any", shape: "circle", size: "small" , count: 1 },
		{ temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "small" , count: 1 }
    ],
	moons: [
		{ modifier: "smaller" , count: 2 },
		{ modifier: "heart" , count: 1 },
		{ modifier: "colder" , count: 1 },
		],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(1, msg); },
	],
	tutorial : ""
};

// LEVEL 16
global.LEVELS[16] = {
    number_of_orbits: 4,
    planets: [
        { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "temperate", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "any", shape: "heart", size: "large" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "spiky", size: "medium" , count: 1 }
    ],
	moons: [
		{ modifier: "smaller" , count: 3 },
		{ modifier: "larger" , count: 2 },
		{ modifier: "heart" , count: 2 },
		{ modifier: "colder" , count: 2 },
		{ modifier: "circle" , count: 2 },
		{ modifier: "hotter" , count: 2 },
		{ modifier: "spiky" , count: 1 },
		],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(2, msg); },
		function (msg) { return forceMoonsPerPlanet(2, msg); }
	],
	tutorial : ""
};

//START OF DAVIDS LEVELS

// LEVEL 21
global.LEVELS[21] = {
    number_of_orbits: 2,
    planets: [ 
        { temperature: "cold", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "cold", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 },
		{ temperature: "any", shape: "circle", size: "medium" , count: 2 },
		{ temperature: "any", shape: "spiky", size: "large" , count: 1 }
    ],
	moons: [ 
		{ modifier: "hotter" , count: 4 },
		{ modifier: "colder" , count: 2 },
		{ modifier: "heart" , count: 2 },
		{ modifier: "circle" , count: 1 },
		{ modifier: "smaller" , count: 2 },
	],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(3, msg); },
		function (msg) { return forceMinimumMoonsPerPlanet(1, msg); },
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "This one is really going to test your moon management."
};

// LEVEL 22
global.LEVELS[22] = {
    number_of_orbits: 3,
    planets: [ 
        
		{ temperature: "cold", shape: "circle", size: "small" , count: 2 },
		
		{ temperature: "hot", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "small" , count: 1 },
		
		{ temperature: "temperate", shape: "heart", size: "small" , count: 2 },
		{ temperature: "temperate", shape: "circle", size: "small" , count: 1 },
		
		{ temperature: "any", shape: "circle", size: "small" , count: 2 },
    ],
	moons: [ 
		{ modifier: "hotter" , count: 2 },
		{ modifier: "colder" , count: 2 },
		{ modifier: "larger" , count: 2 },
	],
	rules: [
		function (msg) { return forcePlanetsPerOrbit(2, msg); },
		function (msg) { return LimitUsableMoons(3, msg); },
		function (msg) { return allPlanetsPassing(msg); },
	],
	tutorial : "Look at all those tiny planets! this must be a small-or system."
};

// LEVEL X
var sample_all = {
    number_of_orbits: 2,
    planets: [ 
        { temperature: "cold", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "cold", shape: "heart", size: "small" , count: 1 },
		{ temperature: "cold", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "heart", size: "large" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "small" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "cold", shape: "circle", size: "large" , count: 1 },
		
		{ temperature: "hot", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "small" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "heart", size: "large" , count: 1 },
		{ temperature: "hot", shape: "circle", size: "small" , count: 1 },
		{ temperature: "hot", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "hot", shape: "circle", size: "large" , count: 1 },
		
		{ temperature: "temperate", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "temperate", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "temperate", shape: "heart", size: "small" , count: 1 },
		{ temperature: "temperate", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "heart", size: "large" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "small" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "temperate", shape: "circle", size: "large" , count: 1 },
		
		{ temperature: "any", shape: "spiky", size: "small" , count: 1 },
		{ temperature: "any", shape: "spiky", size: "medium" , count: 1 },
		{ temperature: "any", shape: "spiky", size: "large" , count: 1 },
		{ temperature: "any", shape: "heart", size: "small" , count: 1 },
		{ temperature: "any", shape: "heart", size: "medium" , count: 1 },
		{ temperature: "any", shape: "heart", size: "large" , count: 1 },
		{ temperature: "any", shape: "circle", size: "small" , count: 1 },
		{ temperature: "any", shape: "circle", size: "medium" , count: 1 },
		{ temperature: "any", shape: "circle", size: "large" , count: 1 },
    ],
	moons: [ 
		{ modifier: "hotter" , count: 2 },
		{ modifier: "colder" , count: 2 },
		{ modifier: "heart" , count: 2 },
		{ modifier: "spiky" , count: 2 },
		{ modifier: "circle" , count: 2 },
		{ modifier: "smaller" , count: 2 },
		{ modifier: "larger" , count: 2 },
	],
	rules: [
		function (msg) { return limitPlanetsPerOrbit(3, msg); },
		function (msg) { return forcePlanetsPerOrbit(3, msg); },
		function (msg) { return limitMoonsPerPlanet(3, msg); },
		function (msg) { return forceMoonsPerPlanet(2, msg); },
		function (msg) { return forceMinimumMoonsPerPlanet(1, msg); },
		function (msg) { return LimitUsableMoons(3, msg); },
		function (msg) { return banOrbit(0, msg); },
		function (msg) { return allPlanetsPassing(msg); }
	],
	tutorial : ""
};
//END OF DAVIDS LEVELS
