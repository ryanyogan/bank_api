defmodule BankAPI.Accounts.Events.DepositedIntoAccount do
  @derive [Jason.Encoder]

  defstruct [
    :transfer_uuid,
    :account_uuid,
    :new_current_balance
  ]
end
