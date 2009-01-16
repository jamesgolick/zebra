require 'test/unit'
require 'context'
require 'matchy'
require 'parse_tree'
require 'parse_tree_extensions'
require 'ruby2ruby'

module Zebra
  def expect(&block)
    block_translation = block.to_ruby.gsub /proc \{ (.+?) \}/, '\1'
    test_name         = ["test:", context_name, "expect", block_translation]
    test_name.reject! { |s| s == "" }

    define_method(test_name.join(' '), &block)
  end
end

Test::Unit::TestCase.send(:extend, Zebra)
Object.send(:alias_method, :to, :should)
Object.send(:alias_method, :not_to, :should_not)
