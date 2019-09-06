defmodule BankAPIWeb.Router do
  use BankAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BankAPIWeb do
    pipe_through :api

    resources "/accounts", AccountController, only: [:create, :delete, :show]

    post "/accounts/:id/deposit", AccountController, only: :deposit
    post "/accounts/:id/withdraw", AccountController, only: :withdraw
    post "/accounts/:id/transfer", AccountController, only: :transfer
  end
end
