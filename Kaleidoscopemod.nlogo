globals [
  curr-color-sep
  num
]


to setup
  clear-all
  set-default-shape turtles "circle"
  create-ordered-turtles num-turtles [ pen-down ]
  set curr-color-sep color-sep
  reset-ticks
end


; Criterio de parada: si se supera un número aleatorio de
; ticks, la figura se detiene.
; Dependiendo de la opción elegida por el usuario, se ejecutará
; una función u otra.
to go
  set num random 1000
  if ticks >= num [ stop ]
    ifelse movement = "right" [
    if pattern = "circle" [circle-right]
    if pattern = "random" [random-right]
    if pattern = "square" [square-right]
    if pattern = "square random" [square-right-random]
    if pattern = "triangle" [triangle-right]
    if pattern = "octagon" [octagon-right]
    if pattern = "pentagon" [pentagon-right]
    if pattern = "hexagon" [hexagon-right]
    if pattern = "ninegon" [ninegon-right]
  ]

  [if pattern = "circle" [circle-left]
      if pattern = "random" [random-left]
      if pattern = "square" [square-right]
      if pattern = "square random" [square-left-random]
      if pattern = "triangle" [triangle-left]
      if pattern = "octagon" [octagon-left]
      if pattern = "pentagon" [pentagon-left]
      if pattern = "hexagon" [hexagon-left]
      if pattern = "ninegon" [ninegon-left]
  ]
  tick
end


; Círculos hacia la derecha. Las tortugas madre giran 1 hacia la derecha
; y generan una tortuga hija que dibuja un círculo hacia la derecha, y
; luego muere. Las tortugas madre siguen girando y generando tortugas hijas.
; Cada medio segundo se cambia el color del patrón.
to circle-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 36 [
        fd 4
        rt 10
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

; La mitad de las tortugas giran a la derecha y la otra mitad a la izquierda,
; como si las reflejaran. El proceso es el mismo que en la función anterior.
to circle-left
  ask turtles [
    ifelse (who mod 2) = 0 [
      rt 1
      hatch 1 [
        set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 36 [
          fd 4
          rt 10
        ]
        die
      ]
    ][
      lt 1
      hatch 1 [
        set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 36 [
          fd 4
          lt 10
        ]
        die
      ]
    ]
  ]
  every 1 [ if color-shift? [ color-shift ] ]
  tick
end


; El movimiento de las tortugas hijas se aleatoriza, dando lugar a patrones
; irregulares.
to random-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
      repeat random 40 [
        fd random 8
        rt random 20
        fd random 8]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to random-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat random 40 [
        fd random 8
        lt random 20
        fd random 8
  ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja cuadrados
to square-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat 4 [
        fd 20
        rt 90
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to square-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat 4 [
        fd 20
        lt 90
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja cuadrados con medidas aleatorias en cada iteración.
to square-right-random
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat 4 [
        fd random 100
        rt 90
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to square-left-random
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat 4 [
        fd random 100
        lt 90
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja triángulos
to triangle-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat 3 [
        fd 100
        rt 120
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to triangle-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
       repeat 3 [
        fd 100
        lt 120
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja octógonos
to octagon-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 8 [
        fd 30
        rt 45
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to octagon-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 8 [
        fd 30
        lt 45
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja pentágonos
to pentagon-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 5 [
        fd 35
        rt 72
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to pentagon-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 5 [
        fd 35
        lt 72
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja hexágonos
to hexagon-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 6 [
        fd 30
        rt 60
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to hexagon-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 6 [
        fd 30
        lt 60
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Dibuja eneágonos
to ninegon-right
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
         repeat 9 [
        fd 35
        rt 40
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end

to ninegon-left
  ask turtles [
    rt 1
    hatch 1 [
      set color 10000 * ((count turtles - 1) / curr-color-sep) + 10
        repeat 9 [
        fd 35
        lt 40
      ]
      die
    ]
  ]
  every 0.5 [ if color-shift? [ color-shift ] ]
  tick
end


; Para cambiar el color, si la opción increase ha sido activada por el usuario, se
; suma al identificador del color actual un número aleatorio hasta 200. Se ha colocado
; un caso especial ya que curr-col-sep aparece dividiendo en las funciones y no puede ser
; 0, en ese caso la variable debe valer 10. Si increase no está activado, se resta el
; número aleatorio.
to color-shift
  ifelse increase-color? [
    set curr-color-sep curr-color-sep + random 200
    if curr-color-sep = 0 [ set curr-color-sep 10 ]
    if curr-color-sep > 1 [ set curr-color-sep random 200 ]
  ][
    set curr-color-sep curr-color-sep - random 200
    if curr-color-sep = 0 [ set curr-color-sep 10 ]
    if curr-color-sep < 1 [ set curr-color-sep random 200 ]
  ]
end


; Copyright 1998 Uri Wilensky.
; Modificado por Laura Díaz y Gema Chamizo para el trabajo de MCVA.
; See Info tab for full copyright and license.
@#$#@#$#@
GRAPHICS-WINDOW
295
10
707
423
-1
-1
4.0
1
10
1
1
1
0
0
0
1
-50
50
-50
50
1
1
1
ticks
30.0

MONITOR
70
135
210
180
current-color-sep
curr-color-sep
3
1
11

SLIDER
145
10
285
43
color-sep
color-sep
1.0
60.0
25.0
1.0
1
NIL
HORIZONTAL

BUTTON
60
50
140
83
setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
145
90
285
123
increase-color?
increase-color?
0
1
-1000

SLIDER
5
10
140
43
num-turtles
num-turtles
1
24
17.0
1
1
NIL
HORIZONTAL

SWITCH
5
90
141
123
color-shift?
color-shift?
0
1
-1000

CHOOSER
25
255
163
300
movement
movement
"right" "left"
0

CHOOSER
25
315
163
360
pattern
pattern
"circle" "random" "square" "square random" "triangle" "octagon" "pentagon" "hexagon" "ninegon"
2

TEXTBOX
20
205
225
245
Selecciona la forma y la orientación de la obra
15
0.0
1

BUTTON
150
50
213
83
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

This model uses NetLogo turtles to repeatedly draw circles, turning periodically so that the display gives the impression of a kaleidoscope or pinwheel. It is a demonstration of how a set of simple agent rules can give rise to complex and beautiful patterns.

## HOW IT WORKS

The inner workings of the model are quite simple. A number of turtles are created with their pen's down (wherever they move, they will draw a trail). At each tick, every original turtle hatches a new "drawing turtle" whose only job is to draw a circle and then immediately die. In between hatchings, the only thing the original turtles are doing is slowly rotating. While there are two built-in patterns for the model, both follow the same set of rules, with the only difference being that half of the drawing turtles in PATTERN-2 draw circles counterclockwise while all of the turtles in PATTERN-1 draw circles clockwise.

## HOW TO USE IT

The NUM-TURTLES slider really determines the number of "arms" or "petals" that the kaleidoscope will have. Begin by setting this slider to the desired value (10 is fine).

Next, set COLOR-SEP to some value. COLOR-SEP determines the range of colors that the turtles (and hence the kaleidoscope) will take on. The higher the value, the smaller the range. For a nice, three-colored kaleidoscope, set COLOR-SEP to 25. This inverse relation between COLOR-SEP and the color range is due to the fact that COLOR-SEP acts as a constant to divide a turtle's color by.

When you have set both NUM-TURTLES and COLOR-SEP, press the SETUP button to get your model ready for drawing.

Next, choose which pattern you want. Each pattern has its own forever-button that controls it. PATTERN-1 has the arms of the kaleidoscope all spiraling clockwise, while PATTERN-2 has the arms of the kaleidoscope spiral in both clockwise and counterclockwise directions, giving a slightly more complicated design.

Finally, you have the power to change the color distribution exhibited by this model. The COLOR-SHIFT button will either increment or decrement the value of COLOR-SEP used by the turtles -- saved internally as CURR-COLOR-SEP. Thus the slider value itself isn't changed, but the number the turtles look at is constantly changing. This number is changed by a small random amount. The INCREASE-COLOR? switch determines if CURR-COLOR-SEP is increased (true) or decreased (false).

You also have a monitor, CURR-COLOR-SEP, which will display that variable's value, so that you know when it has been altered, and by how much.

## THINGS TO NOTICE

First, just try playing around and observe what happens. This is meant to be a visually pleasing model just to watch. See what different values of NUM-TURTLES and COLOR-SEP produce, and explore how COLOR-SHIFT changes the appearance of the kaleidoscope. What seems the best to you?

An important thing to notice here is the number given in COUNT-TURTLES. Right away, it becomes much larger than NUM-TURTLES, but quickly settles on some nice big number. Take a look at the Procedures Window. There are really two levels of turtle commands going on here. Initially, upon setup, there are NTURTLES number of turtles. Once one of the pattern buttons is pressed, each of these turtles (who compose the "arms" of the kaleidoscope) repeatedly hatches a new turtle and turns by a single degree. The newly-hatched turtles begin to draw circles, self-destructing upon completion. As the "arm" turtles execute their commands much quicker than the hatched turtles, they produce many turtles during one loop of a circle; eventually, though, turtles start to die off. At this point, the number of turtles who are born is roughly equal to the number who die at any given step.

You also should notice how COLOR-SEP (or really CURR-COLOR-SEP) alters the appearance of the kaleidoscope. Turn COLOR-SHIFT? on, and let CURR-COLOR-SEP become very large. Then watch what happens when it is small, maybe zero or some negative number.

## THINGS TO TRY

Try changing the code in the Code tab. Increase the size of the circles drawn by each of the turtles, or try changing the size of the angle each of the turtles turns through.

Instead of each turtle moving or turning a given amount, what about having it move a small random amount (as in the changes to curr-color-sep from COLOR-SHIFT). How much randomness can you add and still maintain some kind of overall structure?

## EXTENDING THE MODEL

Whenever a turtle is hatched by one of the "arm" turtles, it proceeds to draw a circle. Change the `hatch` command list so that it draws some other shape or pattern. Try to predict what overall shape will emerge.

Currently, the only difference between the two patterns is that PATTERN-2 has half of the "arm" turtles circle to the left, the other half to the right. Write your own pattern -- i.e., come up with a new command or set of commands for these turtles to execute.

Try to write an entirely new kind of model along similar lines.  In the current model, turtles spin off from a center core of NTURTLES turtles. In your new model, maybe the drawing turtles could orbit around some fixed (or moving) point, like in the StarLogoT models N Bodies and Gravitation.

## NETLOGO FEATURES

This makes nice use of the turtle primitive `hatch`. Whenever a turtle is hatched, it executes the command list that follows the `hatch` command. In most context this is used just to change the new turtle's color or alter some variable.  But there's no reason it can't run some other, possibly lengthy, procedure, and that's exactly what happens here.

## ACKNOWLEDGEMENTS

Thanks to Connor Bain for updating this model in 2021.

## HOW TO CITE

If you mention this model or the NetLogo software in a publication, we ask that you include the citations below.

For the model itself:

* Wilensky, U. (1998).  NetLogo Kaleidoscope model.  http://ccl.northwestern.edu/netlogo/models/Kaleidoscope.  Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

Please cite the NetLogo software as:

* Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

## COPYRIGHT AND LICENSE

Copyright 1998 Uri Wilensky.

![CC BY-NC-SA 3.0](http://ccl.northwestern.edu/images/creativecommons/byncsa.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

Commercial licenses are also available. To inquire about commercial licenses, please contact Uri Wilensky at uri@northwestern.edu.

This model was created as part of the project: CONNECTED MATHEMATICS: MAKING SENSE OF COMPLEX PHENOMENA THROUGH BUILDING OBJECT-BASED PARALLEL MODELS (OBPML).  The project gratefully acknowledges the support of the National Science Foundation (Applications of Advanced Technologies Program) -- grant numbers RED #9552950 and REC #9632612.

This model was converted to NetLogo as part of the projects: PARTICIPATORY SIMULATIONS: NETWORK-BASED DESIGN FOR SYSTEMS LEARNING IN CLASSROOMS and/or INTEGRATED SIMULATION AND MODELING ENVIRONMENT. The project gratefully acknowledges the support of the National Science Foundation (REPP & ROLE programs) -- grant numbers REC #9814682 and REC-0126227. Converted from StarLogoT to NetLogo, 2001.

<!-- 1998 2001 -->
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
setup
repeat 20 [ pattern-1 ]
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
1
@#$#@#$#@
