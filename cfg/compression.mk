##-----------------------------LICENSE NOTICE------------------------------------
##  This file is part of CPCtelera: An Amstrad CPC Game Engine 
##  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU Lesser General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##------------------------------------------------------------------------------
############################################################################
##                        CPCTELERA ENGINE                                ##
##                 Automatic compression utilities                        ##
##------------------------------------------------------------------------##
## This file is intended for users to automate the generation of          ##
## compressed files and their inclusion in users' projects.               ##
############################################################################

## COMPRESSION EXAMPLE (Uncomment lines to use)
##

## First 3 calls to ADD2PACK add enemy, hero and background
## graphics (previously converted to binary data) into the 
## compressed group 'mygraphics'. After that, call to PACKZX7B
## compresses all the data and generates an array with the result
## that is placed in src/mygraphics.c & src/mygraphics.h, ready
## to be included and used by other modules.
##
#$(eval $(call ADD2PACK,mygraphics,gfx/enemy.bin))
#$(eval $(call ADD2PACK,mygraphics,gfx/hero.bin))
#$(eval $(call ADD2PACK,mygraphics,gfx/background.bin))
#$(eval $(call PACKZX7B,mygraphics,src/))




############################################################################
##              DETAILED INSTRUCTIONS AND PARAMETERS                      ##
##------------------------------------------------------------------------##
##                                                                        ##
## Macros used for compression are ADD2PACK and PACKZX7B:                 ##
##                                                                        ##
##	ADD2PACK: Adds files to packed (compressed) groups. Each call to this ##
##  		  macro will add a file to a named compressed group.          ##
##  PACKZX7B: Compresses all files in a group into a single binary and    ##
##            generates a C-array and a header to comfortably use it from ##
##            inside your code.                                           ##
##                                                                        ##
##------------------------------------------------------------------------##
##                                                                        ##
##  $(eval $(call ADD2PACK,<packname>,<file>))                            ##
##                                                                        ##
##		Sequentially adds <file> to compressed group <packname>. Each     ##
## call to this macro adds a new <file> after the latest one added.       ##
## packname could be any valid C identifier.                              ##
##                                                                        ##
##  Parameters:                                                           ##
##  (packname): Name of the compressed group where the file will be added ##
##  (file)    : File to be added at the end of the compressed group       ##
##                                                                        ##
##------------------------------------------------------------------------##
##                                                                        ##
##  $(eval $(call PACKZX7B,<packname>,<dest_path>))                       ##
##                                                                        ##
##		Compresses all files in the <packname> group using ZX7B algorithm ##
## and generates 2 files: <packname>.c and <packname>.h that contain a    ##
## C-array with the compressed data and a header file for declarations.   ##
## Generated files are moved to the folder <dest_path>.                   ##
##                                                                        ##
##  Parameters:                                                           ##
##  (packname) : Name of the compressed group to use for packing          ##
##  (dest_path): Destination path for generated output files              ##
##                                                                        ##
############################################################################
##                                                                        ##
## Important:                                                             ##
##  * Do NOT separate macro parameters with spaces, blanks or other chars.##
##    ANY character you put into a macro parameter will be passed to the  ##
##    macro. Therefore ...,src/sprites,... will represent "src/sprites"   ##
##    folder, whereas ...,  src/sprites,... means "  src/sprites" folder. ##
##  * You can omit parameters by leaving them empty.                      ##
##  * Parameters (4) and (5) are optional and generally not required.     ##
############################################################################

#$(eval $(call ADD2PACK,presents,tmp/presents.bin))
#$(eval $(call PACKZX7B,presents,out/))

#$(eval $(call ADD2PACK,made,tmp/made.bin))
#$(eval $(call PACKZX7B,made,out/))

#$(eval $(call ADD2PACK,title,tmp/title.bin))
#$(eval $(call PACKZX7B,title,out/))

#$(eval $(call ADD2PACK,intro,tmp/intro.bin))
#$(eval $(call PACKZX7B,intro,out/))



#$(eval $(call ADD2PACK,roland_0,dat/roland_0.bin))
#$(eval $(call PACKZX7B,roland_0,out/))
#$(eval $(call ADD2PACK,roland_1,dat/roland_1.bin))
#$(eval $(call PACKZX7B,roland_1,out/))
#$(eval $(call ADD2PACK,roland_2,dat/roland_2.bin))
#$(eval $(call PACKZX7B,roland_2,out/))
#$(eval $(call ADD2PACK,roland_3,dat/roland_3.bin))
#$(eval $(call PACKZX7B,roland_3,out/))

#$(eval $(call ADD2PACK,spider_0,dat/spider_0.bin))
#$(eval $(call PACKZX7B,spider_0,out/))
#$(eval $(call ADD2PACK,spider_1,dat/spider_1.bin))
#$(eval $(call PACKZX7B,spider_1,out/))
#$(eval $(call ADD2PACK,spider_2,dat/spider_2.bin))
#$(eval $(call PACKZX7B,spider_2,out/))
#$(eval $(call ADD2PACK,spider_3,dat/spider_3.bin))
#$(eval $(call PACKZX7B,spider_3,out/))
#$(eval $(call ADD2PACK,spider_4,dat/spider_4.bin))
#$(eval $(call PACKZX7B,spider_4,out/))
#$(eval $(call ADD2PACK,spider_5,dat/spider_5.bin))
#$(eval $(call PACKZX7B,spider_5,out/))
#$(eval $(call ADD2PACK,spider_6,dat/spider_6.bin))
#$(eval $(call PACKZX7B,spider_6,out/))
#$(eval $(call ADD2PACK,spider_7,dat/spider_7.bin))
#$(eval $(call PACKZX7B,spider_7,out/))
#$(eval $(call ADD2PACK,spider_8,dat/spider_8.bin))
#$(eval $(call PACKZX7B,spider_8,out/))
#$(eval $(call ADD2PACK,spider_9,dat/spider_9.bin))
#$(eval $(call PACKZX7B,spider_9,out/))
#$(eval $(call ADD2PACK,spider_10,dat/spider_10.bin))
#$(eval $(call PACKZX7B,spider_10,out/))
#$(eval $(call ADD2PACK,spider_11,dat/spider_11.bin))
#$(eval $(call PACKZX7B,spider_11,out/))


#$(eval $(call ADD2PACK,ghost_0,dat/ghost_0.bin))
#$(eval $(call PACKZX7B,ghost_0,out/))
#$(eval $(call ADD2PACK,ghost_1,dat/ghost_1.bin))
#$(eval $(call PACKZX7B,ghost_1,out/))
#$(eval $(call ADD2PACK,ghost_2,dat/ghost_2.bin))
#$(eval $(call PACKZX7B,ghost_2,out/))
#$(eval $(call ADD2PACK,ghost_3,dat/ghost_3.bin))
#$(eval $(call PACKZX7B,ghost_3,out/))
#$(eval $(call ADD2PACK,ghost_4,dat/ghost_4.bin))
#$(eval $(call PACKZX7B,ghost_4,out/))
#$(eval $(call ADD2PACK,ghost_5,dat/ghost_5.bin))
#$(eval $(call PACKZX7B,ghost_5,out/))
#$(eval $(call ADD2PACK,ghost_6,dat/ghost_6.bin))
#$(eval $(call PACKZX7B,ghost_6,out/))
#$(eval $(call ADD2PACK,ghost_7,dat/ghost_7.bin))
#$(eval $(call PACKZX7B,ghost_7,out/))
#$(eval $(call ADD2PACK,ghost_8,dat/ghost_8.bin))
#$(eval $(call PACKZX7B,ghost_8,out/))


#$(eval $(call ADD2PACK,made_0,dat/made_0.bin))
#$(eval $(call PACKZX7B,made_0,out/))
#$(eval $(call ADD2PACK,made_1,dat/made_1.bin))
#$(eval $(call PACKZX7B,made_1,out/))
#$(eval $(call ADD2PACK,made_2,dat/made_2.bin))
#$(eval $(call PACKZX7B,made_2,out/))

#$(eval $(call ADD2PACK,mode_0,dat/mode_0.bin))
#$(eval $(call PACKZX7B,mode_0,out/))
#$(eval $(call ADD2PACK,mode_1,dat/mode_1.bin))
#$(eval $(call PACKZX7B,mode_1,out/))
#$(eval $(call ADD2PACK,mode_2,dat/mode_2.bin))
#$(eval $(call PACKZX7B,mode_2,out/))
#$(eval $(call ADD2PACK,mode_3,dat/mode_3.bin))
#$(eval $(call PACKZX7B,mode_3,out/))
#$(eval $(call ADD2PACK,mode_4,dat/mode_4.bin))
#$(eval $(call PACKZX7B,mode_4,out/))
#$(eval $(call ADD2PACK,mode_5,dat/mode_5.bin))
#$(eval $(call PACKZX7B,mode_5,out/))
#$(eval $(call ADD2PACK,mode_6,dat/mode_6.bin))
#$(eval $(call PACKZX7B,mode_6,out/))
#$(eval $(call ADD2PACK,mode_7,dat/mode_7.bin))
#$(eval $(call PACKZX7B,mode_7,out/))
#$(eval $(call ADD2PACK,mode_8,dat/mode_8.bin))
#$(eval $(call PACKZX7B,mode_8,out/))

#$(eval $(call ADD2PACK,controls_0,dat/controls_0.bin))
#$(eval $(call PACKZX7B,controls_0,out/))
#$(eval $(call ADD2PACK,controls_1,dat/controls_1.bin))
#$(eval $(call PACKZX7B,controls_1,out/))
#$(eval $(call ADD2PACK,controls_2,dat/controls_2.bin))
#$(eval $(call PACKZX7B,controls_2,out/))
#$(eval $(call ADD2PACK,controls_3,dat/controls_3.bin))
#$(eval $(call PACKZX7B,controls_3,out/))

#$(eval $(call ADD2PACK,play_0,dat/play_0.bin))
#$(eval $(call PACKZX7B,play_0,out/))
#$(eval $(call ADD2PACK,play_1,dat/play_1.bin))
#$(eval $(call PACKZX7B,play_1,out/))
#$(eval $(call ADD2PACK,play_2,dat//play_2.bin))
#$(eval $(call PACKZX7B,play_2,out/))

#$(eval $(call ADD2PACK,snowball_0,dat/snowball_0.bin))
#$(eval $(call PACKZX7B,snowball_0,out/))
#$(eval $(call ADD2PACK,snowball_1,dat/snowball_1.bin))
#$(eval $(call PACKZX7B,snowball_1,out/))
#$(eval $(call ADD2PACK,snowball_2,dat/snowball_2.bin))
#$(eval $(call PACKZX7B,snowball_2,out/))
#$(eval $(call ADD2PACK,snowball_3,dat/snowball_3.bin))
#$(eval $(call PACKZX7B,snowball_3,out/))
#$(eval $(call ADD2PACK,snowball_4,dat/snowball_4.bin))
#$(eval $(call PACKZX7B,snowball_4,out/))
#$(eval $(call ADD2PACK,snowball_5,dat/snowball_5.bin))
#$(eval $(call PACKZX7B,snowball_5,out/))
#$(eval $(call ADD2PACK,snowball_6,dat/snowball_6.bin))
#$(eval $(call PACKZX7B,snowball_6,out/))
#$(eval $(call ADD2PACK,snowball_7,dat/snowball_7.bin))
#$(eval $(call PACKZX7B,snowball_7,out/))
#$(eval $(call ADD2PACK,snowball_8,dat/snowball_8.bin))
#$(eval $(call PACKZX7B,snowball_8,out/))
#$(eval $(call ADD2PACK,snowball_9,dat/snowball_9.bin))
#$(eval $(call PACKZX7B,snowball_9,out/))
#$(eval $(call ADD2PACK,snowball_10,dat/snowball_10.bin))
#$(eval $(call PACKZX7B,snowball_10,out/))
#$(eval $(call ADD2PACK,snowball_11,dat/snowball_11.bin))
#$(eval $(call PACKZX7B,snowball_11,out/))
#$(eval $(call ADD2PACK,snowball_12,dat/snowball_12.bin))
#$(eval $(call PACKZX7B,snowball_12,out/))
#$(eval $(call ADD2PACK,snowball_13,dat/snowball_13.bin))
#$(eval $(call PACKZX7B,snowball_13,out/))
#$(eval $(call ADD2PACK,snowball_14,dat/snowball_14.bin))
#$(eval $(call PACKZX7B,snowball_14,out/))
#$(eval $(call ADD2PACK,snowball_15,dat/snowball_15.bin))
#$(eval $(call PACKZX7B,snowball_15,out/))
