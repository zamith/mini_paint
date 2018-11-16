defmodule MiniPaint.Factory do
  use ExMachina.Ecto, repo: MiniPaint.Repo

  alias MiniPaint.Accounts.User

  alias MiniPaint.Recipes.{
    Recipe,
    Game
  }

  def user_factory do
    %User{
      email: "test@minipaint.com",
      password_hash: Comeonin.Bcrypt.hashpwsalt("secret"),
      username: "test-user"
    }
  end

  def recipe_factory do
    %Recipe{
      character_name: "Cragheart",
      game: build(:game),
      author: build(:user)
    }
  end

  def game_factory do
    %Game{
      name: "Gloomhaven"
    }
  end
end
