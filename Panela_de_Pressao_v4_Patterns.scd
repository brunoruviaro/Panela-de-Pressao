// Panela de Pressão
// Patterns

// Modularized into separate files in January 2014
// Array indices chosen to match midi note numbers from QuNeo


~patternArray = Array.newClear(128);

~patternArray[36] = Pbind(
	\instrument, "noise-quneo-2",
	\freq, Pwhite(100, 5500),
	\pulseFreq, Pwhite(5, 10),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[36]}),
	\rq, Pwhite(0.001, 0.05),
	\which, Pfunc({~whichSource}));

~patternArray[37] = Pbind(
	\instrument, "noise-quneo-2",
	\degree, Prand([0,-5,7,11,17,21], inf),
	\pulseFreq, Pwhite(1, 9),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[37]}),
	\rq, Pwhite(0.001, 0.01),
	\which, Pfunc({~whichSource}));

~patternArray[38] = Pbind(
	\instrument, "noise-quneo-2",
	\degree, Prand([0,3,5,7,9,11,14,17], inf) - 12,
	\pulseFreq, Pwhite(1, 3),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\relGlisstain, 0.1,
	\amp, Pfunc({~ampsArray[38]}),
	\rq, 0.1,
	\which, Pfunc({~whichSource}));

~patternArray[39] = Pbind(
	\instrument, "noise-quneo-2",
	\degree, Pxrand([0,3,5,7,9,11,14,17], inf) + 12,
	\pulseFreq, Pwhite(1, 9),
	\dur, Pseq([0.2, 0.3, 0.2, 0.4], inf) * Pwhite(2, 4),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\relGlisstain, 0.6,
	\amp, Pfunc({~ampsArray[39]}),
	\rq, Prand([0.05, 0.1], inf),
	\which, Pfunc({~whichSource}));

~patternArray[40] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\note, Pseq([ [0,3,5], [7,9,11], [14,17]], inf) + Pseq([Pseq([12], 3), -10], inf),
	\pulseFreq, Pwhite(5, 11),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[40]}),
	\rq, Pwhite(0.005, 0.1),
	\which, Pfunc({~whichSource}));

~patternArray[41] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\freq, Pwalk(
		list: [1,3,5,7,9,11,14,17,14,21,22,24,24,25,21,23,18,20,21,18,17,15,14,12,11,10,9,7,5,4,3,2,1],
		stepPattern: Pwrand([-1, 0, 1], [0.25, 0.1, 0.65].normalizeSum, inf)) * Pwrand([100, 119], [0.6, 0.4], inf),
	\pulseFreq, Pwhite(5, 19),
	\dur, Pwrand([0.33, 0.34, 0.37, 0.5], [0.3, 0.3, 0.3, 0.1], inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[41]}),
	\rq, Pwhite(0.009, 0.03),
	\which, Pfunc({~whichSource}));

~patternArray[42] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pwalk([0,1,5,7,9,11,14,17,15,13,11,9,6,5,3,2,1], Prand([0, -1, 1, 1, 1, 1], inf)) + Pwrand([18, 14], [0.9, 0.1], inf),
	\pulseFreq, 3.5,
	\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf) + Pwhite(0, 0.03),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[42]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[43] = Pbind(
	\instrument, "noise-quneo-2",
	\freq, Pwhite(1000, 9500),
	\pulseFreq, Pwhite(5, 10),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[43]}),
	\rq, Pwhite(0.001, 0.05),
	\which, Pfunc({~whichSource}));

~patternArray[44] = Pbind(
	\instrument, "noise-quneo-2",
	\degree, Pseq([
		Pshuf([[10,14], [12,17], [21,15], [14,17]]) - 2,
		Pshuf([[10,14], [12,17], [21,15], [14,17]]),
		Pshuf([[10,14], [12,17], [21,15], [14,17]]) - 1
	], inf),
	\pulseFreq, Pwhite(1, 9),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[44]}),
	\rq, 0.01,
	\which, Pfunc({~whichSource}));

~patternArray[45] = Pbind(
	\instrument, "noise-quneo-2",
	\note, Prand([0,3,5,7,9,11,14,17], inf),
	\pulseFreq, Pwhite(1, 9),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\relGlisstain, 0.1,
	\amp, Pfunc({~ampsArray[45]}),
	\rq, 0.1,
	\which, Pfunc({~whichSource}));

~patternArray[46] = Pbind(
	\instrument, "noise-quneo-2",
	\degree, Pxrand([0,3,5,7,9,11,14,17], inf) - 12,
	\pulseFreq, Pwhite(1, 9),
	\dur, Pseq([0.2, 0.1, 0.2, 0.4], inf) * Pwhite(1, 4),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\relGlisstain, 0.2,
	\amp, Pfunc({~ampsArray[46]}),
	\rq, Prand([0.05, 0.1], inf),
	\which, Pfunc({~whichSource}));

~patternArray[47] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([[0,5,9,3,7,11]], inf),
	\pulseFreq, Pwhite(5, 19),
	\dur, Pwhite(0.3, 1),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[47]}),
	\rq, Pwhite(0.005, 0.01),
	\which, Pfunc({~whichSource}));

~patternArray[48] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([[0,5,9,3,7,11]], inf) + Pwrand([-12, -11], [0.9, 0.1], inf),
	\pulseFreq, Pwhite(1, 19),
	\dur, Pwrand([0.43, 2], [0.7, 0.3], inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[48]}),
	\rq, Pwhite(0.005, 0.01),
	\which, Pfunc({~whichSource}));

~patternArray[49] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.locrian,
	\degree, Pxrand([[7,8,6], [5,4,3], [2,1], [0,4]], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
	\pulseFreq, 0.5,
	\dur, Prand( (0.1!10) ++ (0.3!8)   , inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[49]}),
	\rq, Pwrand([0.05, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[50] = Pbind(
	\instrument, "noise-quneo-2",
	\degree, Pxrand([1,3,4,7], inf) + 24,
	\pulseFreq, Pwhite(1, 9),
	\dur, Pseq([0.2, 0.3, 0.1, 0.4], inf) * Pwhite(2, 4),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\relGlisstain, 0.6,
	\amp, Pfunc({~ampsArray[50]}),
	\rq, Prand([0.05, 0.1], inf),
	\which, Pfunc({~whichSource}));

~patternArray[51] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.harmonicMinor,
	\degree, Pseq([0,7,5,3,9,11,0], inf) + 12,
	\pulseFreq, Pwhite(5, 19),
	\dur, 0.5,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[51]}),
	\rq, Pwhite(0.05, 0.09),
	\which, Pfunc({~whichSource}));

~patternArray[52] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.harmonicMinor,
	\degree, Pseq([0,3,5,6,9,11,14,17], inf),
	\pulseFreq, Pwhite(1, 9),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[52]}),
	\rq, 0.01,
	\which, Pfunc({~whichSource}));

~patternArray[53] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([0,3,5,7,9,11,14,17], inf),
	\pulseFreq, Pwhite(5, 19),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[53]}),
	\rq, Pwhite(0.005, 0.01),
	\which, Pfunc({~whichSource}));


~patternArray[54] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
	\pulseFreq, Pwhite(5, 19),
	\dur, 0.33,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[54]}),
	\rq, Pwhite(0.005, 0.01),
	\which, Pfunc({~whichSource}));

~patternArray[55] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([-10, -11], [0.9, 0.1], inf),
	\pulseFreq, Pwhite(5, 19),
	\dur, 0.33,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[55]}),
	\rq, Pwhite(0.005, 0.01),
	\which, Pfunc({~whichSource}));

~patternArray[56] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
	\pulseFreq, 0.5,
	\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[56]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[57] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.harmonicMinor,
	\degree, Pshuf([4,3,6,7,9,11,14,17], inf),
	\pulseFreq, Pwhite(1, 9),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[57]}),
	\rq, 0.01,
	\which, Pfunc({~whichSource}));

~patternArray[58] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pseq([0,5,9,3,7,11], inf),
	\pulseFreq, Pwhite(5, 19),
	\dur, 0.3,
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[58]}),
	\rq, Pwhite(0.005, 0.01),
	\which, Pfunc({~whichSource}));

~patternArray[59] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.harmonicMinor,
	\degree, Pxrand([[7,8,6,5], [4,3,2], [1,0,4]], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
	\pulseFreq, 0.5,
	\dur, Prand( (0.1!10) ++ (0.2!8), inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[59]}),
	\rq, Pwrand([0.05, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[60] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pwalk([0,1,5,7,9,11,14,17,15,13,11,9,6,5,3,2,1], Prand([0, -1, 1, 1, 1, 1], inf)) + Pwrand([14, 15], [0.9, 0.1], inf),
	\pulseFreq, 2.5,
	\dur, Pseq( (0.2!60) ++ (0.3!8)   , inf) + Pwhite(0, 0.03),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[60]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[61] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pwalk([0,1,5,7,9,11,14,17,15,13,11,9,6,5,3,2,1], Prand([0, -2, 1, 1, 1, 1], inf)) + Pwrand([19, 14], [0.9, 0.1], inf),
	\pulseFreq, 3.5,
	\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf) + Pwhite(0, 0.03),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[61]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[62] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pwalk([0,1,5,7,9,11,14,17,15,13,11,9,6,5,3,2,1], Prand([0, -1, 1, 1, 1, 1], inf)) + Pwrand([20, 16], [0.9, 0.1], inf),
	\pulseFreq, 3.5,
	\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf) + Pwhite(0, 0.03),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[62]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[63] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.phrygian,
	\degree, Pwalk([0,1,5,7,9,11,14,17,15,13,11,9,6,5,3,2,1], Prand([0, -1, 1, 1, 1, 1], inf)) + Pwrand([12, 14], [0.9, 0.1], inf),
	\pulseFreq, 3.9,
	\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf) + Pwhite(0, 0.3),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[63]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[64] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.minor,
	\degree, Pwalk([0,1,5,7,9,11,14,17,15,13,11,9,6,5,3,2,1], Prand([0, -1, 1, 1, 1, 1], inf)) + Pwrand([11, 21], [0.9, 0.1], inf),
	\pulseFreq, 4.5,
	\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf) + Pwhite(0, 0.03),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[64]}),
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, Pfunc({~whichSource}));

~patternArray[65] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.minor,
	\degree, Pwalk([0,1,3,2,4], Prand([0, -1, 1], inf))
	+ Pwrand([-15, -13], [0.9, 0.1], inf),
	\pulseFreq, Pseq([2, 2, 4, 8, 2, 2], inf),
	// \att, 0.3,
	\legato, 0.4,
	\dur, Pseq( (0.2!10) ++ (0.52!8)   , inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[65]}) * 20,
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, 0.5);

~patternArray[66] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.minor,
	\degree, Pwalk([0,1,3,2,4], Prand([0, -1, 1], inf))
	+ Pwrand([-19, -16], [0.9, 0.1], inf),
	\pulseFreq, Pseq([2, 4, 5, 1, 12], inf),
	// \att, 0.3,
	\legato, 0.4,
	\dur, Pseq( (0.4!10) ++ (0.52!8), inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[66]}) * 20,
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, 0.5);

~patternArray[67] = Pbind(
	\instrument, "noise-quneo-2",
	\scale, Scale.minor,
	\degree, Pwalk([0,1,3,2,4], Prand([0, -1, 1], inf))
	+ Pwrand([-15, -16], [0.9, 0.1], inf),
	\pulseFreq, Prand([1, 3], inf),
	\legato, 0.4,
	\dur, Pseq( [0.4, Rest(3), 1.4, 2], inf),
	\att, Pfunc({~att}),
	\relRQ, Pfunc({~relRQ}),
	\relGliss, Pfunc({~relGliss}),
	\rel, Pfunc({~rel}),
	\amp, Pfunc({~ampsArray[67]}) * 20,
	\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf),
	\which, 0.5);


"End of Patterns file".postln;
"".postln;


// ~patternArray.do({ |a, b| [a, b].postln} );
// padsArray.do({ |a, b| [a, b].postln} );