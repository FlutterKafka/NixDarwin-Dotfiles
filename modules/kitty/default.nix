{
  programs.kitty = {
    enable = true;
    themeFile = "Rose-Pine";
    font = {
      name = "JetBrains Mono";
      size = 14;
    };
    settings = {
      shell = "/etc/profiles/per-user/kafka/bin/fish";
      editor = "/etc/profiles/per-user/kafka/bin/hx";
      cursor_shape = "beam";
      cursor = "#ffffff";
      confirm_os_window_close = 0;
      allow_remote_control = false;
      listen_on = "none";
      macos_titlebar_color = "system";
      macos_option_as_alt = true;
      macos_hide_from_tasks = false;
      macos_quit_when_last_window_closed = true;
      macos_traditional_fullscreen = false;
      macos_show_window_title_in = "all";
      macos_custom_beam_cursor = false;
      linux_display_server = "wayland";
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+0" = "change_font_size all 0";
    };
  };
}
