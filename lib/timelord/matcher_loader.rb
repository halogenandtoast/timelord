class MatcherLoader
  def load_all
    matchers = files.map { |file| get_class(file) }
    sort_matchers(matchers) + [NoMatcher]
  end

  private

  def files
    Dir.glob(File.join(File.dirname(__FILE__), "matchers", "**"))
  end

  def get_class(file)
    require file
    Object.const_get(get_class_name(file))
  end

  def get_class_name(file)
    File.basename(file, ".rb").
      gsub(/(_[a-z])/) { |a| a[1..-1].upcase }.
      gsub(/^[a-z]/) { |a| a.upcase }
  end

  def sort_matchers(matchers)
    matchers.sort { |a, b| b::REGEX.to_s.length <=> a::REGEX.to_s.length }
  end
end
