<CsoundSynthesizer>
<CsOptions>
-d -+rtaudio=alsa -o dac:hw:0,0
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2
0dbfs=1

; The first zero is special, so that "0" still means off for the controller
giFreqTable ftgen 2, 0, -64, -2, 0.0,\
131.431,\
133.934,\
137.722,\
140.345,\
144.315,\
147.063,\
149.864,\
154.103,\
157.038,\
161.480,\
164.555,\
167.689,\
172.432,\
175.716,\
179.062,\
184.127,\
187.633,\
192.941,\
196.615,\
200.359,\
206.027,\
209.950,\
215.889,\
220,\
224.190,\
230.531,\
234.921,\
241.566,\
246.166,\
250.854,\
257.950,\
\
262.862,\
267.868,\
275.445,\
280.691,\
288.630,\
294.127,\
299.728,\
308.206,\
314.076,\
322.960,\
329.110,\
335.377,\
344.864,\
351.431,\
358.124,\
368.254,\
375.266,\
385.881,\
393.230,\
400.718,\
412.053,\
419.900,\
431.777,\
440,\
448.379,\
461.062,\
469.842,\
483.132,\
492.333,\
501.709,\
515.900,\
\
525.724

gisquare ftgen 1, 0, 8192, 10, 1, 1/4, 1/3, 1/8, 1/5, 1/12, 1/7, 1/16, 1/9, 1/20, 1/11, 1/24, 1/13, 1/28, 1/15, 1/32, 1/17, 1/36, 1/19, 1/40, 1/21, 1/44, 1/23, 1/48, 1/25, 1/52, 1/27, 1/56, 1/29, 1/60, 1/31, 1/64, 1/33, 1/68, 1/35, 1/72, 1/37, 1/76, 1/39


instr 1

kval0  init 0
kval1  init 0
kval2  init 0
kval3  init 0
kval4  init 0
kval5  init 0
kval6  init 0
kval7  init 0
kval8  init 0
kval9  init 0
kval10 init 0
kval11 init 0
kval12 init 0
kval13 init 0
kval14 init 0
kval15 init 0
kval16 init 0
kval17 init 0
kval18 init 0
kval19 init 0
kval20 init 0
kval21 init 0
kval22 init 0
kval23 init 0
kval24 init 0
kval25 init 0
kval26 init 0
kval27 init 0
kval28 init 0
kval29 init 0
kval30 init 0
kval31 init 0

kpitch0  chnget "pitch0"
kpitch1  chnget "pitch1"
kpitch2  chnget "pitch2"
kpitch3  chnget "pitch3"
kpitch4  chnget "pitch4"
kpitch5  chnget "pitch5"
kpitch6  chnget "pitch6"
kpitch7  chnget "pitch7"
kpitch8  chnget "pitch8"
kpitch9  chnget "pitch9"
kpitch10 chnget "pitch10"
kpitch11 chnget "pitch11"
kpitch12 chnget "pitch12"
kpitch13 chnget "pitch13"
kpitch14 chnget "pitch14"
kpitch15 chnget "pitch15"
kpitch16 chnget "pitch16"
kpitch17 chnget "pitch17"
kpitch18 chnget "pitch18"
kpitch19 chnget "pitch19"
kpitch20 chnget "pitch20"
kpitch21 chnget "pitch21"
kpitch22 chnget "pitch22"
kpitch23 chnget "pitch23"
kpitch24 chnget "pitch24"
kpitch25 chnget "pitch25"
kpitch26 chnget "pitch26"
kpitch27 chnget "pitch27"
kpitch28 chnget "pitch28"
kpitch29 chnget "pitch29"
kpitch30 chnget "pitch30"
kpitch31 chnget "pitch31"

kval0  tab kpitch0, 2
kval1  tab kpitch1, 2
kval2  tab kpitch2, 2
kval3  tab kpitch3, 2
kval4  tab kpitch4, 2
kval5  tab kpitch5, 2
kval6  tab kpitch6, 2
kval7  tab kpitch7, 2
kval8  tab kpitch8, 2
kval9  tab kpitch9, 2
kval10 tab kpitch10, 2
kval11 tab kpitch11, 2
kval12 tab kpitch12, 2
kval13 tab kpitch13, 2
kval14 tab kpitch14, 2
kval15 tab kpitch15, 2
kval16 tab kpitch16, 2
kval17 tab kpitch17, 2
kval18 tab kpitch18, 2
kval19 tab kpitch19, 2
kval20 tab kpitch20, 2
kval21 tab kpitch21, 2
kval22 tab kpitch22, 2
kval23 tab kpitch23, 2
kval24 tab kpitch24, 2
kval25 tab kpitch25, 2
kval26 tab kpitch26, 2
kval27 tab kpitch27, 2
kval28 tab kpitch28, 2
kval29 tab kpitch29, 2
kval30 tab kpitch30, 2
kval31 tab kpitch31, 2

a0  oscil 0.05, kval0, 1
a1  oscil 0.05, kval1, 1
a2  oscil 0.05, kval2, 1
a3  oscil 0.05, kval3, 1
a4  oscil 0.05, kval4, 1
a5  oscil 0.05, kval5, 1
a6  oscil 0.05, kval6, 1
a7  oscil 0.05, kval7, 1
a8  oscil 0.05, kval8, 1
a9  oscil 0.05, kval9, 1
a10 oscil 0.05, kval10, 1
a11 oscil 0.05, kval11, 1
a12 oscil 0.05, kval12, 1
a13 oscil 0.05, kval13, 1
a14 oscil 0.05, kval14, 1
a15 oscil 0.05, kval15, 1
a16 oscil 0.05, kval16, 1
a17 oscil 0.05, kval17, 1
a18 oscil 0.05, kval18, 1
a19 oscil 0.05, kval19, 1
a20 oscil 0.05, kval20, 1
a21 oscil 0.05, kval21, 1
a22 oscil 0.05, kval22, 1
a23 oscil 0.05, kval23, 1
a24 oscil 0.05, kval24, 1
a25 oscil 0.05, kval25, 1
a26 oscil 0.05, kval26, 1
a27 oscil 0.05, kval27, 1
a28 oscil 0.05, kval28, 1
a29 oscil 0.05, kval29, 1
a30 oscil 0.05, kval30, 1
a31 oscil 0.05, kval31, 1

aout = a0+a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+a17+a18+a19+a20+a21+a22+a23+a24+a25+a26+a27+a28+a29+a30+a31
denorm aout
aleft, aright freeverb aout, aout, 0.55, 0.35, sr, 0
outs aout+aleft, aout+aright
endin

</CsInstruments>
<CsScore>
i1 0 86400
</CsScore>
</CsoundSynthesizer>
