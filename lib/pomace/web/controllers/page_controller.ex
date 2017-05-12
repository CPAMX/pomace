defmodule Pomace.Web.PageController do
  use Pomace.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
