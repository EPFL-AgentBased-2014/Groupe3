globals [
  percent-similar  ;; on the average, what percent of a turtle's neighbors
                   ;; are the same color as that turtle?
<<<<<<< HEAD
  percent-unhappy  ;; what percent of the turtles are unhappy?
=======
  percent-happy  ;; what percent of the turtles are unhappy?
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
]

turtles-own [
  happy?       ;; for each turtle, indicates whether at least %-similar-wanted percent of
               ;; that turtles' neighbors are the same color as the turtle
  similar-nearby   ;; how many neighboring patches have a turtle with my color?
  green-nearby ;; how many have a turtle of another color?
  yellow-nearby
  white-nearby
<<<<<<< HEAD
  total-nearby  ;; sum of previous two variables
  money
=======
  red-nearby
  total-nearby  ;; sum of previous two variables
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
]

to setup
  clear-all
  if number-resident > count patches
    [ user-message (word "This pond only has room for " count patches " turtles.")
      stop ]
   
  ;; create turtles on random patches.
  ask n-of number-resident patches
    [ sprout 1
<<<<<<< HEAD
      [ set color red 
        set money random 0 100] ]
=======
      [ set color red ] ]
    
    ask n-of number-villa patches
  [sprout 1
  [set color orange] ]
  
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
  ask n-of number-bureau patches
  [sprout 1
  [set color green] ]
  
   ask n-of number-commerce patches
  [sprout 1
  [set color yellow] ]
<<<<<<< HEAD
  
   ask n-of number-industry patches
=======

  ask n-of number-industrie patches
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
  [sprout 1
  [set color white] ]
  
  ask turtles [ set shape "square"]
  update-variables
  reset-ticks
end

to go
<<<<<<< HEAD
  if percent-unhappy = 0  [ stop ]
=======
  if percent-happy = 100  [ stop ]
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
  move-unhappy-turtles
  update-variables
  tick
end

to move-unhappy-turtles
  ask turtles with [happy? = FALSE]
    [ find-new-spot ]
end

to find-new-spot
  rt random-float 360
  fd random-float 10
  if any? other turtles-here
<<<<<<< HEAD
    [ ifelse any? turtles-here with [money > [money] of myself] [
        kick-out
       ]
      [find-new-spot]
       ]          ;; keep going until we find an unoccupied patch
  move-to patch-here  ;; move to center of patch
end

to kick-out
  ask turtles-here [
    find-new-spot
    ]
  move-to patch-here
end

=======
    [ find-new-spot ]          ;; keep going until we find an unoccupied patch
  move-to patch-here  ;; move to center of patch
end

>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
to update-variables
  update-turtles
  update-globals
end

to update-turtles
  ask turtles with [color = red] [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch
    set similar-nearby count (turtles in-radius radius)
      with [color = [color] of myself]
    set green-nearby count (turtles in-radius radius)
      with [color = green]
      set yellow-nearby count (turtles in-radius radius)
      with [color = yellow]
      set white-nearby count (turtles in-radius radius)
      with [color = white]
<<<<<<< HEAD
    set total-nearby green-nearby + yellow-nearby + white-nearby + similar-nearby
    set happy? yellow-nearby >= (yellow-commerce-wanted) and green-nearby >= (green-bureau-wanted) and white-nearby <= white-industry-wanted
  ]
  
   ask turtles with [color = yellow] [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch
    set white-nearby count (turtles in-radius 5)
      with [color = white]
      set happy? white-nearby >= 1
   ]
   
    ask turtles with [color = green] [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch
    set white-nearby count (turtles in-radius 3)
      with [color = white]
      set happy? white-nearby <= 0
   ]
     ask turtles with [color = white] [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch
    set similar-nearby count (turtles in-radius 3)
      with [color = [color] of myself]
      set happy? similar-nearby >= 3
   ]
=======
    set total-nearby green-nearby + yellow-nearby + similar-nearby
    set happy? yellow-nearby >= (yellow-commerce-wanted ) and green-nearby >= (green-bureau-wanted ) ;;and white-nearby <= (white-industrie-wanted)
  ]
    
     ask turtles with [color = orange] [
    ;; in next two lines, we use "neighbors" to test the eight patches
    ;; surrounding the current patch
    set similar-nearby count (turtles in-radius radius)
      with [color = [color] of myself]
    set green-nearby count (turtles in-radius radius)
      with [color = green]
      set yellow-nearby count (turtles in-radius radius)
      with [color = yellow]
      set white-nearby count (turtles in-radius radius)
      with [color = white]
    set total-nearby green-nearby + yellow-nearby + similar-nearby
    set happy? yellow-nearby >= (yellow-commerce-wanted * 2 ) and green-nearby >= (green-bureau-wanted * 2 ) and white-nearby <= (white-industrie-wanted * 2)
  ]
     
     ask turtles with [color = white] [
       
       set similar-nearby count (turtles in-radius radius-industriel)
      with [color = [color] of myself] 
      
      set red-nearby count (turtles in-radius radius-industriel)
      with [color = red]
      
    set happy? similar-nearby >= (density-zone-industriel) and red-resident-wanted >= ( red-nearby )
  ]
     
     
          ask turtles with [color = green] [
            
            set similar-nearby count (turtles in-radius radius-bureau)
      with [color = [color] of myself]  
    set happy? similar-nearby >= (density-zone-bureau) 
  ]
      
      
       ask turtles with [color = yellow] [
         
         set similar-nearby count (turtles in-radius radius-commerce)
      with [color = [color] of myself]   
      
      set white-nearby count (turtles in-radius radius-commerce)
      with [color = white]
      set red-nearby count (turtles in-radius radius-commerce)
      with [color = red]
      
    set happy? similar-nearby >= (density-zone-commerce) and white-nearby >= ( approvisionnement-commerce ) and red-nearby >= ( red-resident-desired ) 
  ]
               
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
end

to update-globals
  let similar-neighbors sum [similar-nearby] of turtles
  let total-neighbors sum [total-nearby] of turtles
  set percent-similar (similar-neighbors / total-neighbors) * 100
<<<<<<< HEAD
  set percent-unhappy (count turtles with [happy? = FALSE]) / (count turtles) * 100
=======
  set percent-happy (count turtles with [happy? = TRUE]) / (count turtles) * 100
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
end


; Copyright 1997 Uri Wilensky.
; See Info tab for full copyright and license.
@#$#@#$#@
GRAPHICS-WINDOW
354
10
721
398
25
25
7.0
1
10
1
1
1
0
1
1
1
-25
25
-25
25
1
1
1
ticks
30.0

MONITOR
267
491
343
536
<<<<<<< HEAD
% unhappy
percent-unhappy
=======
% happy
percent-happy
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
1
1
11

MONITOR
268
359
343
404
% similar
percent-similar
1
1
11

PLOT
1
299
250
442
Percent Similar
time
%
0.0
5.0
0.0
100.0
true
false
"" ""
PENS
"percent" 1.0 0 -2674135 true "" "plot percent-similar"

PLOT
1
444
250
587
<<<<<<< HEAD
Percent Unhappy
=======
Percent happy
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
time
%
0.0
5.0
0.0
100.0
true
false
"" ""
PENS
<<<<<<< HEAD
"percent" 1.0 0 -10899396 true "" "plot percent-unhappy"

SLIDER
19
22
231
55
=======
"percent" 1.0 0 -10899396 true "" "plot percent-happy"

SLIDER
31
48
243
81
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
number-resident
number-resident
0
1000
<<<<<<< HEAD
1000
=======
250
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
10
1
NIL
HORIZONTAL

SLIDER
<<<<<<< HEAD
19
95
246
128
=======
29
147
241
180
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
yellow-commerce-wanted
yellow-commerce-wanted
0
10
<<<<<<< HEAD
0
=======
3
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
1
1
NIL
HORIZONTAL

BUTTON
<<<<<<< HEAD
48
58
128
91
=======
32
10
112
43
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
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

BUTTON
<<<<<<< HEAD
129
58
209
91
=======
113
10
193
43
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
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

SLIDER
739
44
911
77
number-bureau
number-bureau
0
<<<<<<< HEAD
100
53
1
=======
200
0
10
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
1
NIL
HORIZONTAL

INPUTBOX
<<<<<<< HEAD
742
136
1011
196
radius
6
=======
18
236
287
296
radius
3
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
1
0
Number

BUTTON
<<<<<<< HEAD
210
58
273
91
=======
194
10
257
43
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
NIL
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
910
44
1083
77
number-commerce
number-commerce
0
<<<<<<< HEAD
100
69
1
=======
200
100
10
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
1
NIL
HORIZONTAL

SLIDER
<<<<<<< HEAD
19
133
223
166
=======
30
114
212
147
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
green-bureau-wanted
green-bureau-wanted
0
10
0
1
1
NIL
HORIZONTAL

SLIDER
<<<<<<< HEAD
751
87
925
120
number-industry
number-industry
0
100
5
1
=======
756
251
928
284
number-industrie
number-industrie
0
100
24
1
1
NIL
HORIZONTAL

SLIDER
30
180
220
213
white-industrie-wanted
white-industrie-wanted
0
10
0
1
1
NIL
HORIZONTAL

SLIDER
32
80
204
113
number-villa
number-villa
0
100
0
10
1
NIL
HORIZONTAL

SLIDER
756
284
957
317
density-zone-industriel
density-zone-industriel
0
10
2
1
1
NIL
HORIZONTAL

SLIDER
727
78
913
111
density-zone-bureau
density-zone-bureau
0
10
0
1
1
NIL
HORIZONTAL

SLIDER
914
77
1120
110
density-zone-commerce
density-zone-commerce
0
10
3
1
1
NIL
HORIZONTAL

INPUTBOX
740
111
895
171
radius-bureau
3
1
0
Number

INPUTBOX
935
110
1090
170
radius-commerce
3
1
0
Number

INPUTBOX
757
317
912
377
radius-industriel
5
1
0
Number

SLIDER
908
171
1152
204
approvisionnement-commerce
approvisionnement-commerce
0
10
0
1
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
1
NIL
HORIZONTAL

SLIDER
<<<<<<< HEAD
28
176
233
209
white-industry-wanted
white-industry-wanted
=======
757
378
939
411
red-resident-wanted
red-resident-wanted
>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
0
10
0
1
1
NIL
HORIZONTAL

<<<<<<< HEAD
=======
SLIDER
933
205
1118
238
red-resident-desired
red-resident-desired
0
10
3
1
1
NIL
HORIZONTAL

>>>>>>> fd263c15473f94604e3a5e09c93a1c0cb79d2fa4
@#$#@#$#@
## WHAT IS IT?

This project models the behavior of two types of turtles in a mythical pond. The red turtles and green turtles get along with one another. But each turtle wants to make sure that it lives near some of "its own." That is, each red turtle wants to live near at least some red turtles, and each green turtle wants to live near at least some green turtles. The simulation shows how these individual preferences ripple through the pond, leading to large-scale patterns.

This project was inspired by Thomas Schelling's writings about social systems (such as housing patterns in cities).

## HOW TO USE IT

Click the SETUP button to set up the turtles. There are equal numbers of red and green turtles. The turtles move around until there is at most one turtle on a patch.  Click GO to start the simulation. If turtles don't have enough same-color neighbors, they jump to a nearby patch.

The NUMBER slider controls the total number of turtles. (It takes effect the next time you click SETUP.)  The %-SIMILAR-WANTED slider controls the percentage of same-color turtles that each turtle wants among its neighbors. For example, if the slider is set at 30, each green turtle wants at least 30% of its neighbors to be green turtles.

The % SIMILAR monitor shows the average percentage of same-color neighbors for each turtle. It starts at about 50%, since each turtle starts (on average) with an equal number of red and green turtles as neighbors. The % UNHAPPY monitor shows the percent of turtles that have fewer same-color neighbors than they want (and thus want to move). Both monitors are also plotted.

## THINGS TO NOTICE

When you execute SETUP, the red and green turtles are randomly distributed throughout the pond. But many turtles are "unhappy" since they don't have enough same-color neighbors. The unhappy turtles jump to new locations in the vicinity. But in the new locations, they might tip the balance of the local population, prompting other turtles to leave. If a few red turtles move into an area, the local green turtles might leave. But when the green turtles move to a new area, they might prompt red turtles to leave that area.

Over time, the number of unhappy turtles decreases. But the pond becomes more segregated, with clusters of red turtles and clusters of green turtles.

In the case where each turtle wants at least 30% same-color neighbors, the turtles end up with (on average) 70% same-color neighbors. So relatively small individual preferences can lead to significant overall segregation.

## THINGS TO TRY

Try different values for %-SIMILAR-WANTED. How does the overall degree of segregation change?

If each turtle wants at least 40% same-color neighbors, what percentage (on average) do they end up with?

## EXTENDING THE MODEL

Incorporate social networks into this model.  For instance, have unhappy turtles decide on a new location based on information about what a neighborhood is like from other turtles in their network.

Change the rules for turtle happiness.  One idea: suppose that the turtles need some minimum threshold of "good neighbors" to be happy with their location.  Suppose further that they don't always know if someone makes a good neighbor. When they do, they use that information.  When they don't, they use color as a proxy -- i.e., they assume that turtles of the same color make good neighbors.

## NETLOGO FEATURES

`n-of` and `sprout` are used to create turtles while ensuring no patch has more than one turtle on it.

When a turtle moves, `move-to` is used to move the turtle to the center of the patch it eventually finds.

## CREDITS AND REFERENCES

Schelling, T. (1978). Micromotives and Macrobehavior. New York: Norton.
 
See also a recent Atlantic article:   Rauch, J. (2002). Seeing Around Corners; The Atlantic Monthly; April 2002;Volume 289, No. 4; 35-48. http://www.theatlantic.com/issues/2002/04/rauch.htm


## HOW TO CITE

If you mention this model in a publication, we ask that you include these citations for the model itself and for the NetLogo software:

* Wilensky, U. (1997).  NetLogo Segregation model.  http://ccl.northwestern.edu/netlogo/models/Segregation.  Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.
* Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

## COPYRIGHT AND LICENSE

Copyright 1997 Uri Wilensky.

![CC BY-NC-SA 3.0](http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

Commercial licenses are also available. To inquire about commercial licenses, please contact Uri Wilensky at uri@northwestern.edu.

This model was created as part of the project: CONNECTED MATHEMATICS: MAKING SENSE OF COMPLEX PHENOMENA THROUGH BUILDING OBJECT-BASED PARALLEL MODELS (OBPML).  The project gratefully acknowledges the support of the National Science Foundation (Applications of Advanced Technologies Program) -- grant numbers RED #9552950 and REC #9632612.

This model was converted to NetLogo as part of the projects: PARTICIPATORY SIMULATIONS: NETWORK-BASED DESIGN FOR SYSTEMS LEARNING IN CLASSROOMS and/or INTEGRATED SIMULATION AND MODELING ENVIRONMENT. The project gratefully acknowledges the support of the National Science Foundation (REPP & ROLE programs) -- grant numbers REC #9814682 and REC-0126227. Converted from StarLogoT to NetLogo, 2001.
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
NetLogo 5.0.5
@#$#@#$#@
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
0
@#$#@#$#@
