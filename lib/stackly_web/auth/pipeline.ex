defmodule StacklyWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :stackly

  plug(Guardian.Plug.VerifySession)
  plug(Guardian.Plug.VerifyHeader)
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
