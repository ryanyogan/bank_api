defmodule BankAPI.Accounts.AccountsTest do
  use BankAPI.Test.InMemoryEventStoreCase

  alias BankAPI.Accounts
  alias BankAPI.Accounts.Projections.Account

  test "opens account with valid command" do
    params = %{
      "initial_balance" => 1_000
    }

    assert {:ok, %Account{current_balance: 1_000}} = Accounts.open_account(params)
  end

  test "does not dispatch command with invalid payload" do
    params = %{
      "invalid_balance" => 1_000
    }

    assert {:error, :bad_command} = Accounts.open_account(params)
  end

  test "returns validation errors from dispatch" do
    assert {
             :error,
             :command_validation_failure,
             _cmd,
             ["Expected INTEGER, got STRING \"1_000\", at initial_balance"]
           } =
             %{"initial_balance" => "1_000"}
             |> Accounts.open_account()

    assert {
             :error,
             :command_validation_failure,
             _cmd,
             ["Argument must be bigger than zero"]
           } =
             %{"initial_balance" => -10}
             |> Accounts.open_account()

    assert {
             :error,
             :command_validation_failure,
             _cmd,
             ["Argument must be bigger than zero"]
           } =
             %{"initial_balance" => 0}
             |> Accounts.open_account()
  end
end
