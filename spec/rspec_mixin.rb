module RSpecMixin
  def with_env(key, value)
    old_value = ENV[key]
    ENV[key] = value
    yield
    ENV[key] = old_value
  end

  def without_env(key, &)
    with_env(key, nil, &)
  end
end
