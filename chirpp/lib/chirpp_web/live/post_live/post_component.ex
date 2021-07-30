defmodule ChirppWeb.PostLive.PostComponent do
    use ChirppWeb, :live_component

    def render(assigns) do
        ~L"""
      <div id="post-<%= @post.id %>" class="post">
        <div class="row">
          <div class="column column-10">
            <div class="post-avatar">
              <img src="//www.jquery-az.com/html/images/banana.jpg" alt="<%= @post.username %>">
            </div>
          </div>
          <div class="column column-90 post-body">
            <span class="user_name">@<%= @post.username %></span>
            <br>
            <p><%= @post.body %></p>
            <div class="column">
              <%= for url <- @post.photo_urls do %>
                <img src="<%= url %>" height="150"/>
              <% end %>
            </div>
          </div>
        </div>

        <div class="row actions_bar">
          <div class="column column-33 text-center">
            <a href="#" phx-click="repost" phx-target="<%= @myself %>">
              <span>🌟</span> <%= @post.reposts_count %>
            </a>
          </div>
          <div class="column column-33 text-center">
            <a href="#" phx-click="like" phx-target="<%= @myself %>">
              <span>💟</span> <%= @post.likes_count %>
            </a>
          </div>
          <div class="column column-33 text-center">
            <a href="#" phx-click="repost" phx-target="<%= @myself %>">
              <span>🔄</span> <%= 0 %>
            </a>
          </div>
          <div class="column column-33 text-center">
            <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
              <span>✏️</span>
            <% end %>
            <span>&nbsp;&nbsp;</span>
            <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Você tem certeza?"] do %>
              <span>❌</span>
            <% end %>
          </div>
        </div>
      </div>
    """
    end

    def handle_event("like", _, socket) do
      Chirpp.Timeline.inc_likes(socket.assigns.post)
      {:noreply, socket}
    end
  
    def handle_event("repost", _, socket) do
      Chirpp.Timeline.inc_reposts(socket.assigns.post)
      {:noreply, socket}
    end

end