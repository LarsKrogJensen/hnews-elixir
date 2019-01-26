defmodule HackerNewsService do
  alias HackerNewsApi.Model.Story

  @spec get_stories(:topstories | :newstories) :: [Story.t()]
  def get_stories(story_type \\ :topstories) do
    HackerNewsApi.fetch_stories!(story_type)
    |> Enum.map(&get_story_async/1)
    |> Enum.map(&Task.await/1)
    |> Enum.filter(&(elem(&1, 0) == :ok))
    |> Enum.map(&elem(&1, 1))
  end

  @spec get_story_async(integer()) :: Task.t()
  def get_story_async(id) do
    Task.async(fn -> get_story(id) end)
  end

  @spec get_story(integer()) :: {:error, any()} | {:ok, %Story{}}
  defp get_story(id) do
    case HackerNewsCache.get(id) do
      nil -> HackerNewsApi.fetch_story(id) |> store(id)
      val -> {:ok, val}
    end
  end

  @spec store({:error, any()} | {:ok, %Story{}}, integer()) :: {:error, any()} | {:ok, %Story{}}
  defp store(result, id) do
    case result do
      {:ok, val} -> HackerNewsCache.set(id, val)
    end
    result
  end
end
