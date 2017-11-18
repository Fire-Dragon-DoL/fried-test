require "time"
require "fried/core"

module Fried::Test
  module Telemetry
    Record = Struct.new(:signal, :time, :data)

    def record(signal, data = nil)
      @__telemetry_records__ ||= []
      time = Time.now.utc
      @__telemetry_records__ << Record.new(signal, time, data)
    end

    def recorded?(signal)
      @__telemetry_records__.any? do |recorded|
        recorded.signal == signal
      end
    end

    def recorded_with?(signal, data)
      @__telemetry_records__.any? do |recorded|
        recorded.signal == signal &&
        recorded.data == data
      end
    end

    def recorded_times?(signal, amount)
      @__telemetry_records__.count do |recorded|
        recorded.signal == signal
      end
    end
  end
end
