module URI
  class << self

    def parse_with_safety(uri)
      parse_without_safety uri.gsub('|', '+')
    end

    alias parse_without_safety parse
    alias parse parse_with_safety
  end
end