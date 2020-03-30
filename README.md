# Programming as Conversation 2: Selection with if...end and Statement Modifiers

## Learning Goals

* Write an `if...end` statement
* Write an `if...else...end` Statement
* Write an `if...elsif...else...end` Statement
* Use statement modifiers to change default sequence

## Introduction

We've covered the **default sequence** Ruby follows when reading and executing
a Ruby file. Let's teach the sequence to change by using the **selection**
statement: `if...end`.

In this lab, we will cover the basics of `if...end` statements. At the end, you
 will need to write your own code and pass the included test.

## Write an `if...end` Statement

To write a basic `if...end` statement in Ruby, the first line should start with
`if`, followed by a condition. If _this thing_ is true...

```ruby
if <something that is either true or false>
```

Following this line, we can add some code that we want to run when the if
statement is true. This code is conditional - it may or may not run! To let Ruby
know we're done writing conditional code, we add `end`.

```ruby
if true
  puts "This code runs!"
end
```

Run in IRB, the above code will output

```sh
This code runs
 => nil
```

The code inside the `if...end` statement below will _never_ run:

```ruby
if false
  puts "This code does not run. You will not see this in IRB"
end
```

Instead of writing `true` or `false`, we typically use a variable or expression.

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
5. Since the expression `run_code_inside` evaluates `true`, we perform the code
   between the `if` and `end` reserved words
6. Print out with `puts "Code after if...end"`

Try changing `run_code_inside` from `true` to `false` and see how the 
**default sequence** operates:

1. Assign `run_code_inside`
2. Print out with `puts "Code before if...end"`
3. Reach the `if` statement
4. Evaluate the expression to the right of the `if` statement
5. **Since the expression `run_code_inside` evaluates `false`, we skip to the `end` reserved word**
6. Print out with `puts "Code after if...end"`

We are essentially saying we want to execute our code, but we want to "mute"
this one part of if.

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

<table>
<thead>
<tr>
<th><code>chance_of_rain</code> value</th>
<th>Output</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>0.0000001</code></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><code>0.2</code></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><code>0.2000001</code></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><code>0.3</code></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><code>0.9</code></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><code>1000</code></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><code>-23</code></td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

## Use Statement Modifiers to Change Default Sequence

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
puts "You know what year it is??"
this_year = 2019
puts "Hey, it's 2019!" if this_year == 2019
```

With output:

```text
You know what year it is??
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

## Your Challenge

Now that we've seen a few examples of selection statements, it is time to test
our knowledge. Your task is to write an `if...else...end` statement. For this
statement, the condition will be based on the current time:

* If the current second is an **even** number, output `Even!`
* If the current second is an **odd** number, output `Odd!`

To determine the exact time, we can rely on Ruby's built-in `Time` class. In
IRB, running [`Time.now`][now] will give you the current time:

```sh
2.6.1 :001 > Time.now
  => 2020-02-25 09:00:33 -0500
```

In the example above, the time is 09:00:33 AM. Similar to a `String`,
[`Time`][time] is a class in Ruby and `Time.now` returns a `Time` _object_. It
isn't a `String` and it isn't an `Integer`, but like them, it can be stored in
a variable.

```sh
2.6.1 :002 > current_time = Time.now
  => 2020-02-25 09:07:47 -0500
```

And can be it can be converted to either:

```sh
2.6.1 :003 > current_time.to_s
  => "2020-02-25 09:07:47 -0500"
2.6.1 :004 > current_time.to_i
  => 1582639667
```

> **Note:** Converting a `Time` object to an integer returns 
> [Epoch time][epoch], the number of seconds since January 1st, 1970.

So we can get the current time, and we can convert this time into an integer.
But how can we incorporate this into an expression that evaluates to `true` or
`false`?

[epoch]: https://en.wikipedia.org/wiki/Unix_time

Try to work out a solution using what you've learned about `if...else...end`
statements and Boolean expressions. Write your answer in `lib/if_else_end.rb`
and run `learn` to see your test progress.

## Solving This Lab

There are multiple ways to solve this lab and we will look at two possible
solutions. Remember, the task is to output either `Even!` or `Odd!` depending on
the current second.

### Solution One

We can write out a lot of the code without knowing all of it
exactly. First, we can write the `if...else...end` statements, but we'll leave
out the condition for the moment:

```ruby
if true
  puts "Even!"
else
  puts "Odd!"
end
```

With the setup above, the output will always be `Even!`. To change that, we will
need to replace `true` with an expression based on `Time.now` that deterrmines
if the current second is even or odd.

We might start by capturing the `Time.now` value:

```ruby
current_time = Time.now
```

Convert it to an integer

```ruby
current_time = current_time.to_i
```

If we recall the lesson on arithmetic, the modulo operator, `%`, can be used to 
tell if an integer is even or odd:

```ruby
current_time = Time.now
current_time = current_time.to_i

if current_time % 2 == 0
  puts "Even!"
else
  puts "Odd!"
end
```

The expression `current_time % 2` will either return a zero or one. If we add
`== 0` to it, the complete expression will compare the results of
`current_time % 2` to zero. Therefor, if the current_time is an even second, the
expression will evaluate to `true`.

We could actually clean up our code a bit if we choose, and skip using the
`current_time` variable entirely:

```ruby
if Time.now.to_i % 2 == 0
  puts "Even!"
else
  puts "Odd!"
end
```

### Solution Two

Taking a quick look at the [`Integer` class][integer] in Ruby, it turns out
there is a built-in tool for checking if any integer is even - the `.even?`
method:

```ruby
current_time = Time.now
current_time = current_time.to_i

if current_time.even?
  puts "Even!"
else
  puts "Odd!"
end
```

This should now satisfy the test requirements. Run `learn` to confirm you've
passed the two tests in this lab.

## Conclusion

Selection statements are a core part of programming. They allow us to make our
code more dynamic. Our example based on seconds may not be the most applicable,
but there are definitely times when we might want some piece of code to only run
on specific _hours_ or _days_. More often, especially as we are learning,
conditional statements are a great way to output _our own_ messages. We could,
for instance, confirm our own beliefs about a piece of code we've written by
adding an `if...end` statement after it and comparing the result of our code
against what we expect.

```ruby
result = 2 + 2

if result == 4
  puts "We've done it!"
end
```

[time]: https://ruby-doc.org/core-2.6.3/Time.html
[now]: https://ruby-doc.org/core-2.6.3/Time.html#method-c-now
[demorgan]: https://en.wikipedia.org/wiki/De_Morgan%27s_laws

