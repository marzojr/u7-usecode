
enum sprite_repeats {
	LOOP_ONCE = -1,
	LOOP_ONCE2 = -3	// Not sure about this
};

enum spells_si {
	SPELL_NONE = 0,

	SPELL_CREATE_FOOD = 0,
	SPELL_CURE,
	SPELL_DETECT_TRAP,
	SPELL_GREAT_DOUSE,
	SPELL_GREAT_IGNITE,
	SPELL_LIGHT,
	SPELL_LOCATE,
	SPELL_TELEKINESIS,

	SPELL_AWAKEN,
	SPELL_DESTROY_TRAP,
	SPELL_FALSE_COIN,
	SPELL_COLD_BLAST,
	SPELL_GREAT_LIGHT,
	SPELL_HEAL,
	SPELL_MASS_CURE,
	SPELL_PROTECTION,

	SPELL_CHILL,
	SPELL_CURSE,
	SPELL_ENCHANT_MISSILES,
	SPELL_COLUMNAS_INTUITION,
	SPELL_PROTECT_ALL,
	SPELL_PARALYZE,
	SPELL_SLEEP,
	SPELL_TRANSLATION,

	SPELL_BLINK,
	SPELL_DETER,
	SPELL_FLASH,
	SPELL_CREATE_SOUL_PRISM,
	SPELL_MASS_CURSE,
	SPELL_REVEAL,
	SPELL_TRANSCRIBE,
	SPELL_UNLOCK_MAGIC,

	SPELL_CONJURE,
	SPELL_DISPEL_FIELD,
	SPELL_EXPLOSION,
	SPELL_GREAT_HEAL,
	SPELL_INVISIBILITY,
	SPELL_MASS_SLEEP,
	SPELL_SUMMON_SHADE,
	SPELL_ERSTAMS_SURPRISE,

	SPELL_BETRAY,
	SPELL_DISPEL_ILLUSION,
	SPELL_CAUSE_FEAR,
	SPELL_FIRE_FIELD,
	SPELL_FIRE_RING,
	SPELL_COLD_STRIKE,
	SPELL_CREATE_AMMO,
	SPELL_CREATE_AUTOMATON,

	SPELL_ENERGY_FIELD,
	SPELL_ENERGY_MIST,
	SPELL_MASS_AWAKEN,
	SPELL_MASS_MIGHT,
	SPELL_POISON_MIST,
	SPELL_RESTORATION,
	SPELL_VIBRATE,
	SPELL_LIGHTNING,

	SPELL_CREATE_ICE,
	SPELL_MIND_BLAST,
	SPELL_DELAYED_BLAST,
	SPELL_FETCH,
	SPELL_INVOKE_SNOW_SERPENT,
	SPELL_SERPENT_BOND,
	SPELL_FIRE_SNAKE,
	SPELL_SWORD_STRIKE,

	SPELL_DEATH_VORTEX,
	SPELL_MASS_DEATH,
	SPELL_INVISIBLE_ALL,
	SPELL_SPIRAL_MISSILE,
	SPELL_STOP_STORM,
	SPELL_SUMMON,
	SPELL_TIME_STOP,
	SPELL_IMBALANCE,
};

enum sprite_effects {
	ANIMATION_BIG_BLAST			= 1,
	ANIMATION_BIG_CLOUDS		= 2,
	ANIMATION_CLOUDS			= 3,
	ANIMATION_MEDIUM_BLAST		= 4,
	ANIMATION_SMALL_BLAST		= 5,
	ANIMATION_CLOUDS2			= 6,
	ANIMATION_TELEPORT			= 7,
	ANIMATION_DEATH_VORTEX		= 8,
	ANIMATION_POOF				= 9,
	ANIMATION_RED_DUST			= 11,
	ANIMATION_FIREWORKS			= 12,
	ANIMATION_GREEN_BUBBLES		= 13,
	ANIMATION_SPARKLES			= 16,
	ANIMATION_LIGHTNING			= 17,
	ANIMATION_BLUE_BEADS		= 18,
	ANIMATION_BURST_ARROW		= 19,
	ANIMATION_PURPLE_BUBBLES	= 21,
	ANIMATION_SWORD_STRIKE		= 23,
	ANIMATION_MUSIC				= 24,
	ANIMATION_BLANK_25			= 25,
	ANIMATION_TELEPORT2			= 26,
	ANIMATION_SMALL_RING_BLAST	= 27,
	ANIMATION_BLANK_28			= 28,
	ANIMATION_BIG_RING_BLAST	= 30,
	ANIMATION_MEDIUM_RING_BLAST	= 31,
	ANIMATION_RED_SWIRL			= 32,
	ANIMATION_PULSATING_DISC	= 33,
	ANIMATION_SERPENT_OVERLAY	= 39,
	ANIMATION_LIGHTNING_BLUE	= 40,
	ANIMATION_LIGHTNING_RED		= 41,
	ANIMATION_LIGHTNING_YELLOW	= 42,
	ANIMATION_LIGHTNING_GREEN	= 43,
	ANIMATION_TURTLE_RISE		= 46,
	ANIMATION_FROST_RING		= 47,
	ANIMATION_REVIVING_SNAKE	= 48,
	ANIMATION_EST_NUDI			= 50,
	ANIMATION_GOLDEN_SPARKLE	= 51,
	ANIMATION_PETRA_VISION		= 53,
	ANIMATION_ORB_BURST			= 54,
	ANIMATION_SWIRL_BARRIER		= 55,
	ANIMATION_SLASH_BURST		= 56,
	ANIMATION_VAMPIRE_RISING	= 61,
};

enum cursors {
	CURSOR_HAND			= 0,
	CURSOR_X			= 1,	//Default "no you can't do that" X cursor
	CURSOR_OUT_OF_RANGE = 2,
	CURSOR_OUT_OF_AMMO	= 3,
	CURSOR_TOO_HEAVY	= 4,
	CURSOR_WONT_FIT		= 5
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

enum skins {
	BLACK_AVATAR = 0,
	LATINO_AVATAR = 1,
	BLONDE_AVATAR = 2
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
	SONIC_DAMAGE		= 5
};

enum wildcards {
	FIND_ON_SCREEN	= -359,
	QUANTITY_ANY	= -359,
	SHAPE_ANY		= -359,
	ANY_SHAPE		= -1,	// For find_nearby
	ON_SCREEN		= -1,	// For find_nearest/find_nearby
	ZERO_DELAY		= -1,	// For run_script
	ZERO_DELAY2		= -2,	// For run_script
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
	NORTHWEST	= 7
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
							// STARTED_TALKING event is triggered on the NPC.
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
