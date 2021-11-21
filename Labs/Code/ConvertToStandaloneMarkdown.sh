#!/bin/sh
# To run this script, provide a folder name containing instructions.md file to convert.

# Replace !IMAGE[image2.png](image2.png) to ![](content/image2.png)
sed -i 's+\!IMAGE\[.*\](\(.*\))+\!\[\](content/\1)+g' $1/instructions.md

# Get rid of notes >[!note] (case insensitive + the might be a whitespace after >) should be replaced by >Note:
sed -i 's/>\s\{0,1\}\[![nN][oO][tT][eE]\]/>Note:/Ig' $1/instructions.md

# Get rid of tips >[!tip] (case insensitive + the might be a whitespace after >) should be replaced by >Tip:
sed -i 's/>\s\{0,1\}\[![tT][iI][pP]\]/>Tip:/Ig' $1/instructions.md

# Get rid of alerts >[!alert] (case insensitive + the might be a whitespace after >) should be replaced by >Alert:
sed -i 's/>\s\{0,1\}\[![aA][lL][eE][rR][tT]\]/>Alert:/Ig' $1/instructions.md

# Get rid of warnings >[!warning] (case insensitive + the might be a whitespace after >) should be replaced by >Warning:
sed -i 's/>\s\{0,1\}\[![wW][aA][rR][nN][iI][nN][gG]\]/>Warning:/Ig' $1/instructions.md

# Get rid of knowledge >[!knowledge] (case insensitive + the might be a whitespace after >) should be replaced by >Knowledge:
sed -i 's/>\s\{0,1\}\[![kK][nN][oO][wW][lL][eE][dD][gG][eE]\]/>Knowledge:/Ig' $1/instructions.md

# +++**dotnet publish -o published**+++ to replace by `dotnet publish -o published`
sed -i 's+\+\+\+\*\*\(.*\)\*\*\+\+\++`\1`+g' $1/instructions.md

# Replace @lab.Variable(CONTAINER_ID_OR_NAME) by <CONTAINER_ID_OR_NAME> 
sed -i 's+@lab.Variable(\(.\{1,35\}\))+<\1>+g' $1/instructions.md

# Replace <optional whitespaces><number>. []. by '<number>. ' 
sed -i 's+^\(\s*\)\([0-9][0-9]*\)\.\s\[\]\s*+\1\2. +g' $1/instructions.md

# TO REMOVE IF WE WANT TO CONVERT BACK TO LOD FORMAT
# Remove === and ---
sed -i 's/^===//Ig' $1/instructions.md
sed -i 's/^---//Ig' $1/instructions.md

# TO REMOVE IF WE WANT TO CONVERT BACK TO LOD FORMAT
# Remove {#lab-module-1---introduction-to-containers .LabTitle}
sed -i 's+{#.*module.*LabTitle}++g' $1/instructions.md

