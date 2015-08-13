Problem Statement:

  Given two binary strings; A (of length 10) and B (of length 5);
  output 1 if B is a substring of A and 0 otherwise

  Input
  24 lines consisting of pairs of binary strings A and B separated by a single space

  Output
  The logical value of: 'B is a substring of A'

Memory Layout:

   00: line counter
01_10: string A
11_15: string B
16_21: hash(substring A) minus hash(string B)

#0 [-]+++++ +++++ +++++ +++++ ++++  Set line counter
#0 [
  #0 >,>,>,>,>,> ,>,>,>,>,      Read string A
  #10 >,,>,>,>,>,>,[-]<         Read string B
  #15 >[-]>[-]>[-]>[-]>[-]>[-]  Clean up memory
  #21 <<<<< <<<<< <<<< <<<<< <

  Subtract 48 from characters to save computation
  #1 [----- ----- ----- ----- ----- ----- ----- ----- ----- --->]
  #16 <<<<< <<<<< <<<<<

  Construct hash of six substrings of string A
  #1 [- >>>>> >>>>> >>>>> +++++ +++++ +++++ + <<<<< <<<<< <<<<<] >
  #2 [- >>>>> >>>>> >>>> +++++ +++ > +++++ +++++ +++++ + <<<<< <<<<< <<<<<] >
  #3 [- >>>>> >>>>> >>> ++++ > +++++ +++ > +++++ +++++ +++++ + <<<<< <<<<< <<<<<] >
  #4 [- >>>>> >>>>> >> ++ > ++++ > +++++ +++ > +++++ +++++ +++++ + <<<<< <<<<< <<<<<] >
  #5 [- >>>>> >>>>> > + > ++ > ++++ > +++++ +++ > +++++ +++++ +++++ + <<<<< <<<<< <<<<<] >
  #6 [- >>>>> >>>>> > + > ++ > ++++ > +++++ +++ > +++++ +++++ +++++ + <<<<< <<<<< <<<<<] >
  #7 [- >>>>> >>>>> > + > ++ > ++++ > +++++ +++ <<<<< <<<<< <<<<] >
  #8 [- >>>>> >>>>> > + > ++ > ++++ <<<<< <<<<< <<<] >
  #9 [- >>>>> >>>>> > + > ++ <<<<< <<<<< <<] >
  #10 [- >>>>> >>>>> > + <<<<< <<<<< <] >

  Subtract hash of string B from hash of substrings of A
  #11 [- >>>>> ----- ----- ----- - > ----- ----- ----- - > ----- ----- ----- -
             > ----- ----- ----- - > ----- ----- ----- - > ----- ----- ----- - <<<<< <<<<<] >
  #12 [- >>>> ----- --- > ----- --- > ----- --- > ----- --- > ----- --- > ----- --- <<<<< <<<<] >
  #13 [- >>> ---- > ---- > ---- > ---- > ---- > ---- <<<<< <<<] >
  #14 [- >> -- > -- > -- > -- > -- > -- <<<<< <<] >
  #15 [- > - > - > - > - > - > - <<<<< <] >

  Check if result of hash subtraction is zero of any of six substrings
  #16 <<[-]                     Cell is set to 1 when a match is found
  #14 >[-]                      Cell in set to 0 when a match is unsuccessful
  #15 + >[[-]<->] <[-<[-]+>]                      Check substring 1
  #15 + >>[[-]<<->>] <<[-<[-]+>]                  Check substring 2
  #15 + >>>[[-]<<<->>>] <<<[-<[-]+>]              Check substring 3
  #15 + >>>>[[-]<<<<->>>>] <<<<[-<[-]+>]          Check substring 4
  #15 + >>>>>[[-]<<<<<->>>>>] <<<<<[-<[-]+>]      Check substring 5
  #15 + >>>>>>[[-]<<<<<<->>>>>>] <<<<<<[-<[-]+>]  Check substring 6

  Print the result to output
  #15 < +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++ .
  #14 > +++++ +++++ .           Print newline 
  #15 <<<<< <<<<< <<<<< -       Decrement line counter
#0 ]
