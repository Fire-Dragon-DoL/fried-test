require "test_helper"
require "fried/test/telemetry"

class TelemetryTest < Minitest::Spec
  Telemetry = Fried::Test::Telemetry

  def setup
    @telemetry = Class.new do
      include Telemetry

      def call(args)
        record :call, args
      end
    end
  end

  def build_telemetry
    @telemetry.new
  end

  it "is recorded when it records a signal" do
    telemetry = build_telemetry

    telemetry.record :call

    assert telemetry.recorded? :call
  end

  it "is recorded when it records multiple signals" do
    telemetry = build_telemetry

    telemetry.record :call
    telemetry.record :foo

    assert telemetry.recorded? :call
  end

  it "is recorded with specified arguments" do
    telemetry = build_telemetry

    telemetry.record :call, [123]

    assert telemetry.recorded_with? :call, [123]
  end

  it "doesn't find recorded if doesn't match arguments" do
    telemetry = build_telemetry

    telemetry.record :call, [123]

    refute telemetry.recorded_with? :call, [456]
  end

  it "is recorded specified amount of times" do
    telemetry = build_telemetry

    telemetry.record :call, [123]
    telemetry.record :call

    assert telemetry.recorded_times? :call, 2
  end
end
