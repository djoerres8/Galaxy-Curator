// rules for all planet types go here
// better to have them all centralized and global so during validation they can be checked easier.\

//Sizes  1, 2, 3

global.PLANET_RULES = {
    gray: {
        temperature: "any",
		size: 2,
		must_have_buddy: 0,
		must_be_alone: 0
    },
	red: {
        temperature: "hot",
		size: 2,
		must_have_buddy: 0,
		must_be_alone: 0
    },
    blue: {
        temperature: "cold",
		size: 2,
		must_have_buddy: 0,
		must_be_alone: 0
    },
    green: {
        temperature: "temperate",
		size: 2,
		must_have_buddy: 0,
		must_be_alone: 0
    },
	orange: {
        temperature: "any",
		size: 3,
		must_have_buddy: 0,
		must_be_alone: 0
    },
	pink: {
        temperature: "any",
		size: 1,
		must_have_buddy: 0,
		must_be_alone: 0
    },
	cyan: {
        temperature: "any",
		size: 2,
		must_have_buddy: 1,
		must_be_alone: 0
    },
	purple: {
        temperature: "any",
		size: 2,
		must_have_buddy: 0,
		must_be_alone: 1
    },
    
	
};

