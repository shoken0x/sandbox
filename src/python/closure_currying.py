a = []

def test():
  for x in range(0,10):
    def test2(val):
      def test3():
        print val
      return test3

    a.append(test2(x))

test()
for x in a:
  x()
