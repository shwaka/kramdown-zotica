# coding: utf-8
require 'kramdown/converter'
require 'zotica'

module Kramdown::Converter
  module MathEngine
    module Zotica
      def self.convert(source, mode)
        parser = ZoticaSingleParser.new(source)
        # parser.simple_math_macro_name = "m"
        # parser.raw_macro_name = "raw"
        # parser.resource_macro_name = "math-resource"
        # parser.only_math = true
        parser.load_font(nil)
        document = parser.run
        converter = ZenithalConverter.simple_html(document)
        math_html = converter.convert
        if mode == :span
          return math_html
        elsif mode == :block
          return %(<div class="math-block">\n#{math_html}\n</div>)
        else
          raise "Not implemented"
        end
      end

      def self.call(converter, el, opts)
        mode = el.options[:category]  # :span or :block
        return self.convert(el.value, mode)
      end

    end

  end

  add_math_engine(:zotica, MathEngine::Zotica)

end
