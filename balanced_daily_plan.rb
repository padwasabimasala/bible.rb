require_relative 'bible'

require "test/unit"
require 'pp'

class BibleStats
  def book_count
    cnt = 0
    bible.each {|book| cnt += 1}
    cnt
  end

  def chapter_count(book=nil)
    cnt = 0
    return bible[book].size - 1 if book
    bible.each do |book,chapters|
      cnt += chapters.size - 1
    end
    cnt
  end

  def verse_count(book=nil)
    cnt = 0
    if book
      bible[book].each do |chapter|
        next unless chapter
        cnt += chapter.size - 1
      end
      return cnt
    end

    bible.each do |book,chapters|
      chapters.each do |chapter|
        next unless chapter
        cnt += chapter.size - 1
      end
    end
    cnt
  end
end

class TestBibleStats < Test::Unit::TestCase
  def test_book_count
    assert_equal(66, BibleStats.new().book_count)
  end

  def test_chapter_count_for_book
    assert_equal(5, BibleStats.new().chapter_count(:John1))
  end

  def test_chapter_count
    assert_equal(1189, BibleStats.new().chapter_count())
  end

  def test_verse_count_for_book
    assert_equal(1071, BibleStats.new().verse_count(:Matthew))
    assert_equal(25, BibleStats.new().verse_count(:Jude))
  end

  def test_verse_count
    assert_equal(31102, BibleStats.new().verse_count())
  end
end

bible.each do |book,chapters|
  print book.to_s + "\n"
  chapters.each_with_index do |verses, chnum|
    next if chnum == 0
    print "chapter: %s\n" % chnum
    verses.each_with_index do |verse, vnum|
      next if vnum == 0
      print "verse: " + vnum.to_s + "\n"
      print verse + "\n"
    end
  end
  break
end
