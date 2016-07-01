defmodule StandardElixirReact.UserChannel do
  use StandardElixirReact.Web, :channel

  def join("users:" <> user_id, _params, socket) do
    {:ok, socket}
  end
end