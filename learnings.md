# Learning from Advent of Code

## Day 01

Using the `Array#permutation` method

## Day 02

Named capture blocks in RegExp

- `m = /(?<first>\d+)-(?<second>\d+) (?<character>[a-z]): (?<password>.+)/.match(line)`

## Day 03

Creating an Enumerator Class

- Using `Kernel#enum_for` to get Enumerable

## Day 04

What would a local configured environment look like?

- ActiveSupport
- Rake
- RSpec
- Rubocop
- Zeitwerk

## Day 05

Functional thinking vs representing with objects

- Using lambdas
- Collection pipelines

Passing `chomp` Option to `readlines` Method

- `File.readlines(name, chomp: true)`

Transforming Multiple Characters

- `tr("FBLR", "0101").to_i(2)`

Specifying a Base for Integer Conversion

- `tr("FBLR", "0101").to_i(2)`

Converting a Range to an Array

- `(seat_ids.min..seat_ids.max).to_a`

## Day 06

Using a lambda is useful when you have a collection pipeline in a collection pipeline.
