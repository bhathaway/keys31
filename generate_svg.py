import math

f = open('interface.svg', 'w')
scale_correction = 142.0
key_width = (6.5/15.5)*scale_correction
octave_length=6.5 * scale_correction
total_height =6.0 * scale_correction

f.write('<?xml version="1.0"?>\n')
f.write('<svg width="%f" height="%f" xmlns="http://www.w3.org/2000/svg">\n' % (2*octave_length, total_height))

f.write('''<style type="text/css">
  <![CDATA[
        polygon.Natural {
            stroke: #080808;
            stroke-width: 2;
            fill: #F7F5F0;
        }

        polygon.DoubleFlat {
            stroke: #080808;
            stroke-width: 2;
            fill: #848591;
        }

        polygon.Sharp {
            stroke: #080808;
            stroke-width: 2;
            fill: #43454D;
        }

        polygon.Flat {
            stroke: #080808;
            stroke-width: 2;
            fill: #43454D;
        }

        polygon.DoubleSharp {
            stroke: #080808;
            stroke-width: 2;
            fill: #848591;
        }

        line.Border {
            stroke: #383838;
            stroke-width: 4;
            stroke-linecap: round;
        }

      ]]>
 </style>
 ''')


f.write('<g>\n')
f.write('   <title>31 Equal Temperament Interface</title>\n')


class Key:
    # Key gap
    g = scale_correction * (1.0/32)

    #lower_key_count = 16

    # Horizontal key spacing
    #w = octave_length / lower_key_count
    w = key_width

    # Length of hex key side
    r3 = math.sqrt(3.0)
    s = w / r3

    #n = int(math.floor((total_height - s/2)/(7*s)))
    n = 3

    #key_height = (total_height - key_gap*2)/2
    # Now total key height is the entire available range, but broken into hexagon segments.
    # Upper and lower will now designate whether a hex is on a line or space.

    def __init__(self, name, number):
        self.svg_id = name
        if name.endswith('isis'):
            self.svg_class = 'DoubleSharp'
        elif name.endswith('is'):
            self.svg_class = 'Sharp'
        elif name.endswith('eses'):
            self.svg_class = 'DoubleFlat'
        elif name.endswith('es'):
            self.svg_class = 'Flat'
        else:
            self.svg_class = 'Natural'

        # Calculate the coordinates based on number.
        #lower = (number % 31) % 2 == 0
        lower = number % 2 == 0
        #octave = number / 31
        #index = (number % 31) / 2
        index = number / 2
        if lower:
            #self.x_offset = octave*octave_length + index * Key.w
            self.x_offset = index * Key.w
            self.y_offset = 5.5 * Key.s
        else:
            #self.x_offset = octave*octave_length + Key.w / 2 + index*(Key.w)
            self.x_offset = Key.w / 2 + index*(Key.w)
            self.y_offset = Key.s/2

    def getSvg(self):
        return_string = ''
        for i in range(Key.n):
            x = self.x_offset
            y = self.y_offset + i*10*Key.s
            ax = x + Key.w/2            ; ay = y + Key.g/Key.r3
            bx = x + Key.w - Key.g/2    ; by = y + Key.s/2 + Key.g/Key.r3/2
            cx = x + Key.w - Key.g/2    ; cy = y + 10*Key.s/2 - Key.g/Key.r3/2
            dx = x + Key.w/2            ; dy = y + 5.5*Key.s - Key.g/Key.r3
            ex = x + Key.g/2            ; ey = y + 10*Key.s/2 - Key.g/Key.r3/2
            fx = x + Key.g/2            ; fy = y + Key.s/2 + Key.g/Key.r3/2
            return_string += '<polygon id="%s_%i" class="%s" points="%f,%f %f,%f %f,%f %f,%f %f,%f %f,%f" />\n' %\
              (self.svg_id, i, self.svg_class, ax, ay, bx, by, cx, cy, dx, dy, ex, ey, fx, fy)

        return return_string

keys = [Key('c0', 0), Key('d0eses', 1), Key('c0is', 2), Key('d0es', 3), Key('c0isis', 4),
        Key('d0', 5), Key('e0eses', 6), Key('d0is', 7), Key('e0es', 8), Key('d0isis', 9),
        Key('e0', 10), Key('f0es', 11), Key('e0is', 12),
        Key('f0', 13), Key('g0eses', 14), Key('f0is', 15), Key('g0es', 16), Key('f0isis', 17),
        Key('g0', 18), Key('a0eses', 19), Key('g0is', 20), Key('a0es', 21), Key('g0isis', 22),
        Key('a0', 23), Key('b0eses', 24), Key('a0is', 25), Key('b0es', 26), Key('a0isis', 27),
        Key('b0', 28), Key('c1es', 29), Key('b0is', 30),
        Key('c1', 31), Key('d1eses', 32), Key('c1is', 33), Key('d1es', 34), Key('c1isis', 35),
        Key('d1', 36), Key('e1eses', 37), Key('d1is', 38), Key('e1es', 39), Key('d1isis', 40),
        Key('e1', 41), Key('f1es', 42), Key('e1is', 43),
        Key('f1', 44), Key('g1eses', 45), Key('f1is', 46), Key('g1es', 47), Key('f1isis', 48),
        Key('g1', 49), Key('a1eses', 50), Key('g1is', 51), Key('a1es', 52), Key('g1isis', 53),
        Key('a1', 54), Key('b1eses', 55), Key('a1is', 56), Key('b1es', 57), Key('a1isis', 58),
        Key('b1', 59), Key('c2es', 60), Key('b1is', 61), Key('c2', 62)]

for key in keys:
    f.write(key.getSvg())

f.write('</g>\n')
f.write('</svg>\n')

f.close()
