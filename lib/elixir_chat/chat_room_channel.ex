defmodule ElixirChatWeb.ChatRoomChannel do
  use Phoenix.Channel

  def join("ChatRoom:default", _message, socket) do
    {:ok, socket}
  end

  def handle_in("incoming_message", %{"body" => body}, socket) do
    broadcast!(socket, "incoming_message", %{body: body})
    {:noreply, socket}
  end

end