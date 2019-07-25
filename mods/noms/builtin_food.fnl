#|
   builtin_food.fnl: Adds, uhh... food
   Copyright (C) 2019  TheBluePineapple
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
   
|#

(var f noms.register_food)

(f "noms:orange" {
	:description "Orange"
	:inventory_image "noms_orange.png"
	:_gain 1
})

(f "noms:honeycrisp_apple" {
	:description "Honeycrisp Apple"
	:inventory_image "noms_apple-honeycrisp.png"
	:gain 2
})

(f "noms:green_apple" {
	:description "Green Apple"
	:inventory_image "noms_apple-green.png"
	:gain 1
})

(f "noms:yellow_apple" {
	:description "Yellow Apple"
	:inventory_image "noms_apple-yellow.png"
	:gain 1
})

(f "noms:red_apple" {
	:description "Red Apple"
	:inventory_image "noms_apple-red.png"
	:gain 1
})

(f "noms:banana" {
	:description "Banana"
	:inventory_image "noms_banana.png"
	:gain 1
})

#|
(f "noms:" {
	:description ""
	:inventory_image "noms_.png"
	:gain 1
})
|#