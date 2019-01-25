defmodule HackerNewsApi do
  require Logger
  alias HackerNewsApi.Model.Story

  @endpoint "https://hacker-news.firebaseio.com/v0/"

  @spec fetch_stories!(:topstories | :newstories) :: list(integer())
  def fetch_stories!(story_type) do
    response = HTTPoison.get("#{@endpoint}#{Atom.to_string(story_type)}.json", [], hackney: [pool: :default])

    case response do
      {:ok, %{status_code: 200, body: body}} -> Jason.decode!(body)
      {_, %{status_code: _, body: body}} -> raise body
    end
  end

  @spec fetch_story(integer()) :: {:error, any()} | {:ok, %Story{}}
  def fetch_story(id) do
    Logger.info("Fetching story #{id} self #{inspect(self())}")
    response = HTTPoison.get("#{@endpoint}item/#{id}.json", [], hackney: [pool: :default])
    Logger.info("Fetching story #{id} completed #{inspect(self())}")

    case response do
      {:ok, %{status_code: 200, body: body}} -> {:ok, Story.from_map(Jason.decode!(body))}
      {_, %{status_code: _, body: body}} -> {:error, body}
    end
  end
end
