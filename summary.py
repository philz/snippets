#!/usr/bin/env python
import sys
import math

class Summary(object):
  def __init__(self):
    # Online algorithm from http://en.wikipedia.org/wiki/Algorithms_for_calculating_variance 
    self.count = 0
    self.mean = 0.0
    self.m2 = 0.0
    self.value_histogram = dict()

  def add(self, k):
    try:
      x = float(k)
      self.count += 1
      delta = x - self.mean
      self.mean = self.mean + delta / self.count
      self.m2 = self.m2 + delta * (x - self.mean)
    except ValueError:
      cur = self.value_histogram.get(k)
      if cur is None:
        cur = 0
      self.value_histogram[k] = cur + 1

  def pr(self):
    if self.count > 0:
      print "Count: ", self.count
      print "Average: ", self.mean
      if self.count > 2:
        print "Pop Std Dev: ", math.sqrt(self.m2 / self.count)
        print "Sample Std Dev: ", math.sqrt(self.m2 / (self.count - 1))
    if len(self.value_histogram) > 0:
      for k, v in self.value_histogram.iteritems():
        print k, v

def main():
  summaries = dict()
  for line in sys.stdin:
    fields = line.split(" ")
    for i, f in enumerate(fields):
      f = f.strip()
      x = summaries.get(i)
      if x is None:
        x = Summary()
        summaries[i] = x
      x.add(f)
  for f in sorted(summaries.keys()):
    print "Column ", f, ":"
    summaries[f].pr()


if __name__ == "__main__":
  main()
