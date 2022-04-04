# Overview

Recently I was working on a PL/SQL project and I had so many unsaved tabs open on SQLDeveloper. Before I could save those queries, It crashed and got closed.
It led me to think and prepare a project to get those queries and save it.

## How this works

Since I am using WSL2 on Windows 10, by default all Oracle SQL history(queries) are saved on location `C:\Users\pc\AppData\Roaming\SQL Developer\SqlHistory`. So this will be the input to the function.

* Create a `.sql` file in current directory whose by default name is `allSqls.sql`, which can be changed as per user's wish. Sample file can be seen at right.
<img src="img/snippet.png?raw=true" alt="drawing" width="400" align="right"/>
* Add the current time at top of the file.
* Traverse through all `xml` files from input directory and extract the text from `SQL` tag.
* Add that text to the `sql` file.


### P.S

Pressing F8 in SQLDeveloper will also give us similar SQL history
