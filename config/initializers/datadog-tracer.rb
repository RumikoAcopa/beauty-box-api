require 'ddtrace'
# config/initializers/datadog-tracer.rb
Datadog.configure do |c|
  c.env = 'practice'
  c.service = 'BeautyBox'
  c.tracing.sampling.default_rate = 1.0
  c.profiling.enabled = true
end