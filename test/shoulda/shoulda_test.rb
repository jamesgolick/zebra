require File.dirname(__FILE__) + '/../test_helper'
require 'shoulda'

class ShouldaTest < Test::Unit::TestCase
  def setup
    Zebra.stubs(:shoulda?).returns(true)
  end

  should "create a test" do
    self.class.expect { 2.to == 1 }
    assert self.respond_to?("test: Shoulda expect (2.to == 1)"), self.class.instance_methods.grep(/test/).inspect
  end

  context "in a context" do
    expect { true }
    should "grab the name of the context" do
      assert self.respond_to?("test: in a context expect true"), self.class.instance_methods.grep(/test/).inspect
    end
  end
end
