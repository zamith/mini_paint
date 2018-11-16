defmodule MiniPaintWeb.Router do
  use MiniPaintWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :maybe_authenticated do
    plug(MiniPaint.Auth.Plug)
  end

  pipeline :authenticated do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  scope "/", MiniPaintWeb do
    pipe_through(:browser)

    resources("/session", SessionController, only: [:create])
  end

  scope "/", MiniPaintWeb do
    pipe_through([:browser, :maybe_authenticated])

    get("/", PageController, :index)
    resources("/recipes", RecipeController, only: [:index, :show])
  end
end
