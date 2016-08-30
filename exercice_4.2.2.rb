4.2.2

1. Assign variables city and state to your current city and state of residence. (If residing outside the U.S., substitute the analogous quantities.
city = "Pleiku"
province = "Gia Lai"

2. Using interpolation, print (using puts) a string consisting of the city and state separated by a comma and as space, as in “Los Angeles, CA”.
puts "#{city}, #{province}"

3. Repeat the previous exercise but with the city and state separated by a tab character.
puts "#{city} #{province}"

4. What is the result if you replace double quotes with single quotes in the previous exercise?
#{city} #{province}

4.2.3
1. What is the length of the string “racecar”?
"racecar".length
=> 7

2. Confirm using the reverse method that the string in the previous exercise is the same when its letters are reversed.
"racecar".reverse
=> racecar

3. Assign the string “racecar” to the variable s. Confirm using the comparison operator == that s and s.reverse are equal.
s = "racecar"
s.reverse == s ? "Equal" : "Not Equal"


4. What is the result of running the code shown in Listing 4.9? How does it change if you reassign the variable s to the string “onomatopoeia”? 
Hint: Use up-arrow to retrieve and edit previous commands
>> puts "It's a palindrome!" if s == s.reverse
=> It's a palindrome!
If change s = “onomatopoeia” -> output = nil

4.2.4

1.By replacing FILL_IN with the appropriate comparison test shown in Listing 4.10, define a method for testing palindromes.
Hint: Use the comparison shown in Listing 4.9.
def palindrome_tester(s)
  if FILL_IN
    puts "It's a palindrome!"
  else
    puts "It's not a palindrome."
  end
end

FILL_IN: s == s.reverse

2. By running your palindrome tester on “racecar” and “onomatopoeia”, confirm that the first is a palindrome and the second isn’t.
s = "racecar"
=> "It's a palindrome!"
s = "onomatopoeia"
=> "It's not a palindrome."

3. By calling the nil? method on palindrome_tester("racecar"), confirm that its return value is nil 
(i.e., calling nil? on the result of the method should return true). This is because the code in Listing 4.10 prints
its responses instead of returning them.

def palindrome_tester(s)
  s == s.reverse ? "It's a palindrome!" : "It's not a palindrome."
end


4.3.1

1. Assign a to be to the result of splitting the string “A man, a plan, a canal, Panama” on comma-space.
a = "A man, a plan, a canal, Panama".split(', ')

2. Assign s to the string resulting from joining a on nothing.
s = a.join

3. Split s on whitespace and rejoin on nothing. Use the palindrome test from Listing 4.10 to confirm that the resulting string s is not a palindrome by the current definition. Using the downcase method, show that s.downcase is a palindrome.
s.split(' ').join
palindrome_tester(s)
4. What is the result of selecting element 7 from the range of letters a through z? What about the same range reversed? Hint: In both cases you will have to convert the range to an array.
a = ('a'..'z').to_a
element_7 = a[6] -> g
a_rev = a.reverse
element_7 = a_rev[6] -> t

4.3.2

1. Using the range 0..16, print out the first 17 powers of 2.
result = (0..16).to_a.map {|x| x*x}
 => [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256]

2. Define a method called yeller that takes in an array of characters and returns a string with an ALLCAPS version of the input. Verify that yeller([’o’, ’l’, ’d’]) returns "OLD".
Hint: Combine map, upcase, and join.
def yeller(a)
  a.map {|c| c.upcase}.join
end

Define a method called random_subdomain that returns a randomly generated string of eight letters.
By replacing the question marks in Listing 4.12 with the appropriate methods, combine split, shuffle, and join to write a function that shuffles the letters in a given string.
