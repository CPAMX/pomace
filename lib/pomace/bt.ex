defmodule Pomace.Bt do
  def bt_get_file_list(torrent = %{info: %{files: _}}) do
    torrent.info.files # todo
  end

  def bt_get_file_list(torrent = %{info: %{length: _}}) do
     [%{name: torrent.info.name,
       size: Pomace.Helper.humn_size(torrent.info.length),
       sizeb: torrent.info.length}]
  end

  def bt_total_file_size(torrent = %{info: %{length: _}}), do: torrent.info.length
  def bt_total_file_size(torrent = %{info: %{files: _}}) do
    Enum.reduce(torrent.info.files, 0, fn(%{"length" => length}, acc) ->
      length + acc
    end)
  end
end