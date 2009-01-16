require File.dirname(__FILE__) + '/test_helper'

class MatchyTest < Test::Unit::TestCase
  it "should alias should to .to" do
    assert_equal Object.method(:should), Object.method(:to)
  end
end

