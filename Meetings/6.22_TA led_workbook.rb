# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

=begin
Intput: string of characters - input will only consist of lowercase characters and will be at least one letter long. 
Output: longest alphabetical substring in alphabetical order

Requirements:

Explicit:
-  With multiple solutions, return the one that appears first.

Implicit: 
- if only one letter string is given or 1 character is the longest alphabetical string, first character returned.

E -

'asd' input returns 'as' - straight forward
why doesn't line 28 return 'as' --> longest string happens after that

D - 

loop for iteration.  The input of the string object is compared one letter at a time to the next character in line. This has
greater than or equal to comparison. 

A -
Create a new variable `str` and assign it an empty string object ' '.
Using a method that will iterate over each character of the string, add the new string to the empty string if the substring meets
the block's criteria.
The block will compare the following:
- Comparing character by character:
    - If the first letter is greater than or equal to the second letter, it gets added to the new string.
    - If the first letter is less than the second letter, the program skips to the next character and starts afresh.
    - If the new string is the longest alphabetical substring in the string, return this new string
    - Else this this will return the first character.

-Feedback from Chris
 - visual representation, more I do this, find a style
  - working with other students, see how other people do it
  - tweak it how it works for me
  - good trying to avoid talking about a specific method
  - don't get bulldozed into one approach
  - algorithm is organized, good level of detail
  - writing out a particular, without writing an entire paragraph
  - saves more time in a concise manner
=end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

Problem- 
# Input: string
# Output:  string- word with highest score
  # 
# Examples/test cases
  # p alphabet_score('man i need a taxi up to ubud') == 'taxi'
  p alphabet_score('what time are we climbing up the volcano') == 'volcano'
  p alphabet_score('take me to semynak') == 'semynak'
  p alphabet_score('aa b') == 'aa'
  
  # Data structure- what are you going to use; 
     # arrays and hash
  #Algorithm
  # High-level: overarching approach, plain english
      # create a hash with letters as keys and ascending numerals as values, split string into words, iterate through the letters of the word adding each letters score to the total for that word, 
  # Low level: use the high level to write a detailed approach. 
       # create an alpha_score global variable value  hash with letters as keys and ascending numerals as values
    # ‘a’ =>1, ‘b’ => 2, etc
      # initialize a word_score hash
       #split string into words
      # iterate through the letters of the word adding each letters score to the total for that word
    # initialize a sum variable value 0
  # split the word into letters
  # retrieve the value of the letter key from the alpha_score hash and add it to the score variable
    # add each word to the word_score hash with the score as the value
      # find the largest score
    # choose the hash key with the biggest value
      # return the word with the largest score

=begin
Feedback from Chris
  - high-level/low-level  
  - just put the object type in the input and output
  - No areas where this should get explained more
  - In an interview situation , it might be easier to reference quickly and simply.
  - Looking good.
=end





# Richard's PEDA
# GIVEN a `string`. 
# Initialize a variable `str` to the return value of deleting all non-letter characters, i.e. anything NOT a-zA-Z, from the `string`. 
  # If you are not sure how to delete characters, then you can think about substituting all non-letters with empty strings. 
  # If you are not sure how to substitute letters in a string, you can split the string into characters and then add the letters to a new string. 
# Initialize a variable `chars` to the return value of splitting the letters in string object referenced by`str`.

# **SORT BY** each lowercased letter in the `chars` array. Here's an explanation of what's happening: 
  # Iterate over the characters in `chars`:
    # Lowercase the character 
    # Use the spaceship operator to compare characters and order them. 
 
# SET the `chars` variable to the return value of sorting the `chars` variable by lowercased character value. 
# Join the characters in `chars` into a string. 
# Return the joined string.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

=begin
In the return string, capital 'B' , case insensitive, doesn't matter.  If it were case sensitive. Since we are comparing the letters.  
A requirment is we must remove punctuation and whitespace.  No numerals, just information, get rid of anything that isn't a letter. Line ;
61 is deleted. Return an empty string.  That also serves as a way for us to figure out what we need to do.  We only want English letters. 
I am going to delete anything that is not a letter.  Delete anything , sortby each letter value in case insensitive letter.  There's a
  method called sort_by that would take care of this.  I would split the letters into individual letters.  Sort the array of letters.  
  Then I would join them together and would result in a string brought together. 

  - Very good job from Chris
  - Algorithm is very organzied.
  - If disorganized, more difficult, go back and forth implementing into code. 
  - Like the way the algorithm is laid out. 
  - So nice, making life easier.
  - Not necessary for interview situation. 
=end

=begin

Problem and rules: 

Input = lowercase characters string at least one character longest
output = longest substring of input string where all characters are in alphabetical order

- if more than one substring meets the condition, return the first one that appears. 

Examples: 
  ('asd') == 'as'

Data structure: Arrays. 
  Visual Aid:
  ('asd') => ['a', 's', 'd'] => [a, as, asd, s, sd, d ] => as
  - substring that meets the requirements. 
  - visually broke it into a string of characters
  - writing it down extracting every substring
  - longest in alphabetical order
  - put into words visually
  from input String
    split string into characters
      extract all possible substrings from the characters Array
        return the longest one where the characters are in alphabetical order **

Algorithm:
  - create an array of characters from the string input.
  - iterate through the characters and extract all possible substrings given the input string's characters.
    - TO DO THIS:
      - iterate through the characters array using nested iteration, starting from the initial character and up to the last character.
        - then iterate from the second character up to last character.
          - ETC.
    - Once all substrings are collected, return the longest substring from the collection which satisfies the conditions of being in alphabetical order.
     - TO DO THIS:
      - select only the substrings where the character's order in ASCII is ascending.
        PSUDO : char's.ord == chars.ord.sort 
      - return the first appearance of longest substring.
      - use the max_by method in order to extract the biggest bite size.

Feedback from Chris - 
- Obvious he has a grasp for the problem
- More comfortable with the PEDAC process and what works for me
- '*' signify problem areas
- organization is really good
- whole breakdown is really good
- often one of the things are overlooked - iterate over this and that, where it's all packed into one sentence. Break it down a little
bit.  It's the meat of the problem, haven't really broken it down.



=end


p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'

p longest('zyba') == 'z'


=begin
ADAM's PEDAC
input: String (of words)
return: new String (substring of argument) (mutate? - ask the interviewer)
goal: calculate the value of each word based on its position in the alpahbet
      and determine the highest scoring word
rules:
  only lowercase letters are considered
  words are defined by a whitespace delimiter
  letters are valued based on their position in the alphabet
  first word with highest score is returned


****VISUAL AID used here as well!!!

'aa b' => ['aa', 'b'] => top_score = '' => 'aa', 1 + 1 => top_score = 'aa' =>
'b', 2

******VISUAL AID used here as well!!

algorithm:
  ***HIGH LEVEL:
    break the argument into a list of words
    iterate through the list and determine the value of each word
    select the largest valued word

  ***LOW LEVEL:
    split the argument into an Array of substrings using a whitespace delimiter
    initialize a top_score = ['', 0]  *** WHAT this value is
    iterate through the list
      iterate through the word's characters to determine the word_score
        determine the value of the letter based on its ordinal value
        add value to word_score
      if word_score is larger than top_score's number
        replace top_score's word and number with [current word, word_score]
    return top_score[0] - first element in the top_score

alt algo
  HIGH LEVEL:
    break the argument into a list of words
    sort the list of words by the value of each word
    select the largest valued word - really useful way of approaching this

  LOW LEVEL:
    split the argument into an Array of substrings using a whitespace delimiter
    sort the list
      iterate through the word's characters to determine the word_score
        initialize word_score
        determine the value of the letter based on its ordinal value
        add value to word_score
    select the last word in the list

Feedback from Chris
- Easy to read
- Broken down very nicely
- Made note of questions to get clarification from interviewer
- wrote out the rules in own words
- simple powerful way to see if I know what the problem is trying to help
- using the test case to break down the step by step.
- High and Low level algorithms
- illustrates how you show you thought of another appraoch
- perhaps the first thing is too complicated
- work another algorithm out
- try not to get too set in stone with approach
- some of the psuedocode adding actual Ruby code could possibly cause me to 
become married to a particular approach
- Plain English writing , haven't thought too much of the implementation yet.

=end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

#Home work - go through the PEDA process
# Use the test cases - try and go through the algorithm to code it up
# - Talk on Slack, give each other feedback and see how other people do it
# - Can go ahead
# - Pretend to be the inteviewer and interviewee
# - Practice communication, PEDAC process
# - critique, advice and flip positions
# - biggest way to get used to the interview environment
