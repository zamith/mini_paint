defmodule MiniPaintWeb.PageController do
  use MiniPaintWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
