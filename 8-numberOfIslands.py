"""
Count the number of ilands in a 2 dimentional matrix

A iland is defined to a portio

example:
[
    [1,1,1,1,1,1,1,1,1],
    [1,1,1,1,1,1,1,1,1],
    [1,1,0,0,0,0,0,1,1],
    [1,1,0,0,0,0,0,1,1],
    [1,1,0,0,0,0,0,1,1],
    [1,1,0,0,0,0,0,0,0],
]

result should be 1
"""

from operator import index


island_map = [
    [0,1,1,1,1,1,1,1,1],
    [1,0,1,1,1,1,1,1,1],
    [1,1,0,0,0,0,0,1,1],
    [1,1,0,0,0,0,0,1,1],
    [1,1,0,0,1,1,0,1,1],
    [1,1,0,0,1,1,0,0,0]
]

# result shoud be 1

def countHowManyIslands(matrix_map):
    mutable_matrix_map = matrix_map
    count = 0

    def depthFirstSearch(i, j):
        
        # Index out of bounds
        if i < 0 or i > len(mutable_matrix_map) - 1:
            return
        if j < 0 or j > len(mutable_matrix_map[i]) - 1:
            return

        # Found the limit of the island, return
        if mutable_matrix_map[i][j] == 0:
            return

        # Found land, change to 0 to not count twice
        if mutable_matrix_map[i][j] == 1:
            mutable_matrix_map[i][j] = 0

        # Search all sides
        depthFirstSearch(i + 1, j)
        depthFirstSearch(i - 1, j)
        depthFirstSearch(i, j + 1)
        depthFirstSearch(i, j - 1)

        # Return 1 to count as 1 island
        return 1

    # BEFORE
    for i in range(0, len(mutable_matrix_map) - 1):
        for j in range(0, len(mutable_matrix_map[i]) - 1):
            print(mutable_matrix_map[i][j], end="")
        print("")

    # PROCESS
    for i in range(0, len(mutable_matrix_map) - 1):
        for j in range(0, len(mutable_matrix_map[i]) - 1):
            if mutable_matrix_map[i][j] == 1:
                count += depthFirstSearch(i, j)

    # AFTER
    for i in range(0, len(mutable_matrix_map) - 1):
        for j in range(0, len(mutable_matrix_map[i]) - 1):
            print(mutable_matrix_map[i][j], end="")
        print("")

    print("Number of islands = ", count)


        


countHowManyIslands(island_map)