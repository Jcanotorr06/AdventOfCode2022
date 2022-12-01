def openFile(filename:str):
    with open(filename, "r") as file:
        lines = file.readlines()
        return lines

def removeLineBreaks(lines:list):
    for i in range(len(lines)):
        lines[i] = lines[i].replace("\n", "")
    return lines

def groupItems(lines:list):
    groups = []
    group = []
    for line in lines:
        if line == "":
            groups.append(group)
            group = []
        else:
            group.append(line)
    groups.append(group)
    return groups


def findLarestGroup(groups:list):
    largestGroup = []
    for group in groups:
        if len(group) > len(largestGroup):
            largestGroup = group
    return largestGroup

def groupTotals(groups:list):
    totals = []
    for group in groups:
        total = 0
        for item in group:
            total += int(item)
        totals.append(total)
    return totals

def findLargstTotal(totals:list):
    largestTotal = 0
    index = 0
    for i, total in enumerate(totals, start=1):
        if total > largestTotal:
            largestTotal = total
            index = i
    return (largestTotal, index)

def findTopThree(totals:list):
    topThree = []
    for i in range(3):
        (largestTotal, index) = findLargstTotal(totals)
        topThree.append((largestTotal, index))
        totals[index-1] = 0
    return topThree

def sumList(list:list):
    total = 0
    for item in list:
        total += int(item)
    return total

def __main__():
    lines = openFile("input.txt")
    lines = removeLineBreaks(lines)
    groups = groupItems(lines)
    totals = groupTotals(groups)
    (largestTotal, index) = findLargstTotal(totals)
    print(f"The largest group is #{index} with a total of {largestTotal}")
    
    topThree = findTopThree(totals)
    print("The top three groups are:")
    for (total, index) in topThree:
        print(f"#{index} with a total of {total}")
    
    topThreeTotal = sumList([total for (total, index) in topThree])
        
    print(f"The total of the top three groups is {topThreeTotal}")
    
__main__()