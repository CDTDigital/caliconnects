module ApplicationHelper
  def to_human_readable(string)
    string.to_s.gsub("_", " ").titleize
  end
end
