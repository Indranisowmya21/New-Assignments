def optimalPoint(magic,dist):
   total=0
   for i in range(len(magic)):
      total += magic[i]-dist[i]
   if total < 0:
       return -1
   start = 0
   end = 1
   rem=magic[start] - dist[start]
   while end != start or rem < 0:
       while rem < 0 and start != end:
           rem -= magic[start] - dist[start]
           start = (start + 1)% len(magic)
           if start == 0:
             return -1
       rem += magic[end] - dist[end]
       end=(end + 1) % len(magic)
   return start