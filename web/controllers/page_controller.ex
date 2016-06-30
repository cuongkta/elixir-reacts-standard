defmodule StandardElixirReact.PageController do
  use StandardElixirReact.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
