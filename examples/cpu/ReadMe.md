# m-ex CPU

This example describes how to use custom CPU logic for use with m-ex.

**Table of Contents**

[TOCM]

[TOC]

# Setup

Override the fighter's OnLoad function to initialize the custom CPU data.

You have two built in options when deciding cpu behavior 

```c
void OnLoad(GOBJ *fighter)
{
	// do your normal OnLoad setup
	//...
	
	// setup cpu here with either a spoof id or custom logic
}
```

## Spoofing Logic
-------------
The most basic way to define your cpu fighter is just to spoof and existing fighter.
If you are making a clone of an existing fighter, this option is the easiest and most practical.

You only need to call the custom m-ex function `MexCPU_InitSpoofData` along with your fighter GObj and the fighter ID you are spoofing.

Example:
This would make the fighter use Mario's cpu data.
```c
void OnLoad(GOBJ *fighter)
{
	// ... normal setup here

	MexCPU_InitSpoofData(fighter, FTKIND_MARIO);
	return;
}
```

## Custom Logic
-------------

This section describes how to setup the custom data needed. Defining custom logic allows much more control over what your CPU can do. 

You only need to call the custom m-ex function `MexCPU_InitCustomData` along with your fighter GObj and a pointer to a static [`MexCpuData`](#mexcpudata-definition) struct. See definition below for more info.

```c
static MexCpuData cpu_data = // ... define struct data here

void OnLoad(GOBJ *fighter)
{
	 // ... normal setup here

	MexCPU_InitCustomData(fighter, &cpu_data);
	return;
}
```

### MexCpuData
-------------

```c
typedef struct MexCpuData
{
	void (*Think)(FighterData *);   // custom cpu think callback, this is called before the default senario think, so you can do things like check state and cpu scenario to determine inputs
	float attack_radius;            // a general distance from self to target fighter used in decision making
	CpuAttack *general;             // used when fighter is grounded with no special conditions
	CpuAttack *airborne;            // used when fighter is airborne with no special conditions
	CpuAttack *projectile;          // used when there is distance between target fighter and self
	CpuAttack *grab;                // used when target fighter is shielding
	CpuAttack *item;                // used when fighter has a (throwable?) item
	CpuAttack *batteringitem;       // used when fighter has a battering item  0x18 (ITEM_FAN), 0x17 (ITEM_LIPSSTICK), 0x16 (ITEM_STARROD), 0xC (ITEM_BEAMSWORD), 0xB (ITEM_HOMERUNBAT), 0xD (ITEM_PARASOL)
	CpuAttack *offstage;            // used when target fighter is off stage
};
```

#### CpuAttack
-------------
```c
typedef struct CpuAttack
{
    int plco_script_id; // input script to execute, there are 61 of these in vanilla melee
    int distance_scale; // used for predicting if target will enter range? Tends to match x1, but for some reason is an int
    float x1;           // start x offset from fighter position
    float x2;           // end x offset from fighter position
    float y1;           // start y offset from fighter position
    float y2;           // end y offset from fighter position
    float chance;       // chance this attack will be selected
    int frame_interval; // the interval, in frames, at which this attack can occur
    int min_cpu_level;  // minimum cpu Level for this attack to occur
};
```

#### Logic Callback
-------------

```c
void Fox_CPUThink(FighterData *fd)
{
	...
}
```