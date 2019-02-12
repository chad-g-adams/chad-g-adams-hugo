+++
categories = ["code"]
date = "2019-02-12T13:20:22-05:00"
description = ""
keywords = ["elixir", "advent"]
title = "Advent of Code 2018"
tags = ["elixir"]

+++

This past December I discovered the __[Advent of Code](https://adventofcode.com/2018)__ challenge, in which you get a different coding puzzle for each day in December leading up to Christmas. The puzzles can be solved in any programming language of your choice.

I decided to solve the puzzles in Elixir, which is a newer language that I am starting to use at work. The creator of Elixir, José Valim, was solving the puzzles as well and [live streaming his solutions](http://blog.plataformatec.com.br/2018/11/lets-learn-elixir-together-with-advent-of-code/). Other Elixir experts were also publishing solutions, such as [Saša Jurić](https://github.com/sasa1977/aoc). This was so cool! A fabulous way to learn a new language.

Due to time constraints I only attempted about half of the puzzles with my [solutions posted here](https://github.com/chad-g-adams/advent-of-code-2018). I was hoping to go back and finish the rest of the puzzles but that hasn't happened so I'm wrapping this up with a blog post now.

## Commentary

Partway through I realized it would be helpful to myself to capture personal insights for each solution, so I left some commentary in the code solutions themselves which I am reproducing here:

<table>
<tr>

<td style="width: 20%">
Day 5 
</td>
<td>
<sub>
    For this solution, I found that converting each individual character to a String for purpose of doing downcase() 
    was performance impacting (total 30 seconds to solve puzzle). So I switched to using assumption
    that input was only ascii letters (and added a validation check to ensure this assumption holds). 
    Thus I could compare upper/lower case by adding 32 to the value instead of converting to string. Solution runs 15x faster.
    </sub>
</td>

<tr>
<td>
Day 6
</td>

<td>
<sub>
The performance of my solution is lacking, it took 30 seconds to solve Part 1 on my laptop.
Part 2 solution was even worse - 2 min 26 s.
If I had more time I would go back and optimize!
</sub>
</td>
</tr>

<tr>
<td>
Day 7
</td>
<td>
<sub>
    First part was OK, second part took a long time to solve.
    First puzzle where my code worked for the test data but didn't work for the full solution.
    (Turned out I read the challenge wrong.. was using wrong number of workers).
    Passing a lot of parameters around. Might be easier to pass state around as a
    single map structure than as individual parameters.
    
</sub>
</td>
</tr>

<tr>
<td>
 Day 8
</td>
<td>

<sub>
    Got bitten by elixir when doing efficient building a list by appending to the start
    but then forgetting to reverse list at the end (when order became important)!
    This caused some grief. I could have noticed this error sooner if I ran the tests more frequently
    during development.

</sub>
</td>
</tr>
<tr>
<td>
Day 9
</td>
<td>

<sub>
    Nice to use Stream.unfold for the first time, also learned how to sleep in elixir.

</sub>
</td>
</tr>
<tr>
<td>
Day 10
</td>
<td>

<sub>
    Things I learned today, you can do pattern matching in anonymous functions!
    Part 1 was solved in a straightforward, albeit not great performance way.
    Part 2 The non-performant solution was no longer reasonable. I tried a few
     optimizations but couldn't make it fast enough. Then I found this hint:
     https://en.wikipedia.org/wiki/Summed-area_table
     but by that point it was the end of the night and I didn't feel like implementing it.

</sub>
</td>
</tr>
<tr>
<td>
Day 18
</td>
<td>

<sub>
  Felt really good about solving this one, my growing familiarity with the elixir
  modules is starting to pay off. Assist to my wife for talking through Part 2 strategy with me.
  
</sub>
</td>
</tr>
</table>