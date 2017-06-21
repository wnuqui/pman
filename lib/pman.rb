require "pman/version"

module Pman
  class << self
    def generate(length=8)
      s = 2                       # length of special chars
      a = n = (length - s) / 2    # length of alpha and numeric chars

      # add 1 to alpha length since length is odd
      a += 1 if length % 2 == 1

      str = ('a'..'z').to_a.shuffle[0, a].join
      str += (1..9).to_a.shuffle[0, n].join
      str += ['-', '_', '!', '+', '*'].shuffle[0, 2].join

      str.split('').shuffle[0, length].join
    end
  end
end
