require 'test/unit'
require 'matchy'
require 'parse_tree'
require 'parse_tree_extensions'
require 'ruby2ruby'
require File.dirname(__FILE__) + '/zebra/shoulda'

module Zebra
  class << self
    def shoulda?
      defined?(Thoughtbot)
    end
  end

  def expect(&block)
    Zebra.shoulda? ? expect_shoulda(&block) : expect_context(&block)
  end

  protected
    def expect_shoulda(&block)
      Thoughtbot::Shoulda::Context.send(:include, Zebra::Shoulda) unless Thoughtbot::Shoulda::Context.include?(Zebra::Shoulda)

      if Thoughtbot::Shoulda.current_context
        Thoughtbot::Shoulda.current_context.expect(&block)
      else
        context_name = self.name.gsub(/Test/, "")
        context      = Thoughtbot::Shoulda::Context.new(context_name, self) do
          expect(&block)
        end
        context.build
      end
    end

    def expect_context(&block)
      define_method(expect_test_name(context_name, &block), &block)
    end

    def expect_test_name(context_name, &block)
      block_translation = block.to_ruby.gsub /proc \{ (.+?) \}/, '\1'
      test_name         = ["test:", context_name, "expect", block_translation]
      test_name.reject! { |s| s == "" }

      test_name.join(' ')
    end
end

Test::Unit::TestCase.send(:extend, Zebra)
Object.send(:alias_method, :to, :should)
Object.send(:alias_method, :not_to, :should_not)
