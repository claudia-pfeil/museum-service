RSpec::Matchers.define :have_title do |attribute|
  match do |model|
    model.has_content?(attribute)
  end
end

module Capybara
  class Session
    def has_section_header?(*args, &block)
      current_node.send(:has_section_header?, *args, &block)
    end
  end

  module Node
    module Matchers
      def has_section_header?(content)
        has_selector?(:section_header, content)
      end
    end
  end

  # module RSpecMatchers
  #   class HaveMatcher
  #     def have_section_header(locator, options={})
  #       ::Capybara::RSpecMatchers::HaveMatcher.new(:section_header, locator, options)
  #     end
  #   end
  # end
end


RSpec::Matchers.define :be_tabular_data do |attribute|
  match do |hash|
    hash.each_with_index do |(name, value), i|
      find(:record_name,  i + 1).text.should == name
      find(:record_value, i + 1).text.should == value
    end
  end

  #hash.each_with_index
  #
  #def match_table(hash)
  #  hash.each_with_index do |(name, value), i|
  #    find(:record_name,  i + 1).text.should == name
  #    find(:record_value, i + 1).text.should == value
  #  end
  #end

end
