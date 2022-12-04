#!/usr/bin/env ruby
def get_prio(char)
    return (char.ord-'a'.ord)+1 if char.ord >= 'a'.ord and char.ord <= 'z'.ord
    return (char.ord-'A'.ord)+27 if char.ord >= 'A'.ord and char.ord <= 'Z'.ord
end
if __FILE__ == $0
    file=File.open('backpack.txt')
    sum = 0
    file.readlines.each do |line|
        left,right = line.chars.each_slice( ((line.size-1)/2.0).round ).to_a
        sum += get_prio(left.&(right)[0])
    end

    puts sum
end