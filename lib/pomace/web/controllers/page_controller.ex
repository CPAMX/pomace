defmodule Pomace.Web.PageController do
  use Pomace.Web, :controller

  def humn_size(size) do
    sizes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "XB", "SB", "DB"]
    index = Float.floor(:math.log(size) / :math.log(1024))
    new_size = Float.to_string(Float.round((size / :math.pow(1024, index)), 2) * 1)
    value = Enum.at(sizes, round(index))
    "#{new_size} #{value}"
  end

  defp bt_get_file_list(torrent = %{info: %{files: _}}) do
    torrent.info.files # todo
  end

  defp bt_get_file_list(torrent = %{info: %{length: _}}) do
     [%{name: torrent.info.name,
       size: humn_size(torrent.info.length),
       sizeb: torrent.info.length}]
  end

  defp bt_total_file_size(torrent = %{info: %{length: _}}), do: torrent.info.length
  defp bt_total_file_size(torrent = %{info: %{files: _}}) do
    Enum.reduce(torrent.info.files, 0, fn(%{"length" => length}, acc) ->
      length + acc
    end)
  end

  def index(conn, _params) do
    torrent = File.read!("priv/test.torrent")
    |> Bento.torrent!()

    IO.inspect bt_total_file_size(torrent)

    render conn, "index.html"
  end
end
