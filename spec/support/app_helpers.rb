module AppHelpers
  def normalized_output(string_io)
    string_io.string.gsub(/\[[0-9;]*m/, "")
  end
end
