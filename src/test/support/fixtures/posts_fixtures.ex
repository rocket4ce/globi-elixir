defmodule Globi.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Globi.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Globi.Posts.create_post()

    post
  end
end
