defmodule Pomace.Helper do
  use Pomace.Web, :controller

  def humn_size(size) do
    sizes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "XB", "SB", "DB"]
    index = Float.floor(:math.log(size) / :math.log(1024))
    new_size = Float.to_string(Float.round((size / :math.pow(1024, index)), 2) * 1)
    value = Enum.at(sizes, round(index))
    "#{new_size} #{value}"
  end
end
