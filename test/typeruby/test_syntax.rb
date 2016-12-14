# frozen_string_literal: true
require "test/unit"

class TestTypeRubySyntax < Test::Unit::TestCase
  BINDING = module Sandbox
    binding
  end

  def assert_parses(code)
    BINDING.eval code
  end

  def test_return_signatures
    assert_parses <<-RUBY
      def foo => String; end

      def foo => String
      end

      def foo() => String; end

      def foo() => String
      end

      def self.foo => String; end
    RUBY
  end

  def test_arg_signatures
    assert_parses <<-RUBY
      def foo(String s) end

      def foo(String a, String b) end
    RUBY
  end
end
