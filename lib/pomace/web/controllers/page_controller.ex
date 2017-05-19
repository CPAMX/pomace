defmodule Pomace.Web.PageController do
  use Pomace.Web, :controller

  plug :put_layout, "application.html"

  def index(conn, _params) do
    render conn, "index.html"
  end
end
