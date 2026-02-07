const int NULL_OBJ = 0;

const int FIRST_NPC_FUNCTION = 0x400;

const int MAX_QUANTITY = 100;
const int MAX_CHARGES = 100;

enum sprite_repeats {
	LOOP_ONCE = -1,		// Go through all frames once.
	LOOP_UNTIL_OFFSCREEN = -2,	// Keep looping until the sprite is off-screen.
	LOOP_REVERSE = -3	// As LOOP_ONCE, but in reverse order.
};

enum spells_bg {
	SPELL_NONE = 0,

	SPELL_AWAKEN = 0,
	SPELL_WEATHER,
	SPELL_DOUSE,
	SPELL_FIREWORKS,
	SPELL_GLIMMER,
	SPELL_HELP,
	SPELL_IGNITE,
	SPELL_THUNDER,

	SPELL_CREATE_FOOD,
	SPELL_CURE,
	SPELL_DETECT_TRAP,
	SPELL_GREAT_DOUSE,
	SPELL_GREAT_IGNITE,
	SPELL_LIGHT,
	SPELL_LOCATE,
	SPELL_AWAKEN_ALL,

	SPELL_DESTROY_TRAP,
	SPELL_ENCHANT,
	SPELL_FIRE_BLAST,
	SPELL_GREAT_LIGHT,
	SPELL_MASS_CURE,
	SPELL_PROTECTION,
	SPELL_TELEKINESIS,
	SPELL_WIZARD_EYE,

	SPELL_CURSE,
	SPELL_HEAL,
	SPELL_SWARM,
	SPELL_PROTECT_ALL,
	SPELL_PARALYZE,
	SPELL_PEER,
	SPELL_POISON,
	SPELL_SLEEP,

	SPELL_CONJURE,
	SPELL_LIGHTNING,
	SPELL_MARK,
	SPELL_MASS_CURSE,
	SPELL_RECALL,
	SPELL_REVEAL,
	SPELL_SEANCE,
	SPELL_UNLOCK_MAGIC,

	SPELL_CHARM,
	SPELL_DANCE,
	SPELL_DISPEL_FIELD,
	SPELL_EXPLOSION,
	SPELL_GREAT_HEAL,
	SPELL_INVISIBILITY,
	SPELL_FIRE_FIELD,
	SPELL_MASS_SLEEP,

	SPELL_CAUSE_FEAR,
	SPELL_CLONE,
	SPELL_FIRE_RING,
	SPELL_FLAME_STRIKE,
	SPELL_MAGIC_STORM,
	SPELL_POISON_FIELD,
	SPELL_SLEEP_FIELD,
	SPELL_TREMOR,

	SPELL_CREATE_GOLD,
	SPELL_DEATH_BOLT,
	SPELL_DELAYED_BLAST,
	SPELL_ENERGY_FIELD,
	SPELL_ENERGY_MIST,
	SPELL_MASS_CHARM,
	SPELL_MASS_MIGHT,
	SPELL_RESTORATION,

	SPELL_ARMAGEDDON,
	SPELL_DEATH_VORTEX,
	SPELL_MASS_DEATH,
	SPELL_INVISIBILITY_ALL,
	SPELL_RESURRECT,
	SPELL_SUMMON,
	SPELL_SWORD_STRIKE,
	SPELL_TIME_STOP
};

enum sprite_effects {
	ANIMATION_BIG_BLAST			= 1,
	ANIMATION_BIG_CLOUDS		= 2,
	ANIMATION_CLOUDS			= 3,
	ANIMATION_MEDIUM_BLAST		= 4,
	ANIMATION_SMALL_BLAST		= 5,
	ANIMATION_TELEPORT			= 7,
	ANIMATION_DEATH_VORTEX		= 8,
	ANIMATION_POOF				= 9,
	ANIMATION_RED_DUST			= 11,
	ANIMATION_FIREWORKS			= 12,
	ANIMATION_GREEN_BUBBLES		= 13,
	ANIMATION_OOZING_BLOB		= 14,
	ANIMATION_CIRCLE_BARRIER	= 15,
	ANIMATION_SPARKLES			= 16,
	ANIMATION_LIGHTNING			= 17,
	ANIMATION_BLUE_BEADS		= 18,
	ANIMATION_BURST_ARROW		= 19,
	ANIMATION_PURPLE_BUBBLES	= 21,
	ANIMATION_SWORD_STRIKE		= 23,
	ANIMATION_MUSIC				= 24
};

enum cursors {
	CURSOR_HAND			= 0,
	CURSOR_X			= 1,	//Default "no you can't do that" X cursor
	CURSOR_OUT_OF_RANGE = 2,
	CURSOR_OUT_OF_AMMO	= 3,
	CURSOR_TOO_HEAVY	= 4,
	CURSOR_WONT_FIT		= 5,
	CURSOR_FIRST_INVALID = 6,
	CURSOR_X_INVALID	= 0x3C,
};

enum weather_types {
	CLEAR_WEATHER	= 0,
	SNOWING			= 1,	//Unsure; in Exult, works the same as RAIN, below and seems identical to RAIN in the originals
	RAIN			= 2,
	SPARKLE			= 3,	//Prevents casting of spells in BG (and maybe SI too?)
	FOG				= 4,	//Seems to work like RAIN in the originals
	OVERCAST		= 5,	//Seems to clear weather in the originals
	CLOUDY			= 6
};

enum alignments {
	NEUTRAL			= 0,
	GOOD			= 1,
	EVIL			= 2,
	CHAOTIC			= 3
};

enum damage_types {
	NORMAL_DAMAGE		= 0,
	FIRE_DAMAGE			= 1,
	MAGIC_DAMAGE		= 2,
	LIGHTNING_DAMAGE	= 3,
	POISON_DAMAGE		= 3,
	STARVATION_DAMAGE	= 3,
	FREEZING_DAMAGE		= 3,
	ETHEREAL_DAMAGE		= 4,
	SONIC_DAMAGE		= 5,
	MAXIMUM_DAMAGE		= 127,
};

// tick multipliers, for use with UI_advance_time or script statements
enum times {
	TICK	= 1,
	MINUTE	= 25,
	HOUR	= 1500,
	DAY		= (long)36000,
};

enum wildcards {
	FIND_ON_SCREEN	= -359,
	QUANTITY_ANY	= -359,
	SHAPE_ANY		= -359,
	ANY_SHAPE		= -1,	// For find_nearby
	ON_SCREEN		= -1,	// For find_nearest/find_nearby
	ZERO_DELAY		= -1,	// For run_script
	QUALITY_ANY		= -359,
	FRAME_ANY		= -359,
	TEMPORARY_ANY	= -359,
	FLAG_DESTROY	= -358	// Used in UI_update_last_created to indicate it will be deleting
};

enum directions {
	NORTH		= 0,
	NORTHEAST	= 1,
	EAST		= 2,
	SOUTHEAST	= 3,
	SOUTH		= 4,
	SOUTHWEST	= 5,
	WEST		= 6,
	NORTHWEST	= 7,
	HALF_TURN	= 4,
	FULL_TURN	= 8,
};

enum face_directions : byte {
	FACE_NORTH		= 0x30,
	FACE_NORTHEAST	= 0x31,
	FACE_EAST		= 0x32,
	FACE_SOUTHEAST	= 0x33,
	FACE_SOUTH		= 0x34,
	FACE_SOUTHWEST	= 0x35,
	FACE_WEST		= 0x36,
	FACE_NORTHWEST	= 0x37
};

enum npc_properties {
	STRENGTH		= 0,
	DEXTERITY		= 1,
	INTELLIGENCE	= 2,
	HEALTH			= 3,
	COMBAT			= 4,
	MANA			= 5,
	MAX_MANA		= 6,
	TRAINING		= 7,
	EXPERIENCE		= 8,
	FOODLEVEL		= 9,
	SEX_FLAG		= 10,	// 1 (nonzero) if female, 0 if male.
	MISSILE_WEAPON	= 11	// Cannot be set; returns 1 if wearing a missile
							// or (good) thrown weapon, 0 otherwise.
};

enum day_periods {
	// The period is equal to one-third of the current game hour.
	MIDNIGHT		= 0,	// 0-2
	EARLY			= 1,	// 3-5
	DAWN			= 2,	// 6-8
	MORNING			= 3,	// 9-11
	NOON			= 4,	// 12-14
	AFTERNOON		= 5,	// 15-17
	EVENING			= 6,	// 18-20
	NIGHT			= 7		// 21-23
};

enum item_flags {
	INVISIBLE			= 0,
	ASLEEP				= 1,
	CHARMED				= 2,
	CURSED				= 3,
	DEAD				= 4,
	UNKNOWN_FLAG_05		= 5,
	IN_PARTY			= 6,
	PARALYZED			= 7,
	PARALYSED			= 7,		//British spelling
	POISONED			= 8,
	PROTECTION			= 9,
	ON_MOVING_BARGE		= 10,
	OKAY_TO_TAKE		= 11,		// The item does not belong to anyone, and won't
									// trigger stealing behaviour if you take it.
	MIGHT				= 12,		// Double strength, dext, intel.
	IMMUNITIES			= 13,		// Lots of immunities; can be gotten only.
	CANT_DIE			= 14,		// Test flag in monster_info.
	IN_ACTION			= 15,		// If the NPC is doing something. Set by "Dance" spell in BG.
	DONT_MOVE			= 16,		// SI-only. NPC can't move; "cutscene" mode.
	DONT_RENDER			= 16,		// BG-only. Like DONT_MOVE, but avatar also
									// completely invisible.
	UNKNOWN_FLAG_17		= 17,
	TEMPORARY			= 18,		// Is temporary - this means that the item will
									// be deleted once the party gets beyond a certain
									// range from it (outside the superchunk?)
	ACTIVE_SAILOR		= 20,		// The barge's 'captain'. When getting the flag,
									// you will actually get the current captain.
	OKAY_TO_LAND		= 21,		// Used for flying-carpet.
	BG_DONT_MOVE		= 22,		// BG-only. NPC can't move; "cutscene" mode.
	SI_DONT_RENDER		= 22,		// SI-only. Like DONT_MOVE, but avatar also
									// completely invisible.
	IN_DUNGEON			= 23,		// If set, you won't be accused of stealing.
	IS_SOLID			= 24,		// Used by gangplank usecode to determine if an object is solid.
	CONFUSED			= 25,
	ACTIVE_BARGE		= 26,		// Object is a barge object moving, or on a barge
									// object that is moving. Set in usecode, and mostly
									// used for the SI 'NPC' ships such as the turtle.
	UNKNOWN_FLAG_27		= 27,
	MET					= 28,		// Has the npc been met before - originally this
									// was SI-only, but Exult implements it for BG
									// too. This determines conversation behaviour,
									// and whether the NPC's real name or shape name
									// is displayed when they are single-clicked on.
									// BG originally used global flags for this, which
									// amounts to an extra 250-odd flags.
	SI_TOURNAMENT		= 29,		// Call usecode (eventid = 7) on death
	SI_ZOMBIE			= 30,		// Used for sick Neyobi, Cantra, post-Bane companions.

	NO_SPELL_CASTING	= 31,
	POLYMORPH			= 32,		// Do not set this flag directly; use the
									// UI_set_polymorph intrinsic instead.
	TATTOOED			= 33,
	READ				= 34,		// Can read non-Latin alphabet scrolls, books, signs.
	ISPETRA				= 35,
	CAN_FLY				= 36,
	FREEZE				= 37,
	NAKED				= 38 		// Exult. Makes the avatar naked given its skin.
									// Other NPCs should use set_polymorph instead.
};

enum events {
	PROXIMITY		= 0,	// Object is on-screen or nearby
							// This is called repeatedly, with a random delay
							// between each call
	DOUBLECLICK		= 1,	// Object is double-clicked on
	SCRIPTED		= 2,	// Function is called from inside a script{} block
							// (very common)
	EGG				= 3,	// Object is an egg that just hatched (triggered by
							// egg activation conditions)
	WEAPON			= 4,	// Object was wielded and 'swung' in combat
							// This is mainly used with 'weapon-like' objects
							// - e.g. smokebombs and fishing rods - that have more
							// advanced 'attack' behaviour.

	READIED			= 5,	// Object was worn or readied in inventory - used by
							// items like the Ring of Invisibility
	UNREADIED		= 6,	// Object was taken off or put away in inventory

	DEATH			= 7,	// NPC has just been killed (SI-only)
	STARTED_TALKING	= 9,	// NPC starts conversation with you (has TALK
							// schedule and has reached the Avatar)
							// This is SI-only - BG uses event 1 for this,
							// both for conversations triggered by doubleclick
							// and by the TALK schedule

	//The following events are arbitrary programmer conventions:
	BG_PATH_SUCCESS	= 7,	// Set with calls to UI_path_run_usecode, to indicate
							// a successful pathfind to the target object
	BG_PATH_FAILURE	= 8,	// Set with calls to UI_set_path_failure, to indicate
							// an interrupted pathfind (e.g. when the player
							// moves the Avatar manually)
	PATH_SUCCESS_9	= 9,	// Set with calls to UI_path_run_usecode, to indicate
							// a successful pathfind to the target object
	PATH_SUCCESS	= 10,	// Set with calls to UI_path_run_usecode, to indicate
							// a successful pathfind to the target object
	PATH_FAILURE	= 11,	// Set with calls to UI_set_path_failure, to indicate
							// an interrupted pathfind (e.g. when the player
							// moves the Avatar manually)
	SI_PATH_SUCCESS	= 13,	// Set with calls to UI_path_run_usecode, to indicate
							// a successful pathfind to the target object
	SI_PATH_FAILURE	= 14	// Set with calls to UI_set_path_failure, to indicate
							// an interrupted pathfind (e.g. when the player
							// moves the Avatar manually)
};

enum schedules {
	IN_COMBAT		= 0,	// renamed to not conflict with COMBAT, the NPC
							// stat property.
	PACE_HORIZONTAL	= 1,	// Walk horizontally until you hit a wall, then
							// turn around. (Patrolling on the cheap.)
	PACE_VERTICAL	= 2,	// Same as above, but vertically.
	TALK			= 3,	// NPC runs to the Avatar to talk to them. When
							// they get within a certain distance of where the
							// Avatar was when this schedule was set, a
							// DOUBLECLICK event is triggered on the NPC.
							// At this point the schedule must be changed.
	DANCE			= 4,
	EAT				= 5,
	FARM			= 6,	// Waves farm implements around.
	TEND_SHOP		= 7,	// This is really just a more specific version of
							// LOITER, used for narrowing down schedule barks.
							// See BAKE, SEW and BLACKSMITH for more specific
							// examples of shop behaviour.
	MINE			= 8,
	MINER			= 8,
	HOUND			= 9,
	STANDTHERE		= 10,	// renamed to not conflict with STAND, the NPC
							// animation frame
	LOITER			= 11,	// Hangs around a certain point, within 10 units
							// or so
	WANDER			= 12,	// Roams nearby a certain point (as much as a
							// 320x200 screen away)
	BLACKSMITH		= 13,
	SLEEP			= 14,
	WAIT			= 15,	// Similar to STAND, except that they will never
							// leave the WAIT schedule until it is manually
							// changed: their preset schedule list is ignored.
	MAJOR_SIT		= 16,
	GRAZE			= 17,
	BAKE			= 18,
	SEW				= 19,
	SHY				= 20,	// Tries to keep out of the Avatar's way - will
							// half-heartedly flee until out of a certain range.
	LAB				= 21,
	THIEF			= 22,	// Approaches the party and will take gold from the Avatar's
							// backpack, then will bark "Greetings!" in SI.
	WAITER			= 23,
	SPECIAL			= 24,	// ??
	KID_GAMES		= 25,	// Tag! Thou art it! And so forth.
	TAG				= 25,
	EAT_AT_INN		= 26,	// same as Eat, only with different barks.
	DUEL			= 27,
	SPAR			= 27,
	PREACH			= 28,	// Broken in SI, Leon resets to Loiter after trying it.
	PATROL			= 29,	// This tells the AI to follow a particular set of
							// patrol waypoints, defined by path eggs.
	DESK_WORK		= 30,
	FOLLOW_AVATAR	= 31	// That most noble of pursuits. Like WAIT, this
							// completely overrides the NPC's schedule list.
};

enum inv_slots_bg {
	BG_BACKPACK		=  0,
	BG_WEAPON_HAND	=  1,
	BG_SHIELD_HAND	=  2,
	BG_OFF_HAND		=  2,
	BG_BELT			=  3,
	BG_TORSO		=  5,
	BG_LEFT_RING	=  6,
	BG_RIGHT_RING	=  7,
	BG_QUIVER		=  8,
	BG_HEAD			=  9,
	BG_LEGS			= 10,
	BG_FEET			= 11,
	BG_USECODE		= 12,	// Exult-only; ported from SI
	BG_CLOAK		= 13,	// Exult-only; ported from SI
	BG_GLOVES		= 14,	// Exult-only; ported from SI
	BG_TRIPLE_BOLTS	= 15,
	BG_EARS			= 16,	// Exult-only; ported from SI
	BG_BACK_SHIELD	= 17,	// Exult-only; ported from SI
	BG_BACK_2H		= 19,	// Exult-only; ported from SI
	BG_BOTH_HANDS	= 20,
	BG_LRGLOVES		= 21,	// Uses both ring slots
	BG_AMULET		= 22	// Exult-only; ported from SI
};

enum inv_slots_si {
	SI_SHIELD_HAND	=  0,
	SI_OFF_HAND		=  0,
	SI_WEAPON_HAND	=  1,
	SI_CLOAK		=  2,
	SI_AMULET		=  3,
	SI_HEAD			=  4,
	SI_GLOVES		=  5,
	SI_USECODE		=  6,
	SI_RIGHT_RING	=  7,
	SI_LEFT_RING	=  8,
	SI_EARS			=  9,
	SI_QUIVER		= 10,
	SI_BELT			= 11,
	SI_TORSO		= 12,
	SI_FEET			= 13,
	SI_LEGS			= 14,
	SI_BACKPACK		= 15,
	SI_BACK_SHIELD	= 16,
	SI_BACK_2H		= 17,
	SI_TRIPLE_BOLTS	= 18,	// Exult-only; ported from BG
	SI_BOTH_HANDS	= 20,
	SI_LRGLOVES		= 21,	// Exult-only; ported from BG ; uses both ring slots
};

enum npc_attack_modes {
	NEAREST		= 0,
	WEAKEST		= 1,
	STRONGEST	= 2,
	BERSERK		= 3,
	PROTECT		= 4,
	DEFEND		= 5,
	FLANK		= 6,
	FLEE		= 7,
	RANDOM		= 8,
	MANUAL		= 9
};

enum item_masks {
	MASK_NONE				= 0x0,
	MASK_NPC				= 0x04,		//Only find NPCs, alive or dead
	MASK_NPC2				= 0x08,		//Only find living NPCs
	MASK_EGG				= 0x10,		//Also for barges
	MASK_INVISIBLE			= 0x20,
	MASK_PARTY_INVISIBLE	= 0x40,
	MASK_TRANSLUCENT		= 0x80,
	MASK_ALL_UNSEEN			= 0xB0		//MASK_EGG+MASK_INVISIBLE+MASK_TRANSLUCENT
};

 enum Music_tracks {
	MUSIC_INVALID = 0,
	// Musics 1-8 are various BG tracks better left not played in usecode.
	MUSIC_VICTORY = 9,
	MUSIC_DANGER = 0xA,
	MUSIC_COMBAT = 0xB,
	MUSIC_BATTLE = 0xC,
	MUSIC_ORCHESTRAL_1 = 0xD,
	MUSIC_ORCHESTRAL_2 = 0xE,
	MUSIC_WINNER = 0xF,
	MUSIC_FLIGHT = 0x10,
	MUSIC_WILDERNESS = 0x11,
	MUSIC_HIDDEN_DANGER = 0x12,
	MUSIC_MARKET_PLACE = 0x13,
	MUSIC_SEEDY_TAVERN = 0x14,
	MUSIC_SEA_SHANTY = 0x15,
	MUSIC_STONES = 0x16,
	MUSIC_RULE_BRITANNIA = 0x17,
	MUSIC_FANFARE_OF_LORD_BRITISH = 0x18,
	MUSIC_DRAGONS_FLIGHT = 0x19,
	MUSIC_LOVE_THEME = 0x1A,
	MUSIC_DEAD_BODIES = 0x1B,
	MUSIC_PASSION_PLAY = 0x1C,
	MUSIC_CHAMBER_MUSIC = 0x1D,
	MUSIC_CAMPING = 0x1E,
	MUSIC_FORTUNE_TELLER = 0x1F,
	MUSIC_GHOSTS = 0x20,
	MUSIC_MAGIC_TRICKS = 0x21,
	MUSIC_FANFARE_OF_TRUTH = 0x22,
	MUSIC_FELLOWSHIP_THEME = 0x23,
	MUSIC_THE_BEAUTY = 0x24,
	MUSIC_LOVE_A_VIRTUE = 0x25,
	MUSIC_FANFARE_OF_COURAGE = 0x26,
	MUSIC_PRINCE_THRAKHATHS_THEME = 0x27,
	MUSIC_TORTURE = 0x28,
	MUSIC_MUSIC_BOX = 0x29,
	MUSIC_SHRINE_OF_HONESTY = 0x2A,
	MUSIC_SHRINE_OF_COMPASSION = 0x2B,
	MUSIC_SHRINE_OF_VALOR = 0x2C,
	MUSIC_SHRINE_OF_JUSTICE = 0x2D,
	MUSIC_SHRINE_OF_SACRIFICE = 0x2E,
	MUSIC_SHRINE_OF_HONOR = 0x2F,
	MUSIC_SHRINE_OF_SPIRITUALITY = 0x30,
	MUSIC_SHRINE_OF_HUMILITY = 0x31,
	// Skipping 0x32, not used in-maps, in-usecode, nor does it have an ogg.
	MUSIC_ORB_OF_THE_MOONS = 0x33,	// Used in orb usecode, no ogg and no data?
	MUSIC_CAVE = 0x34,
	MUSIC_EMP_THEME = 0x35,
	MUSIC_FLIGHT_OF_THE_BUMBLEBEE = 0x36,
	MUSIC_WISP_CALL = 0x37,
	MUSIC_XYLOPHONE = 0x38,
	MUSIC_HARPSICHORD = 0x39,
	MUSIC_HARP = 0x3A,
	MUSIC_LUTE = 0x3B,

	MUSIC_STOP = 0xFF,
	PLAY_REPEAT = 1,
	PLAY_ONCE = 0,
};

enum Sound_Effects {
	SFX_BOW_TWANG = 0,
	SFX_MISSILE_HIT = 1,
	SFX_BLADE_SWING = 2,
	SFX_BLUNT_SWING = 3,
	SFX_BLUNT_THUD = 4,
	SFX_ARMOR_CLINK = 5,
	SFX_ROTATING_WOOSH = 6,
	SFX_EXPLOSION_SMALL = 7,
	SFX_EXPLOSION_MEDIUM = 8,
	SFX_EXPLOSION_LARGE = 9,
	SFX_WHIP_CRACK = 0xA,
	SFX_LIGHTNING_WHIP = 0xB,
	SFX_FIRE_WAND = 0xC,
	SFX_TORCHES = 0xD,
	SFX_GUMP = 0xE,
	SFX_GAVEL_THUD = 0xF,
	SFX_TREADLE = 0x10,
	SFX_GRANDFATHER_CLOCK_TICK = 0x11,
	SFX_GRANDFATHER_CLOCK_TOCK = 0x12,
	SFX_GRANDFATHER_CLOCK_CHIME = 0x13,
	SFX_FIRE_CRACKLE1 = 0x14,
	SFX_FIRE_CRACKLE2 = 0x15,
	SFX_FIRE_CRACKLE3 = 0x16,
	SFX_BELL_DING = 0x17,
	SFX_BELL_DONG = 0x18,
	SFX_LOG_SAW = 0x19,
	SFX_MILL_STONE = 0x1A,
	SFX_KEY_CLICK = 0x1B,
	SFX_LEVER_SWITCH = 0x1C,
	SFX_ROULETTE_WHEEL = 0x1D,
	SFX_DOOR_OPEN = 0x1E,
	SFX_DOOR_CLOSE = 0x1F,
	SFX_PORTCULLIS_OPEN = 0x20,
	SFX_PORTCULLIS_CLOSE = 0x21,
	SFX_DRAWBRIDGE_OPEN = 0x22,
	SFX_DRAWBRIDGE_CLOSE = 0x23,
	SFX_FUSE = 0x24, // Name comes from SFX, no idea
	SFX_GLASS_SHATTERING = 0x25,
	SFX_SPLASH = 0x26, // Name comes from SFX, no idea
	SFX_W_ANCHOR = 0x27, // Name comes from SFX, no idea
	SFX_D_ANCHOR = 0x28, // Name comes from SFX, no idea
	SFX_LIQUID_SPLASH = SFX_D_ANCHOR,	// Better name
	SFX_CREAK_HIGH = 0x29,
	SFX_CREAK_LOW = 0x2A,
	SFX_GUMPSTER_OPEN = 0x2B, // Name comes from SFX, no idea
	SFX_GUMPSTER_CLOSE = 0x2C, // Name comes from SFX, no idea
	SFX_BLACKSMITH_HAMMER_CLANG = 0x2D,
	SFX_BLACKSMITH_DOUSING = 0x2E,
	SFX_BLACKSMITH_BELLOWS = 0x2F,
	SFX_WATER_FOUNTAIN = 0x30,
	SFX_WAVE_CRASHING = 0x31,
	SFX_WATER_STREAM = 0x32,
	SFX_WATERFALL = 0x33, // Name comes from SFX, no idea
	SFX_WEAK_WOOSH1 = 0x34,
	SFX_WEAK_WOOSH2 = 0x35,
	SFX_SWAMP_BUBBLE1 = 0x36,
	SFX_SWAMP_BUBBLE2 = 0x37,
	SFX_SWAMP_BUBBLE3 = 0x38,
	SFX_SWAMP_BUBBLE4 = 0x39,
	SFX_SWAMP_BUBBLE5 = 0x3A,
	SFX_WATERWHEEL = 0x3B,
	SFX_EARTHQUAKE = 0x3C,
	SFX_CRICKETS = 0x3D,
	SFX_THUNDER = 0x3E,
	SFX_WHIRLPOOL = 0x3F, // Name comes from SFX, no idea
	SFX_HEALING_MAGIC = 0x40,
	SFX_COMBAT_MAGIC = 0x41,
	SFX_ITEM_MAGIC = 0x42,
	SFX_WIZARD_MAGIC = 0x43, // Name comes from SFX
	SFX_GENERAL_MAGIC = 0x44, // Name comes from SFX
	SFX_SPELL_FAIL = 0x45,
	SFX_SPELL_DOUSE = 0x46, // Name comes from SFX, no idea
	SFX_VENOM_DRAIN = 0x47,
	SFX_VENOM_EFFECT = 0x48,
	SFX_RAT_RACE_CLOSE = 0x49,
	SFX_RAT_RACE_OPEN = 0x4A,
	SFX_SUCCESS_BUZZ = 0x4B, // Name comes from SFX, no idea
	SFX_FAIL_BUZZ = 0x4C,
	SFX_MOONGATE_BUZZ = 0x4D,
	SFX_BLACK_GATE_HUM = 0x4E,
	SFX_VORTEX_CUBE_HUM = 0x4F,
	SFX_SPHERE_GENERATOR_HUM = 0x50,
	SFX_TETRAHEDRON_GENERATOR_HUM = 0x51,
	SFX_CUBE_GENERATOR_HUM = 0x52,
	SFX_COMEDIC_SLAP = 0x53,
	SFX_COMEDIC_THUD = 0x54,
	SFX_BIRD_CHIRP = 0x55,
	SFX_HEAVY_THUD = 0x56,
	SFX_SAIL_FURL = 0x57,
	SFX_SAIL_UNFURL = 0x58,
	SFX_SWAMP_BUBBLE6 = 0x59, //???
	SFX_QUAFF = 0x5A,
	SFX_GULP = 0x5B,
	SFX_WHIP_B = 0x5C, // Name comes from SFX, no idea
	SFX_DOOR_SLAM = 0x5D, // Name comes from SFX, no idea
	SFX_PORTCULLIS = 0x5E, // Name comes from SFX, no idea
	SFX_DRAWBRIDGE = 0x5F, // Name comes from SFX, no idea
	SFX_CLOSED = 0x60, // Name comes from SFX, no idea
	SFX_SPIN_WHEEL = 0x61, // Name comes from SFX, no idea
	SFX_MINING_FULL = 0x62, // Name comes from SFX, no idea
	SFX_MINING_SHORT = 0x63, // Name comes from SFX, no idea
	SFX_SHUTTERS = 0x64, // Name comes from SFX, no idea
	SFX_1ARMBANDIT = 0x65, // Name comes from SFX, no idea
	SFX_LOOM = 0x66, // Name comes from SFX, no idea
	SFX_STALACTITES = 0x67,
	SFX_MAGIC_WEAPON_HUM = 0x68,
	SFX_POISON = 0x69, // Name comes from SFX, no idea
	SFX_IGNITE = 0x6A,
	SFX_MUSKET_SHOT = 0x6B,
	SFX_WIND_SPELL = 0x6C,
	SFX_PROTECT_SPELL = 0x6D,
	SFX_POISON_SPELL = 0x6E,
	SFX_IGNITE_SPELL = 0x6F, // Name comes from SFX
	SFX_CRADLE_ROCK = 0x70, // Name comes from SFX, no idea
	SFX_LONG_BUZZ = 0x71,	// No idea
	SFX_MECHANISMS = 0x72,
};

enum Speech_clips {
	SPEECH_GUARDIAN_REST = 1,
	SPEECH_GUARDIAN_GO_INSIDE = 2,
	SPEECH_GUARDIAN_THANKS_NOTEBOOK = 3,
	SPEECH_GUARDIAN_TRAP_WARNING = 4,
	SPEECH_GUARDIAN_DONT_TRUST_TIME_LORD = 5,
	SPEECH_GUARDIAN_SURE_DEATH = 6,
	SPEECH_GUARDIAN_NOT_WELCOME = 7,
	SPEECH_GUARDIAN_THINK_AGAIN = 8,
	SPEECH_GUARDIAN_ONE_TRUE_ONE_FALSE = 9,
	SPEECH_GUARDIAN_TWO_TRUE_OR_FALSE = 0xA,
	SPEECH_GUARDIAN_NO_THINK_AGAIN = 0xB,
	SPEECH_GUARDIAN_EITHER_TRUE_OR_FALSE = 0xC,
	SPEECH_GUARDIAN_STOP_AVATAR = 0xD,
	SPEECH_GUARDIAN_MOMENT_OF_TRUTH = 0xE,
	SPEECH_GUARDIAN_LAUGH_RANGE_START = 0x12,
	SPEECH_GUARDIAN_LAUGH_RANGE_END = 0x15,
	SPEECH_GUARDIAN_POOR_AVATAR = 0x16,
	SPEECH_GUARDIAN_WELL_DONE = 0x17,
	SPEECH_GUARDIAN_WRONG_DIRECTION = 0x18,
	SPEECH_GUARDIAN_GO_AWAY = 0x19,
	SPEECH_GUARDIAN_PRECISELY = 0x1A,
	SPEECH_GUARDIAN_BEST_NOT_DO = 0x1B,
	SPEECH_GUARDIAN_KNOW_WHERE_GOING = 0x1C,
	SPEECH_GUARDIAN_PROPER_DIRECTION = 0x1D,
	SPEECH_GUARDIAN_PAGAN_LORD = 0x1E,
	SPEECH_GUARDIAN_LAUGH = 0x1F,
};

/*
 *	NPC animation frames. Use these with UI_set_item_frame or (preferably) in
 *	script blocks, with 'actor frame'.
 *	e.g.: script AVATAR {  actor frame STAND; actor frame USE; actor frame
 *	SWING_1; actor_frame STAND; }
 *	Important note: use 'actor frame' with NPCs instead of 'frame', as 'actor
 *	frame' takes the NPC's current facing into account.
 */
enum npc_frames {
	STAND		= 0,
	WALK_1		= 1,
	WALK_2		= 2,

	USE			= 3,	//general use motion

	SWING_1		= 4,	//start of one-handed swing, arm up over shoulder
	SWING_2		= 5,	//middle of one-handed swing, arm out to the side
	SWING_3 	= 6,	//end of one-handed swing, arm out to the front

	SWING_2H_1 	= 7,	//start of 2-handed swing, arms up over shoulder
	SWING_2H_2 	= 8,	//middle of 2-handed swing, arms out to the side
	SWING_2H_3	= 9,	//end of 2-handed swing, arms out to the front

	SIT			= 10,	//sitting down
	LEAN		= 11,	//leaning down
	KNEEL		= 12,	//kneeling on one knee
	LIE			= 13,	//lying down
	CAST_1		= 14,	//both arms high in the air (casting motion)
	CAST_2		= 15	//both arms stretched out (casting motion)
};

//NPC animation frames, WITH rotation bit. Use these with UI_set_item_frame_rot
//or (preferably) in script blocks, with 'frame'.
//e.g.: script AVATAR {  frame STAND_WEST; frame USE_NORTH; frame SWING_1_SOUTH; frame STAND_EAST; }
enum npc_rot_frames {
	STAND_NORTH			= 0x00,
	WALK_1_NORTH		= 0x01,
	WALK_2_NORTH		= 0x02,
	USE_NORTH			= 0x03,
	SWING_1_NORTH		= 0x04,
	SWING_2_NORTH		= 0x05,
	SWING_3_NORTH		= 0x06,
	SWING_2H_1_NORTH	= 0x07,
	SWING_2H_2_NORTH	= 0x08,
	SWING_2H_3_NORTH	= 0x09,
	SIT_NORTH			= 0x0A,
	LEAN_NORTH			= 0x0B,
	KNEEL_NORTH			= 0x0C,
	LIE_NORTH			= 0x0D,
	CAST_1_NORTH		= 0x0E,
	CAST_2_NORTH		= 0x0F,
	STAND_SOUTH			= 0x10,
	WALK_1_SOUTH		= 0x11,
	WALK_2_SOUTH		= 0x12,
	USE_SOUTH			= 0x13,
	SWING_1_SOUTH		= 0x14,
	SWING_2_SOUTH		= 0x15,
	SWING_3_SOUTH		= 0x16,
	SWING_2H_1_SOUTH	= 0x17,
	SWING_2H_2_SOUTH	= 0x18,
	SWING_2H_3_SOUTH	= 0x19,
	SIT_SOUTH			= 0x1A,
	LEAN_SOUTH			= 0x1B,
	KNEEL_SOUTH			= 0x1C,
	LIE_SOUTH			= 0x1D,
	CAST_1_SOUTH		= 0x1E,
	CAST_2_SOUTH		= 0x1F,
	STAND_WEST			= 0x20,
	WALK_1_WEST			= 0x21,
	WALK_2_WEST			= 0x22,
	USE_WEST			= 0x23,
	SWING_1_WEST		= 0x24,
	SWING_2_WEST		= 0x25,
	SWING_3_WEST		= 0x26,
	SWING_2H_1_WEST		= 0x27,
	SWING_2H_2_WEST		= 0x28,
	SWING_2H_3_WEST		= 0x29,
	SIT_WEST			= 0x2A,
	LEAN_WEST			= 0x2B,
	KNEEL_WEST			= 0x2C,
	LIE_WEST			= 0x2D,
	CAST_1_WEST			= 0x2E,
	CAST_2_WEST			= 0x2F,
	STAND_EAST			= 0x30,
	WALK_1_EAST			= 0x31,
	WALK_2_EAST			= 0x32,
	USE_EAST			= 0x33,
	SWING_1_EAST		= 0x34,
	SWING_2_EAST		= 0x35,
	SWING_3_EAST		= 0x36,
	SWING_2H_1_EAST		= 0x37,
	SWING_2H_2_EAST		= 0x38,
	SWING_2H_3_EAST		= 0x39,
	SIT_EAST			= 0x3A,
	LEAN_EAST			= 0x3B,
	KNEEL_EAST			= 0x3C,
	LIE_EAST			= 0x3D,
	CAST_1_EAST			= 0x3E,
	CAST_2_EAST			= 0x3F
};

enum Training_codes {
	TRAIN_MISSING_SKILL = 0,
	TRAIN_MISSING_GOLD = 1,
	TRAIN_OVER_SKILLED = 2,
	TRAIN_CAN_TRAIN = 3,
};

enum Buying_codes {
	BUYING_NOTHING = 0,
	BUYING_SUCCESS = 1,
	BUYING_CANT_CARRY_ALL = 2,
	BUYING_NO_SPELLBOOK = 2,
	BUYING_CANT_AFFORD = 3,
	BUYING_ALREADY_HAVE = 4,
};

enum Palette_fades {
	FADE_TO_BLACK = 0,
	FADE_FROM_BLACK = 1,
};

enum Timers {
	TIMER_FLAG_FORGERY = 0,
	TIMER_BENNIES_FREE_MEAL = 1,
	TIMER_MARTINES_FUN_TIME = 2,
	TIMER_ROBERTOS_FUN_TIME = 3,
	TIMER_WENCHS_FUN_TIME = 4,
	TIMER_CLEAR_SECOND_MURDER = 5,
	TIMER_CLEAR_MAGINCIA_MURDER = 6,
	TIMER_BALAYNA_LEAVE = 8,
	TIMER_JAANA_HEAL_RECOVERY = 0xA,
	TIMER_THIEVERY_FORGIVENESS = 0xB,
};

enum Wall_Find_flags {
	FLAG_FIND_PORTCULLIS = 0,
	FLAG_FIND_METAL_WALLS = 1,
};
