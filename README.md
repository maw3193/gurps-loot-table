LOOT TABLE
==========

This programme, "Loot Table", is a tool to generate treasure suitable for
GURPS™ Dungeon Fantasy™ 8 - Treasure Tables. It is intended as a game aid
to GURPS Dungeon Fantasy.

Prerequisites
-------------

This tool requires lua to run, and is only tested on linux, so I can't comment
on how well it'll work on non-linux systems. OS X and other unix-derivatives
should be fine. I do not know how Windows will use this.

Usage
-----

This is a purely command-line tool. It is run with:


    main.lua [item_count] [random_seed]

'item_count' is optional, and indicates how many items to generate.
The default is 24.
'random_seed' is also optional, and is the random number generator seed.
This is useful for getting repeatable results, and helps me with debugging.

If this doesn't work (e.g. your lua binary is stored elsewhere, or your OS
doesn't support shebangs, prepend the command-line with 'lua', e.g.)

    lua main.lua 1

It outputs to standard output, if you want to store the output in a file,
use output redirection appropriate to your OS, e.g.

   ./main.lua 1000 > one-thousand-items.txt

Copyright
---------

GURPS is a trademark of Steve Jackson Games, and its rules and art are
copyrighted by Steve Jackson Games. All rights are reserved by Steve Jackson
Games. This game aid is the original creation of Jonathan Maw and is released
for free distribution, and not for resale, under the permissions granted in the
[Steve Jackson Games Online Policy](http://www.sjgames.com/general/online_policy.html)
