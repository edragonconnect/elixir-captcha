defmodule Captcha do
  def get() do
    case System.cmd(Application.app_dir(:captcha, "priv/captcha"), []) do
      {data, 0} ->
        <<text::bytes-size(5), img::binary>> = data
        {:ok, text, img}

      error ->
        {:error, error}
    end
  end
end
