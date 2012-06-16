# Defines the global namespace function, used to construct namespace objects.

window.namespace = ( ns ) ->
  root = window
  make_namespace( root, ns.split('.') )

make_namespace = ( root, ns_components ) ->
  return if ns_components.length == 0
  component = ns_components[0]
  root[component] ?= {}
  make_namespace( root[component], ns_components[1..-1] )
