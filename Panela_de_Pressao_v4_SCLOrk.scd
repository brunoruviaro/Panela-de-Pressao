// ************************************
// Panela de Pressão
// Live-Electronics Improvisation by Bruno Ruviaro
// MONO version for SCLOrk
// Modularized into separate files in January 2014
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

///////////////////////////////
// SET UP
// Evaluate line by line
///////////////////////////////

// Do once
MIDIIn.connectAll;
s.boot;

// Quick MIDI Test
MIDIdef.noteOn(\test1, {arg ...args; args.postln});
MIDIdef.cc(\test2, {arg ...args; args.postln});

// Quick Audio Test
().play;

// Load stuff
"/media/BTR/Music/SuperCollider/Panela_de_Pressao/Panela_de_Pressao_v4_MIDI.scd".load;
"/media/BTR/Music/SuperCollider/Panela_de_Pressao/Panela_de_Pressao_v4_Patterns.scd".load;
"/media/BTR/Music/SuperCollider/Panela_de_Pressao/Panela_de_Pressao_v4_SynthDefs_SCLOrk_MONO.scd".load;

// Go!

