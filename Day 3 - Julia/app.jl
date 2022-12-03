function ord(x::Char)
    return Int(codepoint(x))
end

open("input.txt") do f
    priority = 0

    while !eof(f)
        rucksack = readline(f)
        compartmentA = rucksack[1:(end ÷ 2)]
        compartmentB = rucksack[(end ÷ 2 + 1):end]

        
        for item in compartmentA
            if item in compartmentB
                value = ord(item)>94 ? ord(item) - 96 : ord(item) - 64+26
                priority += value
                break
            end
        end
    end
    
    println("Part 1: $priority")
end

open("input.txt") do f
    priority = 0

    while !eof(f)
        allRucksacks = readlines(f)
        n = 1
        while n < length(allRucksacks)
            for item in allRucksacks[n]
                if item in allRucksacks[n+1] && item in allRucksacks[n+2]
                    value = ord(item)>94 ? ord(item) - 96 : ord(item) - 64+26
                    priority += value
                    n += 3
                    break
                end
            end
        end
        print("Part 2: $priority")
    end
end

