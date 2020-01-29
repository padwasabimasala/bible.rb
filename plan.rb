#!/usr/bin/env ruby
$: << '.'
require 'bible'

"""
Prints daily Bible reading plan
in daily ranges of whole chapters
to complete the bible in the approximate number of days given
"""

def primitive(days=90)
  chaptot = 0
  bible.each {|book,chaps| chaptot += chaps.length-1}
  chapcnt = 0
  daycnt = 1
  daily = chaptot / days

  bible.each do |book,chapters|
    chapters.shift
    chapters.each_with_index  do |verses, idx|
      chapcnt +=1
      chap = idx+1
      if chapcnt == 1
        print book, " ", chap, " - "
      elsif chapcnt == daily
        chapcnt = 0
        daycnt += 1
        print book, " ", chap, "\n"
      end
    end
  end
end

primitive
