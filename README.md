# Ruby study quiz one: The solitaire Cipher

## How Solitaire Cipher works?

* General Steps

* Generating Keystream

### General Steps

#### Step 1: 

1. Upercase all letters 
2. Discard non A to Z characters
3. Compact 5 letters in to one group
4. Using 'X' to pad the last group if there is space left

_Example:_  

> Code in ruby, live longer => CODEI NRUBY LIVEL ONGER

#### Step 2:

1. Generating key stream. (This step is especially important and should be the key point of solitaire cipher)

_Example:_

> DWJXH YRFDG TMSHP UURXJ

#### Step 3:

1. Convert the message in step 1 to numbers

_Example:_

> 3 15 4 5 9 &nbsp;&nbsp; 14 18 21 2 25 &nbsp;&nbsp; 12 9 22 5 12 &nbsp;&nbsp; 15 14 7 5 18

#### Step 4:

1. Convert the message in step 2 to numbers

_Example:_ 

> 4 23 10 24 8 &nbsp;&nbsp; 25 18 6 4 7 &nbsp;&nbsp; 20 13 19 8 16 &nbsp;&nbsp; 21 21 18 24 10

#### Step 5: 

1. Add the numbers in step 3 and step 5. If the sum number is bigger than 26, then substract 26 from that number

_Example:_
> 7 12 14 3 17 &nbsp;&nbsp; 13 10 1 6 6 &nbsp;&nbsp; 6 22 15 13 2 &nbsp;&nbsp; 10 9 25 3 2

#### Step 6:

1.  Convert the number to letters
_Example:_

> GLNCQ MJAFF FVOMB JIYCB
