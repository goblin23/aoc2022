#!/usr/bin/env ruby
def get_prio(char)
    return (char.ord-'a'.ord)+1 if char.ord >= 'a'.ord and char.ord <= 'z'.ord
    return (char.ord-'A'.ord)+27 if char.ord >= 'A'.ord and char.ord <= 'Z'.ord
end
if __FILE__ == $0
    file=File.open('backpack.txt')
    sum = 0
    lines = file.readlines
    until lines.empty?
        group = lines.pop(3)
        badge = group[0].chars.&(group[1].chars).&(group[2].chars)
        sum += get_prio(badge[0])
    end
    puts sum
end