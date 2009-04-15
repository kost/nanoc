require 'test/helper'

class Nanoc3::Helpers::FilteringTest < MiniTest::Unit::TestCase

  include Nanoc3::TestHelpers

  include Nanoc3::Helpers::Filtering

  def test_filter
    if_have 'rubypants' do
      # Build content to be evaluated
      content = "<p>Foo...</p>\n" +
                "<% filter :rubypants do %>\n" +
                " <p>Bar...</p>\n" +
                "<% end %>\n"

      # Evaluate content
      @item = {}
      result = ::ERB.new(content).result(binding)

      # Check
      assert_match('<p>Foo...</p>',     result)
      assert_match('<p>Bar&#8230;</p>', result)
    end
  end

end