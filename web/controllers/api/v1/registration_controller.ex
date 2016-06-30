defmodule StandardElixirReact.RegistrationController  do
  use StandardElixirReact.Web, :controller

  alias StandardElixirReact.{Repo, User}

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :token)

        conn
        |> put_status(:created)
        |> render(StandardElixirReact.SessionView, "show.json", jwt: jwt, user: user)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(StandardElixirReact.RegistrationView, "error.json", changeset: changeset)
    end
  end
end
