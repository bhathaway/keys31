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
131.245,\
133.314,\
137.797,\
139.969,\
144.674,\
146.955,\
149.273,\
154.291,\
156.723,\
161.991,\
164.545,\
167.139,\
172.758,\
175.481,\
178.248,\
184.24,\
187.145,\
193.435,\
196.485,\
199.582,\
206.291,\
209.543,\
216.586,\
220,\
223.47,\
230.983,\
234.626,\
242.515,\
246.34,\
250.224,\
258.638,\
262.717,\
266.86,\
275.833,\
280.183,\
289.603,\
294.17,\
298.81,\
308.857,\
313.728,\
324.276,\
329.39,\
334.585,\
345.834,\
351.289,\
356.829,\
368.826,\
374.643,\
387.239,\
393.347,\
399.55,\
412.984,\
419.497,\
433.602,\
440.44,\
447.389,\
462.437,\
469.733,\
485.534,\
493.196,\
500.975,\
517.829,\
526

gisquare ftgen 1, 0, 8192, 10, 1, 1/4, 1/3, 1/8, 1/5, 1/12, 1/7, 1/16, 1/9, 1/20, 1/11, 1/24, 1/13, 1/28, 1/15, 1/32, 1/17, 1/36, 1/19, 1/40, 1/21, 1/44, 1/23, 1/48, 1/25, 1/52, 1/27, 1/56, 1/29, 1/60, 1/31, 1/64, 1/33, 1/68, 1/35, 1/72, 1/37, 1/76, 1/39

gisine ftgen 3, 0, 8192, 10, 1

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

kb0 = .00000010008 * kval0^1.5688
a0_1 oscil 0.1*0.297035, kval0*1*sqrt(1.0 + kb0), 3
a0_2 oscil 0.1*0.074259, kval0*2*sqrt(1.0 + kb0*4), 3
a0_3 oscil 0.1*0.099012, kval0*3*sqrt(1.0 + kb0*9), 3
a0_4 oscil 0.1*0.037129, kval0*4*sqrt(1.0 + kb0*16), 3
a0_5 oscil 0.1*0.059407, kval0*5*sqrt(1.0 + kb0*25), 3
a0_6 oscil 0.1*0.024753, kval0*6*sqrt(1.0 + kb0*36), 3
a0_7 oscil 0.1*0.042434, kval0*7*sqrt(1.0 + kb0*49), 3
a0_8 oscil 0.1*0.018565, kval0*8*sqrt(1.0 + kb0*64), 3
a0_9 oscil 0.1*0.033004, kval0*9*sqrt(1.0 + kb0*81), 3
a0_10 oscil 0.1*0.014852, kval0*10*sqrt(1.0 + kb0*100), 3
a0_11 oscil 0.1*0.027003, kval0*11*sqrt(1.0 + kb0*121), 3
a0_12 oscil 0.1*0.012376, kval0*12*sqrt(1.0 + kb0*144), 3
a0_13 oscil 0.1*0.022849, kval0*13*sqrt(1.0 + kb0*169), 3
a0_14 oscil 0.1*0.010608, kval0*14*sqrt(1.0 + kb0*196), 3
a0_15 oscil 0.1*0.019802, kval0*15*sqrt(1.0 + kb0*225), 3
a0_16 oscil 0.1*0.009282, kval0*16*sqrt(1.0 + kb0*256), 3
a0_17 oscil 0.1*0.017473, kval0*17*sqrt(1.0 + kb0*289), 3
a0_18 oscil 0.1*0.008251, kval0*18*sqrt(1.0 + kb0*324), 3
a0_19 oscil 0.1*0.015633, kval0*19*sqrt(1.0 + kb0*361), 3
a0_20 oscil 0.1*0.007426, kval0*20*sqrt(1.0 + kb0*400), 3
a0_21 oscil 0.1*0.014145, kval0*21*sqrt(1.0 + kb0*441), 3
a0_22 oscil 0.1*0.006751, kval0*22*sqrt(1.0 + kb0*484), 3
a0_23 oscil 0.1*0.012915, kval0*23*sqrt(1.0 + kb0*529), 3
a0_24 oscil 0.1*0.006188, kval0*24*sqrt(1.0 + kb0*576), 3
a0_25 oscil 0.1*0.011881, kval0*25*sqrt(1.0 + kb0*625), 3
a0_26 oscil 0.1*0.005712, kval0*26*sqrt(1.0 + kb0*676), 3
a0_27 oscil 0.1*0.011001, kval0*27*sqrt(1.0 + kb0*729), 3
a0_28 oscil 0.1*0.005304, kval0*28*sqrt(1.0 + kb0*784), 3
a0_29 oscil 0.1*0.010243, kval0*29*sqrt(1.0 + kb0*841), 3
a0_30 oscil 0.1*0.004951, kval0*30*sqrt(1.0 + kb0*900), 3
a0_31 oscil 0.1*0.009582, kval0*31*sqrt(1.0 + kb0*961), 3
a0_32 oscil 0.1*0.004641, kval0*32*sqrt(1.0 + kb0*1024), 3
a0_33 oscil 0.1*0.009001, kval0*33*sqrt(1.0 + kb0*1089), 3
a0_34 oscil 0.1*0.004368, kval0*34*sqrt(1.0 + kb0*1156), 3
a0_35 oscil 0.1*0.008487, kval0*35*sqrt(1.0 + kb0*1225), 3
a0_36 oscil 0.1*0.004125, kval0*36*sqrt(1.0 + kb0*1296), 3
a0_37 oscil 0.1*0.008028, kval0*37*sqrt(1.0 + kb0*1369), 3
a0_38 oscil 0.1*0.003908, kval0*38*sqrt(1.0 + kb0*1444), 3
a0_39 oscil 0.1*0.007616, kval0*39*sqrt(1.0 + kb0*1521), 3

a0 sum a0_1 , a0_2 , a0_3 , a0_4 , a0_5 , a0_6 , a0_7 , a0_8 , a0_9 , a0_10 , a0_11 , a0_12 , a0_13 , a0_14 , a0_15 , a0_16 , a0_17 , a0_18 , a0_19 , a0_20 , a0_21 , a0_22 , a0_23 , a0_24 , a0_25 , a0_26 , a0_27 , a0_28 , a0_29 , a0_30 , a0_31 , a0_32 , a0_33 , a0_34 , a0_35 , a0_36 , a0_37 , a0_38 , a0_39

kb1 = .00000010008 * kval1^1.5688
a1_1 oscil 0.1*0.297035, kval1*1*sqrt(1.0 + kb1), 3
a1_2 oscil 0.1*0.074259, kval1*2*sqrt(1.0 + kb1*4), 3
a1_3 oscil 0.1*0.099012, kval1*3*sqrt(1.0 + kb1*9), 3
a1_4 oscil 0.1*0.037129, kval1*4*sqrt(1.0 + kb1*16), 3
a1_5 oscil 0.1*0.059407, kval1*5*sqrt(1.0 + kb1*25), 3
a1_6 oscil 0.1*0.024753, kval1*6*sqrt(1.0 + kb1*36), 3
a1_7 oscil 0.1*0.042434, kval1*7*sqrt(1.0 + kb1*49), 3
a1_8 oscil 0.1*0.018565, kval1*8*sqrt(1.0 + kb1*64), 3
a1_9 oscil 0.1*0.033004, kval1*9*sqrt(1.0 + kb1*81), 3
a1_10 oscil 0.1*0.014852, kval1*10*sqrt(1.0 + kb1*100), 3
a1_11 oscil 0.1*0.027003, kval1*11*sqrt(1.0 + kb1*121), 3
a1_12 oscil 0.1*0.012376, kval1*12*sqrt(1.0 + kb1*144), 3
a1_13 oscil 0.1*0.022849, kval1*13*sqrt(1.0 + kb1*169), 3
a1_14 oscil 0.1*0.010608, kval1*14*sqrt(1.0 + kb1*196), 3
a1_15 oscil 0.1*0.019802, kval1*15*sqrt(1.0 + kb1*225), 3
a1_16 oscil 0.1*0.009282, kval1*16*sqrt(1.0 + kb1*256), 3
a1_17 oscil 0.1*0.017473, kval1*17*sqrt(1.0 + kb1*289), 3
a1_18 oscil 0.1*0.008251, kval1*18*sqrt(1.0 + kb1*324), 3
a1_19 oscil 0.1*0.015633, kval1*19*sqrt(1.0 + kb1*361), 3
a1_20 oscil 0.1*0.007426, kval1*20*sqrt(1.0 + kb1*400), 3
a1_21 oscil 0.1*0.014145, kval1*21*sqrt(1.0 + kb1*441), 3
a1_22 oscil 0.1*0.006751, kval1*22*sqrt(1.0 + kb1*484), 3
a1_23 oscil 0.1*0.012915, kval1*23*sqrt(1.0 + kb1*529), 3
a1_24 oscil 0.1*0.006188, kval1*24*sqrt(1.0 + kb1*576), 3
a1_25 oscil 0.1*0.011881, kval1*25*sqrt(1.0 + kb1*625), 3
a1_26 oscil 0.1*0.005712, kval1*26*sqrt(1.0 + kb1*676), 3
a1_27 oscil 0.1*0.011001, kval1*27*sqrt(1.0 + kb1*729), 3
a1_28 oscil 0.1*0.005304, kval1*28*sqrt(1.0 + kb1*784), 3
a1_29 oscil 0.1*0.010243, kval1*29*sqrt(1.0 + kb1*841), 3
a1_30 oscil 0.1*0.004951, kval1*30*sqrt(1.0 + kb1*900), 3
a1_31 oscil 0.1*0.009582, kval1*31*sqrt(1.0 + kb1*961), 3
a1_32 oscil 0.1*0.004641, kval1*32*sqrt(1.0 + kb1*1024), 3
a1_33 oscil 0.1*0.009001, kval1*33*sqrt(1.0 + kb1*1089), 3
a1_34 oscil 0.1*0.004368, kval1*34*sqrt(1.0 + kb1*1156), 3
a1_35 oscil 0.1*0.008487, kval1*35*sqrt(1.0 + kb1*1225), 3
a1_36 oscil 0.1*0.004125, kval1*36*sqrt(1.0 + kb1*1296), 3
a1_37 oscil 0.1*0.008028, kval1*37*sqrt(1.0 + kb1*1369), 3
a1_38 oscil 0.1*0.003908, kval1*38*sqrt(1.0 + kb1*1444), 3
a1_39 oscil 0.1*0.007616, kval1*39*sqrt(1.0 + kb1*1521), 3

a1 sum a1_1 , a1_2 , a1_3 , a1_4 , a1_5 , a1_6 , a1_7 , a1_8 , a1_9 , a1_10 , a1_11 , a1_12 , a1_13 , a1_14 , a1_15 , a1_16 , a1_17 , a1_18 , a1_19 , a1_20 , a1_21 , a1_22 , a1_23 , a1_24 , a1_25 , a1_26 , a1_27 , a1_28 , a1_29 , a1_30 , a1_31 , a1_32 , a1_33 , a1_34 , a1_35 , a1_36 , a1_37 , a1_38 , a1_39

kb2 = .00000010008 * kval2^1.5688
a2_1 oscil 0.1*0.297035, kval2*1*sqrt(1.0 + kb2), 3
a2_2 oscil 0.1*0.074259, kval2*2*sqrt(1.0 + kb2*4), 3
a2_3 oscil 0.1*0.099012, kval2*3*sqrt(1.0 + kb2*9), 3
a2_4 oscil 0.1*0.037129, kval2*4*sqrt(1.0 + kb2*16), 3
a2_5 oscil 0.1*0.059407, kval2*5*sqrt(1.0 + kb2*25), 3
a2_6 oscil 0.1*0.024753, kval2*6*sqrt(1.0 + kb2*36), 3
a2_7 oscil 0.1*0.042434, kval2*7*sqrt(1.0 + kb2*49), 3
a2_8 oscil 0.1*0.018565, kval2*8*sqrt(1.0 + kb2*64), 3
a2_9 oscil 0.1*0.033004, kval2*9*sqrt(1.0 + kb2*81), 3
a2_10 oscil 0.1*0.014852, kval2*10*sqrt(1.0 + kb2*100), 3
a2_11 oscil 0.1*0.027003, kval2*11*sqrt(1.0 + kb2*121), 3
a2_12 oscil 0.1*0.012376, kval2*12*sqrt(1.0 + kb2*144), 3
a2_13 oscil 0.1*0.022849, kval2*13*sqrt(1.0 + kb2*169), 3
a2_14 oscil 0.1*0.010608, kval2*14*sqrt(1.0 + kb2*196), 3
a2_15 oscil 0.1*0.019802, kval2*15*sqrt(1.0 + kb2*225), 3
a2_16 oscil 0.1*0.009282, kval2*16*sqrt(1.0 + kb2*256), 3
a2_17 oscil 0.1*0.017473, kval2*17*sqrt(1.0 + kb2*289), 3
a2_18 oscil 0.1*0.008251, kval2*18*sqrt(1.0 + kb2*324), 3
a2_19 oscil 0.1*0.015633, kval2*19*sqrt(1.0 + kb2*361), 3
a2_20 oscil 0.1*0.007426, kval2*20*sqrt(1.0 + kb2*400), 3
a2_21 oscil 0.1*0.014145, kval2*21*sqrt(1.0 + kb2*441), 3
a2_22 oscil 0.1*0.006751, kval2*22*sqrt(1.0 + kb2*484), 3
a2_23 oscil 0.1*0.012915, kval2*23*sqrt(1.0 + kb2*529), 3
a2_24 oscil 0.1*0.006188, kval2*24*sqrt(1.0 + kb2*576), 3
a2_25 oscil 0.1*0.011881, kval2*25*sqrt(1.0 + kb2*625), 3
a2_26 oscil 0.1*0.005712, kval2*26*sqrt(1.0 + kb2*676), 3
a2_27 oscil 0.1*0.011001, kval2*27*sqrt(1.0 + kb2*729), 3
a2_28 oscil 0.1*0.005304, kval2*28*sqrt(1.0 + kb2*784), 3
a2_29 oscil 0.1*0.010243, kval2*29*sqrt(1.0 + kb2*841), 3
a2_30 oscil 0.1*0.004951, kval2*30*sqrt(1.0 + kb2*900), 3
a2_31 oscil 0.1*0.009582, kval2*31*sqrt(1.0 + kb2*961), 3
a2_32 oscil 0.1*0.004641, kval2*32*sqrt(1.0 + kb2*1024), 3
a2_33 oscil 0.1*0.009001, kval2*33*sqrt(1.0 + kb2*1089), 3
a2_34 oscil 0.1*0.004368, kval2*34*sqrt(1.0 + kb2*1156), 3
a2_35 oscil 0.1*0.008487, kval2*35*sqrt(1.0 + kb2*1225), 3
a2_36 oscil 0.1*0.004125, kval2*36*sqrt(1.0 + kb2*1296), 3
a2_37 oscil 0.1*0.008028, kval2*37*sqrt(1.0 + kb2*1369), 3
a2_38 oscil 0.1*0.003908, kval2*38*sqrt(1.0 + kb2*1444), 3
a2_39 oscil 0.1*0.007616, kval2*39*sqrt(1.0 + kb2*1521), 3

a2 sum a2_1 , a2_2 , a2_3 , a2_4 , a2_5 , a2_6 , a2_7 , a2_8 , a2_9 , a2_10 , a2_11 , a2_12 , a2_13 , a2_14 , a2_15 , a2_16 , a2_17 , a2_18 , a2_19 , a2_20 , a2_21 , a2_22 , a2_23 , a2_24 , a2_25 , a2_26 , a2_27 , a2_28 , a2_29 , a2_30 , a2_31 , a2_32 , a2_33 , a2_34 , a2_35 , a2_36 , a2_37 , a2_38 , a2_39

kb3 = .00000010008 * kval3^1.5688
a3_1 oscil 0.1*0.297035, kval3*1*sqrt(1.0 + kb3), 3
a3_2 oscil 0.1*0.074259, kval3*2*sqrt(1.0 + kb3*4), 3
a3_3 oscil 0.1*0.099012, kval3*3*sqrt(1.0 + kb3*9), 3
a3_4 oscil 0.1*0.037129, kval3*4*sqrt(1.0 + kb3*16), 3
a3_5 oscil 0.1*0.059407, kval3*5*sqrt(1.0 + kb3*25), 3
a3_6 oscil 0.1*0.024753, kval3*6*sqrt(1.0 + kb3*36), 3
a3_7 oscil 0.1*0.042434, kval3*7*sqrt(1.0 + kb3*49), 3
a3_8 oscil 0.1*0.018565, kval3*8*sqrt(1.0 + kb3*64), 3
a3_9 oscil 0.1*0.033004, kval3*9*sqrt(1.0 + kb3*81), 3
a3_10 oscil 0.1*0.014852, kval3*10*sqrt(1.0 + kb3*100), 3
a3_11 oscil 0.1*0.027003, kval3*11*sqrt(1.0 + kb3*121), 3
a3_12 oscil 0.1*0.012376, kval3*12*sqrt(1.0 + kb3*144), 3
a3_13 oscil 0.1*0.022849, kval3*13*sqrt(1.0 + kb3*169), 3
a3_14 oscil 0.1*0.010608, kval3*14*sqrt(1.0 + kb3*196), 3
a3_15 oscil 0.1*0.019802, kval3*15*sqrt(1.0 + kb3*225), 3
a3_16 oscil 0.1*0.009282, kval3*16*sqrt(1.0 + kb3*256), 3
a3_17 oscil 0.1*0.017473, kval3*17*sqrt(1.0 + kb3*289), 3
a3_18 oscil 0.1*0.008251, kval3*18*sqrt(1.0 + kb3*324), 3
a3_19 oscil 0.1*0.015633, kval3*19*sqrt(1.0 + kb3*361), 3
a3_20 oscil 0.1*0.007426, kval3*20*sqrt(1.0 + kb3*400), 3
a3_21 oscil 0.1*0.014145, kval3*21*sqrt(1.0 + kb3*441), 3
a3_22 oscil 0.1*0.006751, kval3*22*sqrt(1.0 + kb3*484), 3
a3_23 oscil 0.1*0.012915, kval3*23*sqrt(1.0 + kb3*529), 3
a3_24 oscil 0.1*0.006188, kval3*24*sqrt(1.0 + kb3*576), 3
a3_25 oscil 0.1*0.011881, kval3*25*sqrt(1.0 + kb3*625), 3
a3_26 oscil 0.1*0.005712, kval3*26*sqrt(1.0 + kb3*676), 3
a3_27 oscil 0.1*0.011001, kval3*27*sqrt(1.0 + kb3*729), 3
a3_28 oscil 0.1*0.005304, kval3*28*sqrt(1.0 + kb3*784), 3
a3_29 oscil 0.1*0.010243, kval3*29*sqrt(1.0 + kb3*841), 3
a3_30 oscil 0.1*0.004951, kval3*30*sqrt(1.0 + kb3*900), 3
a3_31 oscil 0.1*0.009582, kval3*31*sqrt(1.0 + kb3*961), 3
a3_32 oscil 0.1*0.004641, kval3*32*sqrt(1.0 + kb3*1024), 3
a3_33 oscil 0.1*0.009001, kval3*33*sqrt(1.0 + kb3*1089), 3
a3_34 oscil 0.1*0.004368, kval3*34*sqrt(1.0 + kb3*1156), 3
a3_35 oscil 0.1*0.008487, kval3*35*sqrt(1.0 + kb3*1225), 3
a3_36 oscil 0.1*0.004125, kval3*36*sqrt(1.0 + kb3*1296), 3
a3_37 oscil 0.1*0.008028, kval3*37*sqrt(1.0 + kb3*1369), 3
a3_38 oscil 0.1*0.003908, kval3*38*sqrt(1.0 + kb3*1444), 3
a3_39 oscil 0.1*0.007616, kval3*39*sqrt(1.0 + kb3*1521), 3

a3 sum a3_1 , a3_2 , a3_3 , a3_4 , a3_5 , a3_6 , a3_7 , a3_8 , a3_9 , a3_10 , a3_11 , a3_12 , a3_13 , a3_14 , a3_15 , a3_16 , a3_17 , a3_18 , a3_19 , a3_20 , a3_21 , a3_22 , a3_23 , a3_24 , a3_25 , a3_26 , a3_27 , a3_28 , a3_29 , a3_30 , a3_31 , a3_32 , a3_33 , a3_34 , a3_35 , a3_36 , a3_37 , a3_38 , a3_39

kb4 = .00000010008 * kval4^1.5688
a4_1 oscil 0.1*0.297035, kval4*1*sqrt(1.0 + kb4), 3
a4_2 oscil 0.1*0.074259, kval4*2*sqrt(1.0 + kb4*4), 3
a4_3 oscil 0.1*0.099012, kval4*3*sqrt(1.0 + kb4*9), 3
a4_4 oscil 0.1*0.037129, kval4*4*sqrt(1.0 + kb4*16), 3
a4_5 oscil 0.1*0.059407, kval4*5*sqrt(1.0 + kb4*25), 3
a4_6 oscil 0.1*0.024753, kval4*6*sqrt(1.0 + kb4*36), 3
a4_7 oscil 0.1*0.042434, kval4*7*sqrt(1.0 + kb4*49), 3
a4_8 oscil 0.1*0.018565, kval4*8*sqrt(1.0 + kb4*64), 3
a4_9 oscil 0.1*0.033004, kval4*9*sqrt(1.0 + kb4*81), 3
a4_10 oscil 0.1*0.014852, kval4*10*sqrt(1.0 + kb4*100), 3
a4_11 oscil 0.1*0.027003, kval4*11*sqrt(1.0 + kb4*121), 3
a4_12 oscil 0.1*0.012376, kval4*12*sqrt(1.0 + kb4*144), 3
a4_13 oscil 0.1*0.022849, kval4*13*sqrt(1.0 + kb4*169), 3
a4_14 oscil 0.1*0.010608, kval4*14*sqrt(1.0 + kb4*196), 3
a4_15 oscil 0.1*0.019802, kval4*15*sqrt(1.0 + kb4*225), 3
a4_16 oscil 0.1*0.009282, kval4*16*sqrt(1.0 + kb4*256), 3
a4_17 oscil 0.1*0.017473, kval4*17*sqrt(1.0 + kb4*289), 3
a4_18 oscil 0.1*0.008251, kval4*18*sqrt(1.0 + kb4*324), 3
a4_19 oscil 0.1*0.015633, kval4*19*sqrt(1.0 + kb4*361), 3
a4_20 oscil 0.1*0.007426, kval4*20*sqrt(1.0 + kb4*400), 3
a4_21 oscil 0.1*0.014145, kval4*21*sqrt(1.0 + kb4*441), 3
a4_22 oscil 0.1*0.006751, kval4*22*sqrt(1.0 + kb4*484), 3
a4_23 oscil 0.1*0.012915, kval4*23*sqrt(1.0 + kb4*529), 3
a4_24 oscil 0.1*0.006188, kval4*24*sqrt(1.0 + kb4*576), 3
a4_25 oscil 0.1*0.011881, kval4*25*sqrt(1.0 + kb4*625), 3
a4_26 oscil 0.1*0.005712, kval4*26*sqrt(1.0 + kb4*676), 3
a4_27 oscil 0.1*0.011001, kval4*27*sqrt(1.0 + kb4*729), 3
a4_28 oscil 0.1*0.005304, kval4*28*sqrt(1.0 + kb4*784), 3
a4_29 oscil 0.1*0.010243, kval4*29*sqrt(1.0 + kb4*841), 3
a4_30 oscil 0.1*0.004951, kval4*30*sqrt(1.0 + kb4*900), 3
a4_31 oscil 0.1*0.009582, kval4*31*sqrt(1.0 + kb4*961), 3
a4_32 oscil 0.1*0.004641, kval4*32*sqrt(1.0 + kb4*1024), 3
a4_33 oscil 0.1*0.009001, kval4*33*sqrt(1.0 + kb4*1089), 3
a4_34 oscil 0.1*0.004368, kval4*34*sqrt(1.0 + kb4*1156), 3
a4_35 oscil 0.1*0.008487, kval4*35*sqrt(1.0 + kb4*1225), 3
a4_36 oscil 0.1*0.004125, kval4*36*sqrt(1.0 + kb4*1296), 3
a4_37 oscil 0.1*0.008028, kval4*37*sqrt(1.0 + kb4*1369), 3
a4_38 oscil 0.1*0.003908, kval4*38*sqrt(1.0 + kb4*1444), 3
a4_39 oscil 0.1*0.007616, kval4*39*sqrt(1.0 + kb4*1521), 3

a4 sum a4_1 , a4_2 , a4_3 , a4_4 , a4_5 , a4_6 , a4_7 , a4_8 , a4_9 , a4_10 , a4_11 , a4_12 , a4_13 , a4_14 , a4_15 , a4_16 , a4_17 , a4_18 , a4_19 , a4_20 , a4_21 , a4_22 , a4_23 , a4_24 , a4_25 , a4_26 , a4_27 , a4_28 , a4_29 , a4_30 , a4_31 , a4_32 , a4_33 , a4_34 , a4_35 , a4_36 , a4_37 , a4_38 , a4_39

kb5 = .00000010008 * kval5^1.5688
a5_1 oscil 0.1*0.297035, kval5*1*sqrt(1.0 + kb5), 3
a5_2 oscil 0.1*0.074259, kval5*2*sqrt(1.0 + kb5*4), 3
a5_3 oscil 0.1*0.099012, kval5*3*sqrt(1.0 + kb5*9), 3
a5_4 oscil 0.1*0.037129, kval5*4*sqrt(1.0 + kb5*16), 3
a5_5 oscil 0.1*0.059407, kval5*5*sqrt(1.0 + kb5*25), 3
a5_6 oscil 0.1*0.024753, kval5*6*sqrt(1.0 + kb5*36), 3
a5_7 oscil 0.1*0.042434, kval5*7*sqrt(1.0 + kb5*49), 3
a5_8 oscil 0.1*0.018565, kval5*8*sqrt(1.0 + kb5*64), 3
a5_9 oscil 0.1*0.033004, kval5*9*sqrt(1.0 + kb5*81), 3
a5_10 oscil 0.1*0.014852, kval5*10*sqrt(1.0 + kb5*100), 3
a5_11 oscil 0.1*0.027003, kval5*11*sqrt(1.0 + kb5*121), 3
a5_12 oscil 0.1*0.012376, kval5*12*sqrt(1.0 + kb5*144), 3
a5_13 oscil 0.1*0.022849, kval5*13*sqrt(1.0 + kb5*169), 3
a5_14 oscil 0.1*0.010608, kval5*14*sqrt(1.0 + kb5*196), 3
a5_15 oscil 0.1*0.019802, kval5*15*sqrt(1.0 + kb5*225), 3
a5_16 oscil 0.1*0.009282, kval5*16*sqrt(1.0 + kb5*256), 3
a5_17 oscil 0.1*0.017473, kval5*17*sqrt(1.0 + kb5*289), 3
a5_18 oscil 0.1*0.008251, kval5*18*sqrt(1.0 + kb5*324), 3
a5_19 oscil 0.1*0.015633, kval5*19*sqrt(1.0 + kb5*361), 3
a5_20 oscil 0.1*0.007426, kval5*20*sqrt(1.0 + kb5*400), 3
a5_21 oscil 0.1*0.014145, kval5*21*sqrt(1.0 + kb5*441), 3
a5_22 oscil 0.1*0.006751, kval5*22*sqrt(1.0 + kb5*484), 3
a5_23 oscil 0.1*0.012915, kval5*23*sqrt(1.0 + kb5*529), 3
a5_24 oscil 0.1*0.006188, kval5*24*sqrt(1.0 + kb5*576), 3
a5_25 oscil 0.1*0.011881, kval5*25*sqrt(1.0 + kb5*625), 3
a5_26 oscil 0.1*0.005712, kval5*26*sqrt(1.0 + kb5*676), 3
a5_27 oscil 0.1*0.011001, kval5*27*sqrt(1.0 + kb5*729), 3
a5_28 oscil 0.1*0.005304, kval5*28*sqrt(1.0 + kb5*784), 3
a5_29 oscil 0.1*0.010243, kval5*29*sqrt(1.0 + kb5*841), 3
a5_30 oscil 0.1*0.004951, kval5*30*sqrt(1.0 + kb5*900), 3
a5_31 oscil 0.1*0.009582, kval5*31*sqrt(1.0 + kb5*961), 3
a5_32 oscil 0.1*0.004641, kval5*32*sqrt(1.0 + kb5*1024), 3
a5_33 oscil 0.1*0.009001, kval5*33*sqrt(1.0 + kb5*1089), 3
a5_34 oscil 0.1*0.004368, kval5*34*sqrt(1.0 + kb5*1156), 3
a5_35 oscil 0.1*0.008487, kval5*35*sqrt(1.0 + kb5*1225), 3
a5_36 oscil 0.1*0.004125, kval5*36*sqrt(1.0 + kb5*1296), 3
a5_37 oscil 0.1*0.008028, kval5*37*sqrt(1.0 + kb5*1369), 3
a5_38 oscil 0.1*0.003908, kval5*38*sqrt(1.0 + kb5*1444), 3
a5_39 oscil 0.1*0.007616, kval5*39*sqrt(1.0 + kb5*1521), 3

a5 sum a5_1 , a5_2 , a5_3 , a5_4 , a5_5 , a5_6 , a5_7 , a5_8 , a5_9 , a5_10 , a5_11 , a5_12 , a5_13 , a5_14 , a5_15 , a5_16 , a5_17 , a5_18 , a5_19 , a5_20 , a5_21 , a5_22 , a5_23 , a5_24 , a5_25 , a5_26 , a5_27 , a5_28 , a5_29 , a5_30 , a5_31 , a5_32 , a5_33 , a5_34 , a5_35 , a5_36 , a5_37 , a5_38 , a5_39

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
