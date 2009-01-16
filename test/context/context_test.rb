require File.dirname(__FILE__) + '/../test_helper'
require 'context'

class ContextTest < Test::Unit::TestCase
  def setup
    Zebra.stubs(:shoulda?).returns(false)
  end

  it "should create a test" do
    self.class.expect { 2.to == 1 }
    assert self.respond_to?("test: expect (2.to == 1)")
  end

  context "in a context" do
    it "should grab the name of the context" do
      self.class.expect { 2.to == 1 }
      assert self.respond_to?("test: in a context expect (2.to == 1)"), self.class.instance_methods.grep(/test/).inspect
    end
  end
end

