# -*- coding: utf-8 -*-
module HoshiMi
  class MorrisGraph
    def initialize
      @target = 'graph'
      @data = []
      @label = 'Series A'
    end
    attr_accessor :target, :data, :label

    def to_js
      javascript = <<END
Morris.Line({
  element: '#{@target}',
  data: [
    #{data_to_json}
  ],
  xkey: 'x',
  ykeys: ['y'],
  labels: ['#{@label}']
});
END
      javascript
    end

    private
    def data_to_json
      json = ''
      data.each_with_index do |point, i|
        json << "{x:'#{point[:x]}',y:#{point[:y]}}"
        json << ',' unless i == data.length - 1
        json << "\n"
      end
      json
    end
  end
end
