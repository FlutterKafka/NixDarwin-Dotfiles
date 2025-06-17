{
  programs.starship = {
    enable = true;
    settings = {
      format = "[ ](purple)$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$character";
      character = {
        success_symbol = "[❯](bold purple)";
        error_symbol = "[❯](bold red)";
      };
      username = {
        style_user = "bold purple";
        style_root = "bold red";
        format = "[$user]($style)@";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname](bold blue)";
        trim_at = ".";
        disabled = false;
      };
      directory = {
        read_only = "§";
        truncation_length = 10;
        truncate_to_repo = true;
        style = "bold italic purple";
      };
      cmd_duration = {
        min_time = 3000;
        show_milliseconds = false;
        disabled = false;
        style = "bold italic blue";
      };
    };
  };
}
