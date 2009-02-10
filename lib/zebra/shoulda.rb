module Zebra
  module ShouldaSupport
    def self.included(klass)
      klass.class_eval do
        attr_accessor :expects

        alias_method :build_without_expects, :build 
        alias_method :build, :build_with_expects
      end
    end

    def expect(&block)
      self.expects ||= []
      self.expects << block
    end

    def create_test_from_expect(&block)
      test_name = expect_test_name(full_name, &block)

      if test_unit_class.instance_methods.include?(test_name.to_s)
        warn "  * WARNING: '#{test_name}' is already defined"
      end

      context = self
      test_unit_class.send(:define_method, test_name) do
        begin
          context.run_parent_setup_blocks(self)
          context.run_current_setup_blocks(self)
          block.bind(self).call
        ensure
          context.run_all_teardown_blocks(self)
        end
      end
    end

    def build_with_expects
      (expects || []).each { |e| create_test_from_expect(&e) }
      build_without_expects
    end
  end
end

