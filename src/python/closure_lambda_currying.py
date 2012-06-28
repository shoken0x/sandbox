a = []

def test():
  for x in range(0,10):
    a.append((lambda val: lambda: val)(x))

test()
for x in a:
  print x()
