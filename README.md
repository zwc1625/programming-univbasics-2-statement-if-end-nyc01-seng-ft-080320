# Programming as Conversation 2: Selection with if...end and Friends

## Learning Goals

* Write an `if...end` statement

## Introduction

We've covered the **default sequence** Ruby follows when reading and executing
a Ruby file. Let's teach the sequence to change by using the **selection**
statement: `if...end`.

Since this is our first lesson using the Learn In-Browser IDE, we'll step
through the process of getting a code environment together.

1. Create a new file in the Learn In-Browser IDE. We can call this file
   `learning-if-end.rb
2. Type in (better than copy-paste!) the code samples
3. Run the Ruby code with `ruby learning-if-end.rb`
4. Edit the file and put in new examples as needed

## Write an `if...end` Statement

```ruby
run_code_inside = true
puts "Code before if...end"
if run_code_inside
  puts "code inside"
end
puts "Code after if...end"
```

Try entering this code in your file and try running it. The output should be
the following:

```text
Code before if...end
code inside
Code after if...end
```

Following the **default sequence** we:

1. Assign `run_code_inside`
2. Print out with `puts "Code before if...end"`
3. Reach the `if` statement
4. Evaluate the expression to the right of the `if` statement
5. Since it evaluates `true`, we perform the code between the `if` and `end`
   reserved words
6. Print out with `puts "Code after if...end"`

Try changing `run_code_inside` from `true` to `false` and see how the **default
sequence** operates:

1. Assign `run_code_inside`
2. Print out with `puts "Code before if...end"`
3. Reach the `if` statement
4. Evaluate the expression to the right of the `if` statement
5. Since it evaluates `false`, we skip to the `end` reserved word
6. Print out with `puts "Code after if...end"`

We want to keep working in the `learning-if-end.rb`, file, but we want to
"mute" this  bit of code. We can do that by taking a slight detour to discuss
"comments."

## Use Comments

A common practice is to use a "comment" to interrupt the **default sequence**.

Comments are **primarily** used to provide references or explanations about
what's going on in code. But a common use is to "comment-out" code: to "hide"
or "mute" buggy or unused code from the **default sequence**.

In Ruby, if we start a line with a `#`, Ruby won't "see" anything else until
the next line.

Consider:

```ruby
puts "Joy to the world"
puts "All the boys and girls"
puts "Joy to the fishes in the deep blue sea"
puts "Joy to you and me"
```

**Default sequence** satisfies our expectations by printing out:

```text
Joy to the world
All the boys and girls
Joy to the fishes in the deep blue sea
Joy to you and me
```

Now let's "comment out" the third line.

```ruby
puts "Joy to the world"
puts "All the boys and girls"
# puts "Joy to the fishes in the deep blue sea"
puts "Joy to you and me"
```

If we run this code, it produces:

```text
Joy to the world
All the boys and girls
Joy to you and me
```

Let's use a comment in its more "standared use," for documentation purposes.

```ruby
# From the Three Dog Night song: "Joy to the World (Jeremiah was a Bullfrog)"
puts "Joy to the world"
puts "All the boys and girls"
# puts "Joy to the fishes in the deep blue sea"
puts "Joy to you and me"
```
Be careful! A comment placed in the middle of an expression will confuse Ruby.

**Don't do this:**

```ruby
# From the Three Dog Night song: "Jeremiah the Bullfrog"
puts ( 1 #+ 1) # <== Bad!
puts "Joy to the world"
puts "All the boys and girls"
puts "Joy to the fishes in the deep blue sea"
puts "Joy to you and me"
```

As a rule of thumb, try to comment out from the beginning of the line to the
end. As you get more comfortable with Ruby, you might find clever ways to use
comments, but best keep things simple now.

> **A-HA! Moment**. The "return value" documentation shorthand `#=>` starts
> with a comment character. That means what's after `#` is ignored. That's why
> it's used as an "in-code" documentation convention.

## Comment-Out Code

Here's an example of us commenting out code

```ruby
# name = "Byron"
name = "Luca"

puts "We're sorry, but per health inspector's rules, #{name} is not allowed in
the store."

#=> "We're sorry, but per health inspector's rules, Luca is not allowed in
```

We can swap the comments:

```ruby
name = "Byron"
# name = "Luca"

puts "We're sorry, but per health inspector's rules, #{name} is not allowed in
the store."

#=> "We're sorry, but per health inspector's rules, Byron is not allowed in
```

As you go through this exercise, you can "comment-out" code you want to _keep_
but _not run_.

Later, we'll learn to use a tool called `git` to keep more "versions" of code
around, but for the moment, comments will do.

## Write an `if...else...end` Statement

A slightly more advanced version of `if...end` is `if...else...end`. In this
code, we are guaranteed that the code in ONE of the two blocs will run (as the
Boolean expression can only ever be one of two choices).

```ruby
chance_of_rain = 0.2
puts "Let's go outside!"
if chance_of_rain > 0.5
  puts "Pack an umbrella!"
else
  puts "Enjoy the fine day!"
end
puts "Oh, and always wear sunscreen!"
```

The output is the following when the chance of rain is `<= 0.5`:

```text
Let's go outside!
Enjoy the fine day!
Oh, and always wear sunscreen!
```

If we change `chance_of_rain` to `1`, we get:

```text
Let's go outside!
Pack an umbrella!
Oh, and always wear sunscreen!
```

In an `if...else...end` statement, if the expression to the right of `if`
evaluates `true`, the work between `if` and `else` is run. If the expression to
the right of `if` evaluates `false`, the code between `else` and `end` runs.

## Write an `if...elsif...else...end` Statement

Sometimes choices are strictly limited to a path A or path B option, sometimes
there's a third, fourth, option. In that case we need the
`if...elsif...else...end` statement.

```ruby
chance_of_rain = 0.2
if chance_of_rain <= 0.25
  puts "Pack a sun shelter!"
elsif (chance_of_rain > 0.25 && chance_of_rain < 0.75)
  puts "Pack an umbrella!"
else
  puts "Stay home and read Hegel."
end
```

Try filling in a table by changing the value of `chance_of_rain`. You'll see
that you get different output!

|`chance_of_rain` value|Output|
|-|-|
|`0.0000001`|&nbsp;|
|`0.2`|&nbsp;|
|`0.2000001`|&nbsp;|
|`0.3`|&nbsp;|
|`0.9`|&nbsp;|
|`1000`|&nbsp;|
|`-23`|&nbsp;|

## Use Statement Modifiers to Change Default Sequence

## Statement Modifiers

Ruby has a useful feature called a _statement modifier_ that allows you to put
a conditional at the end of a statement. For example, let's consider this
statement:

```ruby
puts "Hey, it's 2019!"
``` 

However, we don't want to say "Hey, it's 2019!" every time this code is run. We
**only** want to say it's 2019 if it's actually 2019. This is a good case for
an `if` statement modifier.

```ruby
puts "You know what year it is????"
this_year = 2019
puts "Hey, it's 2019!" if this_year == 2019
``` 

With output:

```text
You know what year it is????
Hey, it's 2019!
```

Now, with the statement modifier `if this_year == 2019` we are only putting it
if the year is, in fact, 2019.

We can also use `unless` in a statement modifier as well. 

> **LOGICAL FACT**: The English Logician Augustus DeMorgan _proved_ that
> "if-not" is equal to "unless." This had huge implications for the
> construction of CPUs, but he discovered it in the era of inkwells and steamer
> ships. See [DeMorgan's Laws][demorgan]

```ruby
this_year = 2019
puts "Hey, it's not 2019!" unless this_year == 2019
``` 

> **STRETCH**: Here we've hard-coded the year in `this_year`. If you want to
> ask **Ruby** to tell you the year, ask IRB what `Time.now.year` gives you.
> That _expression_ could be assigned to `this_year` if you want more
> robust &mdash; and thus better &mdash; code! It's a common practice for
> developers to try out an expression in IRB, verify it, make sure they
> understand it, and _then_ integrate it into their code.

## Conclusion

[demorgan]: https://en.wikipedia.org/wiki/De_Morgan%27s_laws
