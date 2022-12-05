#!/usr/bin/env ruby
def parse_stack(stack)
    stacks={}
    stack.split("\n").reverse_each do |line| 
        next if line.match(/\ \d.*/)
        for i in (0..(line.length/4))
            stacks[i+1]=[] unless stacks[i+1] 
            line_char = line[4*i+1]
            stacks[i+1].push(line_char) if line_char != " "
        end
    end
    
    stacks   
end

def apply_instructions(instructions,stacks)
    instructions.each_line do |line|
        ammount, source, target = line.match(/move\ (\d+)\ from\ (\d+)\ to\ (\d+)/).captures
        stacks[target.to_i] += stacks[source.to_i].pop(ammount.to_i)    
    end
    stacks.each_value do |value|
        putc value.pop
    end 
end

if __FILE__ == $0
    file=File.open('crane.txt')
    lines = file.read
    stack,instructions = lines.split(/^\n/)
    stacks = parse_stack(stack)
    apply_instructions(instructions,stacks)
end