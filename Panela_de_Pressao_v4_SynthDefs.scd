// Panela de Pressão
// SynthDefs

// Modularized into separate files in January 2014

s.waitForBoot({

	// SynthDefs

	{
		// Main SynthDef
		SynthDef("noise-quneo-2", {arg freq = 1000, pulseFreq = 10, amp = 0.1, rq = 0.001, att = 0.01, rel = 1, gate = 1, which = 0, relGliss = 0.99, relRQ = 0.1;
			var snd, env;
			env = EnvGen.kr(Env.asr(att, 0.8, rel, curve: -5), gate: gate, doneAction: 2);
			snd = BPF.ar(
				in: WhiteNoise.ar(SelectX.ar(Lag.kr(which, 1),
					[
						Impulse.ar(pulseFreq),
						LFPulse.ar(pulseFreq,0,0.5) * 0.01
					]
				)),
				freq: freq,
				rq: Lag.kr(rq, 1));
			snd = snd * env * Lag.kr(amp, 1) * 100;
			snd = Clip.ar(snd, -0.5, 0.5);
			snd = Select.ar(gate, [
				BPF.ar(
					in: snd,
					freq: EnvGen.kr(Env.new([freq, freq * relGliss], [rel], curve: \lin), gate: 0.pow(gate)),
					rq: relRQ) * 2,
				snd]);
			Out.ar(0, snd);
		}).add;

		// MasterOut SynthDef
		SynthDef(\amp, {arg inbus=0, amp = 0.1, lag = 0.1;
			var in = In.ar(inbus, 1) * Lag.kr(amp, lag);
			var snd = Pan4.ar(in, LFNoise2.kr(1/4), LFNoise2.kr(1/3));
			ReplaceOut.ar(inbus, snd);
		}).add;


		// Wait for SynthDefs to be added...
		s.sync;

		// Now call the Master Out Synth:
		~masterOut = Synth("amp", addAction: \addToTail);

	}.fork;

});
