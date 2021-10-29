defmodule Theme01.APIFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Theme01.API` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Theme01.API.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2021-10-25 11:50:00]
      })
      |> Theme01.API.create_clock()

    clock
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-10-25 11:51:00],
        start: ~N[2021-10-25 11:51:00]
      })
      |> Theme01.API.create_working_time()

    working_time
  end
end
