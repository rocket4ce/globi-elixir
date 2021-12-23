defmodule GlobiWeb.PageController do
  use GlobiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
