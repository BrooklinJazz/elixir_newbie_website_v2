defmodule ElixirNewbie.AcademyContent.LessonTest do
  use ExUnit.Case
  doctest ElixirNewbie.AcademyContent.Lesson
  alias ElixirNewbie.AcademyContent.Lesson

  @valid_file_name "big/long/path/to/reading/file_name.md"

  describe "format_body" do
    test "latex expressions" do
      source = """
      $n^2$
      """

      assert Lesson.format_body(source, @valid_file_name) =~ ~r/\<latex-js\>(.|\n)+<\/latex-js\>/
    end

    test "detail sections" do
      source = """
      <details>
      ```elixir\nactual = 12 total = 42 actual / total ```
      </details>
      """

      assert Lesson.format_body(source, @valid_file_name) == """
             <details>
             #{Makeup.highlight("actual = 12 total = 42 actual / total ")}
             </details>
             """
    end

    test "remove .livemd extensions" do
      source = """
      ../file_name.livemd
      ../file_name.livemd
      """

      assert Lesson.format_body(source, @valid_file_name) == """
             ../file_name
             ../file_name
             """
    end

    test "your turn sections" do
      source = """
      <pre><code class="makeup elixir"></code></pre>
      <pre><code class="makeup elixir"></code></pre>
      """

      url =
        "https://livebook.dev/run?url=https://github.com/DockYard-Academy/curriculum/blob/main/reading/file_name.livemd"

      assert Lesson.format_body(source, @valid_file_name) ==
               """
               <a href=\"#{url}\" class=\"your_turn\">Use Livebook to enter solutions.</a>
               <a href=\"#{url}\" class=\"your_turn\">Use Livebook to enter solutions.</a>
               """
    end
  end
end
