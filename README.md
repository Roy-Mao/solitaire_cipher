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

### Generating Keystream

#### Step 1:

1. Find Joker A (smaller joker, 53 in the array) and move it down one card.

#### Step 2:

1. Find Joker B (bigger joker, 54 in the array) and move it down two cards.


Example: 

So if the deck looks like this before step 1:

	A 7 2 B 9 4 1
at the end of step 2 it should look like:

	7 A 2 9 4 B 1
And if the deck looks like this before step 1:

	3 A B 8 9 6
at the end of step 2 it should look like:

	3 A 8 B 9 6


#### Step 3:

1. Perform a triple cut. Exchange all the cards above the joker, which is nearest to the top and all the cards under the joker, which is furthurest from the bottom.

Example:

If the deck used to look like:

	2 4 6 B 5 8 7 1 A 3 9
then after the triple cut operation it will look like:

	3 9 B 5 8 7 1 A 2 4 6

If the deck used to look like:

	B 5 8 7 1 A 3 9
then after the triple cut operation it will look like:

	3 9 B 5 8 7 1 A
A deck that looks like:

	B 5 8 7 1 A
will remain unchanged by this step.


#### Step 4:

1. Perform a count cut. See the number of the bottom card. Count that many cards from the top and move all these cards, inserting them just above the bottom card. The bottom card shall not be moved in this step.

Example:

If the deck used to look like:

	7 ... cards .. 4 5 
	... cards ... 8 9
and the ninth card was the 4, the cut would result in:

	5 ... cards ... 8 7
	... cards ... 4 9

#### Step 5:

1. Find the output card. Look at the top card and count that many times and the card after your count should be the output card. If you hit a joker (53 or 54 in my case), just do nothing and come back to step 1, doing it all over again.

2. Because the keystream is the upper case 26 English letters. Therefore we need to know how to transform our output card (number) to the number between 1 - 26. Simply minus 26 if the output number is greater than 26

Example:

Before this step, if the deck of cards look like this:

	2 3 4 ... 52 A B 1

Then, you count two cards (2 and 3), and the card after your count is 4, this is the output card.

