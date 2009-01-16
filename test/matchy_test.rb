require File.dirname(__FILE__) + '/test_helper'

class MatchyTest < Test::Unit::TestCase
  it "should alias should to .to" do
    assert_equal Object.method(:should), Object.method(:to)
  end

  it "should alias should_not to .not_to" do
    assert_equal Object.method(:should_not), Object.method(:not_to)
  end
end

