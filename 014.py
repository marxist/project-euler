# execution time measurement
import time

"""Partially brute-forced, works by recording already visited numbers."""
def to1(num, visited, most):
    # number was already visited, return existing count
    if most >= num and visited[num - 1] != 0:
        return visited[num - 1], visited
    # number wasn't visited before, calculate next number in sequence
    next_num = num
    if num % 2 == 0:
        next_num /= 2
        next_num = int(next_num)
    else:
        next_num *= 3
        next_num += 1
    # get length of sequence for next number
    length, visited = to1(next_num, visited, most)
    # increment length by 1 for current number
    length += 1
    # record the length if below or equal most
    if most >= num:
        visited[num - 1] = length
    return length, visited

def top_sequence(limit):
    # initialize list of lengths of sequences
    visited = [0 for num in range(0, limit)]
    # set number 1 to length of 1, the same goes for top number
    visited[0] = 1
    top = 1
    # get lengths of the rest of the numbers
    for num in range(0, int(limit / 3)):
        num = limit - num
        length, visited = to1(num, visited, limit)
        if length > visited[top - 1]:
            top = num
    return top

if __name__ == '__main__':
    num = 1000000
    start = time.time()
    top = top_sequence(num)
    span = time.time() - start
    print(top, span)
