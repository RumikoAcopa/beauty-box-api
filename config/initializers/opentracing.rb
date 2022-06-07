require 'opentracing'
require 'datadog/tracing'
require 'datadog/opentracer'

# Activate the Datadog tracer for OpenTracing
OpenTracing.global_tracer = Datadog::OpenTracer::Tracer.new

Datadog.configure do |c|
  c.tracing.instrument :integration_name, options
  
end