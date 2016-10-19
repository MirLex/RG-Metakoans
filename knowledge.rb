def attribute(name)
    
  define_method(name) do
    instance_variable_set("@#{name}") unless instance_variable_get("@#{name}")
    instance_variable_get("@#{name}")
  end

  define_method(name + '=') { |value| instance_variable_set("@#{name}", value)}
  define_method(name + '?') { instance_variable_get("@#{name}")}
end