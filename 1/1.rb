#!/usr/bin/env ruby

if __FILE__ == $0
    elves = []
    file = File.open "~/repos/aoc2022/1/calories.txt"
    input = file.read.split(/^\n/)
    input.each do |line|
        sum = 0
        line.split.each do |number|
            sum = sum + number.to_i
        end
        elves << sum
    end
    maxelves = 0
    3.times do
        maxelves = maxelves + elves.max
        elves.delete(elves.max)
    end
    puts maxelves
end