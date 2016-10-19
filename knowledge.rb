def attribute(name, &block)

  name , arg = name.first if name.is_a?(Hash)

  define_method(name) do
    instance_variable_set("@#{name}", block ? instance_eval(&block) : arg) unless instance_variable_get("@#{name}")
    instance_variable_get("@#{name}")
  end

  define_method(name + '=') { |value| instance_variable_set("@#{name}", value)}
  define_method(name + '?') { instance_variable_get("@#{name}")}
end