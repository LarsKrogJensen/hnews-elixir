defmodule HackerNewsService do

  @spec get_stories(:topstories | :newstories) :: [HackerNewsApi.Model.Story.t()]
  def get_stories(story_type  \\ :topstories) do
    HackerNewsApi.fetch_stories!(story_type)
    |> Enum.map(fn(id) -> Task.async(fn -> HackerNewsApi.fetch_story(id) end) end)
    |> Enum.map(&Task.await/1)
    |> Enum.filter(&elem(&1, 0) == :ok)
    |> Enum.map(&elem(&1, 1))
  end

end
