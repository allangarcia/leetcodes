"""
There's a staircase with N steps, and you can climb 1 or 2 steps at a time. Given N, write a function that returns the 
number of unique ways you can climb the staircase. The order of the steps matters.

For example, if N is 4, then there are 5 unique ways:

1, 1, 1, 1
2, 1, 1
1, 2, 1
1, 1, 2
2, 2
What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number from a set of positive 
integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 5 steps at a time. Generalize your function to take in X.
"""

from copy import copy


n = 4
steps = [1, 2]

def ways_to_traverse_a_stair(n, steps):
    
    answers = []
    stack = []
    
    for step in steps:
        item = [step]
        stack.append(item)
    
    print("Start:", stack)
    
    control = 0
    while len(stack) > 0:
        control += 1
        item = stack.pop()
    
        print("Before for:", stack)
    
        for step in steps:
            local = copy(item)
            local.append(step)
            stack.insert(0, local)
        
        print("After for:", stack)
        
        print("Before clean:", stack)

        for i in stack:
            print("Cleaning:", i)
            s = sum(i)
            if s == n:
                local = copy(i)
                answers.append(local)
                stack.remove(i)
            if s > n:
                stack.remove(i)
    
        print("After clean:", stack)
        print("---")
        print("Stack:", stack)
        print("Answers:", answers)
    
        if control > 0:
            break
    
    return answers


result = ways_to_traverse_a_stair(4, [1, 2])

print("Result =", result)