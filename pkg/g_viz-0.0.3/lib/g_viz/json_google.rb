class Date
  def to_json(*a)
    "new Date(#{year}, #{month - 1}, #{day})"
  end
end

class DateTime
  def to_json(*a)
    "new Date(#{year}, #{month - 1}, #{day}, #{hour}, #{min}, #{sec})"
  end
end