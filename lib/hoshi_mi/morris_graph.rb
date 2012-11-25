# -*- coding: utf-8 -*-
module HoshiMi
  class MorrisGraph
    def initialize
      @target = 'graph'
      @data = []
      @labels = [ 'Series A' ]
      @colors = []
    end
    attr_accessor :target, :data, :labels, :colors

    def to_js
      javascript = <<END
Morris.Line({
  element: '#{@target}',
  data: #{data_to_json},
  xkey: 'x',
  ykeys: #{data_yaxis},
  labels: #{@labels.to_json},
  lineColors: #{@colors.to_json}
});
END
      javascript
    end

    private
    def data_to_json
      data.to_json
    end

    def data_yaxis
      xs = data.map{|item| item.keys }.
        flatten.
        uniq.
        reject{|item| item == :x }.
        to_json
    end
  end
end
