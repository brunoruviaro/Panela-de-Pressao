// ************************************
// Panela de Pressão
//
// Live-Electronics Improvisation by
// Bruno Ruviaro & Juan Pablo Caceres
// Multichannel version
// Modularized into separate files in January 2014
//
// ************************************

/*

Uses QuNeo controller.

HORIZONTAL SLIDER 1 - MASTER OUT

PADS - FILTERED NOISE PATTERNS
RHOMBUS BUTTON - MORE BANKS (access more patterns)

VERTICAL SLIDER 1 - ATTACK TIME
VERTICAL SLIDER 2 - RELEASE FILTER Q (use lower values for max gliss effect)
VERTICAL SLIDER 3 - RELEASE FILTER GLISS (0.5=octave below, 1=no transp, 2=octave above etc)
VERTICAL SLIDER 4 - RELEASE TIME

LONG SLIDER - POP <-> RASP (mixer style)



LEFT ROTARY - MUTE (for gestural performance)

*/

//////////
// SET UP
//////////

/*
jacktrip -n 1 -h 129.210.101.32

JP (JackTrip out) -> SuperCollider Input 1 (for Pan4)

JP (JackTrip out) -> Ardour JackTrip Dry track 9

SuperCollider 1-2-3-4 (Bruno) -> JackTrip

SuperCollider 1-2-3-4 (Bruno) -> SystemOut 1-2-3-4

SuperCollider 1-2-3-4 (Bruno) -> Ardour tracks 1-2-3-4

SuperCollider 5-6-7-8 (panned JPC) -> System Out 1-2-3-4

SuperCollider 5-6-7-8 (panned JPC) -> Ardour tracks 5-6-7-8

*/

// Do once
MIDIIn.connectAll;
s.boot;

// Quick MIDI Test
MIDIdef.noteOn(\test1, {arg ...args; args.postln});
MIDIdef.cc(\test2, {arg ...args; args.postln});

// Quick Audio Test
(
var numberOfChannels = 4;
var amplitude = 0.1;
{inf.do({numberOfChannels.do({arg b;
	{Out.ar(b, PinkNoise.ar(EnvGen.kr(Env.perc, 1, amplitude, doneAction: 2)))}.play;
	0.7.wait})});
}.fork;
)

// Load stuff
"/media/BTR/Music/SuperCollider/Panela_de_Pressao/Panela_de_Pressao_v4_MIDI.scd".load;
"/media/BTR/Music/SuperCollider/Panela_de_Pressao/Panela_de_Pressao_v4_Patterns.scd".load;
"/media/BTR/Music/SuperCollider/Panela_de_Pressao/Panela_de_Pressao_v4_SynthDefs.scd".load;

// Go!

// Pan JPa:

{ Out.ar(4, Pan4.ar(SoundIn.ar(0), LFNoise2.kr(1/4), LFNoise2.kr(1/3))) }.play;
