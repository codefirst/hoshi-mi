# -*- coding: utf-8 -*-
module HoshiMi
  class Resolution
    include Comparable

    RESOLUTION = [:hour, :day, :month]

    TIME_FORMAT = {
      :hour => "%Y-%m-%d %H:00",
      :day  => "%Y-%m-%d",
      :month => "%Y-%m"
    }

    class << self
      def default
        self.new(ENV['HOSHI_MI_RESOLUTION'] || "day")
      end

      def hour
        self.new :hour
      end

      def day
        self.new :day
      end

      def month
        self.new :month
      end
    end

    attr_reader :resolution

    def initialize(resolution)
      @resolution = resolution.downcase.to_sym
      unless RESOLUTION.include?(@resolution)
        raise "invalid resolution: #{@resolution}"
      end
    end

    def beginning_of(time)
      case @resolution
      when :hour
        time.change :min => 0
      when :day
        time.beginning_of_day
      when :month
        time.beginning_of_month
      end
    end

    def end_of(time)
      case @resolution
      when :hour
        time.change :min => 59
      when :day
        time.end_of_day
      when :month
        time.end_of_month
      end
    end

    def format(time)
      time.strftime(TIME_FORMAT[@resolution])
    end

    def <=>(other)
      RESOLUTION.index(self.resolution) <=> RESOLUTION.index(other.resolution)
    end

    def ==(other)
      self.resolution == other.resolution
    end
  end
end
