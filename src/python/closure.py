a = []

def test():
  for x in range(0,10):
    def test2():
      print x
    a.append(test2)

test()
for x in a:
  x()
