defmodule HackerNewsApi.Model.Story do
  defstruct id: "", by: "", descendants: 0, kids: [], score: 0, time: 0, title: "", type: "story", url: ""

  @type t :: %__MODULE__{
          id: integer(),
          by: String.t(),
          descendants: integer(),
          kids: list(integer()),
          score: integer(),
          time: DateTime.t(),
          type: String.t(),
          url: String.t()
        }

  def from_map(map) do
    %__MODULE__{Util.to_struct(__MODULE__, map) | time: DateTime.from_unix!(map["time"])}
  end
end

# "by" => "cs702",
#    "descendants" => 27,
#    "id" => 18912164,
#    "kids" => [18912734, 18912444, 18912414, 18912759, 18912686, 18912610,
#     18912725, 18912635, 18912602, 18912712, 18912348],
#    "score" => 166,
#    "time" => 1547568674,
#    "title" => "With 86% Drop, California’s Monarch Butterfly Population Hits Record Low",
#    "type" => "story",
#    "url" => "https://www.nytimes.com/2019/01/09/science/monarch-butterfly-california.html"
