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


n = 10
steps = [1, 3, 5]

def ways_to_traverse_a_stair(n, steps):
    
    answers = []
    stack = []
    mark_to_delete = []
    
    for step in steps:
        item = [step]
        stack.append(item)
    
    print("Start:", stack)

    while len(stack) > 0:

        item = stack.pop()
    
        print("Before for:", stack)
    
        for step in steps:
            local = copy(item)
            local.append(step)
            stack.insert(0, local)
        
        print("After for:", stack)
        
        print("Before clean:", stack)

        for item in stack:
            print("Cleaning:", item)
            s = sum(item)
            print("Sum is:", s)
            if s == n:
                local = copy(item)
                answers.append(local)
                mark_to_delete.append(item)
            if s > n:
                mark_to_delete.append(item)
        # NOTE: In for-in state no changes could be made into the iterator itself.

        for remove_item in mark_to_delete:
            stack.remove(remove_item)

        mark_to_delete = []
    
        print("After clean:", stack)
    
    return answers


result = ways_to_traverse_a_stair(n, steps)

print("Result =", result)
print("Count =", len(result))