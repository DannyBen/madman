module RSpecMixin
  def with_env(key, value)
    old_value = ENV[key]
    ENV[key] = value
    yield
    ENV[key] = old_value
  end

  def without_env(key, &block)
    with_env(key, nil, &block)
  end
end