// Panela de Pressão
// MIDI

// Modularized into separate files in January 2014

// MIDI (QuNeo) stuff

var currentBank = 0;
var quneoChannel = 11;
var padsArray = Array.newClear(128);
var currentMasterOut = 0.1;

// MIDI-controlled values to be accessed by Pfunc inside Pbinds:
~ampsArray = Array.newClear(128);
~whichSource = 0;
~att = 0.01;
~relRQ = 0.1;
~relGliss = 0.99;
~rel = 1;

MIDIdef.freeAll;


// NOTE-ON (16 pads)
MIDIdef.noteOn(
	key: \noteOn,
	func: {arg vel, note;

		// update current QuNeo bank being used
		case
		{note < 52} {currentBank = 0}
		{note < 68} {currentBank = 1}
		{note < 84} {currentBank = 2}
		{note < 100} {currentBank = 3};

		["BANK", currentBank, "NOTE", note].postln;

		if(~patternArray[note].isNil,
			{"no pattern here".postln},
			{
				~ampsArray[note] = vel.linlin(0, 127, 0, 1);
				padsArray[note] = ~patternArray[note].play;
			};
		);
	},
	noteNum: (36..99),
	chan: quneoChannel);

// NOTE-OFF (16 pads)
MIDIdef.noteOff(
	key: \noteOff,
	func: {arg vel, note;
		padsArray[note].stop},
	noteNum: (36..99),
	chan: quneoChannel);

// PADS CC (pads pressure to control amp)
MIDIdef.cc(
	key: \pressure,
	func: {arg val, num;
		var note;
		var padNumber = (23, 26 .. 68).indexOf(num);
		case
		{currentBank == 0} {note = padNumber + 36}
		{currentBank == 1} {note = padNumber + 52}
		{currentBank == 2} {note = padNumber + 68}
		{currentBank == 3} {note = padNumber + 84};

		~ampsArray[note] = val.linlin(0, 127, 0, 1);
		// val.linlin(0, 127, 0, 1).postln;
	},
	ccNum: (23, 26 .. 69), // pressure CC from each pad
	chan: quneoChannel);


// MASTER OUT (top horizontal slider controls masterOut volume)
MIDIdef.cc(
	key: \topHorizontalSliderX,
	func: {arg v;
		currentMasterOut = v.linlin(0, 127, 0, 1);
		~masterOut.set(\amp, currentMasterOut)},
	ccNum: 0, // top horizontal slider X axis
	chan: quneoChannel);

// Vertical sliders:
// 1 - ATTACK (amplitude envelope)
// 2 - RELEASE FILTER RQ
// 3 - RELEASE FILTER SWEEP (gliss factor)
// 4 - RELEASE (amplitude envelope)

MIDIdef.cc(
	key: \verticalSliders,
	func: {arg val, num;
		case
		{num==6} {~att = val.linlin(0, 127, 0.01, 1)}
		{num==7} {~relRQ = val.linexp(0, 127, 0.001, 0.6)}
		{num==8} {
			~relGliss = if(val<40,
				{ val.linexp(0, 39, 0.5, 1) },
				{ if(val<80,
					{ 1 },
					{ val.linexp(80, 127, 1, 4) } ) })
		}
		{num==9} {~rel = val.linlin(0, 127, 0.1, 10)};
		[~att, ~relRQ, ~relGliss, ~rel].round(0.1).postln;
	},
	ccNum: [6,7,8,9],
	chan: quneoChannel);

// LONG SLIDER
// ~whichSource (crisp or white-noisy; "POP" / "RASP")
MIDIdef.cc(
	key: \longSliderX,
	func: {arg v; ~whichSource = v.linlin(0, 127, 0, 1)},
	ccNum: 10, // Long Slider X axis
	chan: quneoChannel);

// LEFT ROTARY (MUTE)
MIDIdef.noteOn(
	key: \rotaryMuteOn,
	func: { "hello".postln; ~masterOut.set(\amp, 0) },
	noteNum: 4,
	chan: quneoChannel);
MIDIdef.noteOff(
	key: \rotaryMuteOff,
	func: { ~masterOut.set(\amp, currentMasterOut) },
	noteNum: 4,
	chan: quneoChannel);

"End of MIDI settings file".postln;
