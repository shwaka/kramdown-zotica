# coding: utf-8
require 'kramdown/converter'
require 'zotica'

module Kramdown::Converter
  module MathEngine
    module Zotica
      def self.convert(source, mode)
        # TODO: mode に応じて出力を変える
        parser = ZoticaParser.new(source)
        parser.simple_math_macro_name = "m"
        parser.raw_macro_name = "raw"
        parser.resource_macro_name = "math-resource"
        parser.only_math = true
        parser.load_font(nil)
        document = parser.parse
        converter = ZenithalConverter.simple_html(document)
        return converter.convert
      end

      def self.call(converter, el, opts)
        mode = el.options[:category]  # :span or :block
        return self.convert(el.value, mode)
      end

    end

  end

  add_math_engine(:zotica, MathEngine::Zotica)

end
