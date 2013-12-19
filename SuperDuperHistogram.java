package com.cloudera.interview;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Keeps track of a histogram.  May be used by multiple
 * threads.
 *
 * Note: this compiles just fine.
 *
 * If you're unfamiliar with any of the classes used here,
 * just ask.
 */
public class SuperDuperHistogram {
  /** Map key->count */
  private Map counts = new HashMap();

  /** Increment the bucket corresponding to 'key'. */
  public void increment(Object key) {
    AtomicInteger count = (AtomicInteger)counts.get(key);
    if (count == null) {
      counts.put(key, new AtomicInteger(1));
    } else {
      count.incrementAndGet();
    }
  }

  /** Retrieves counts */
  public Map getCounts() {
    return counts;
  }
}
