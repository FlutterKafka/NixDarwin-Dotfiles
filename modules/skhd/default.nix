{
  services.skhd = {
    enable = true;
    skhdConfig = "
      cmd - space : yabai -m window --toggle float --grid 4:4:1:1:2:2
      
      cmd + shift - left  : yabai -m window --warp west
      cmd + shift - right : yabai -m window --warp east
      cmd + shift - up    : yabai -m window --warp north
      cmd + shift - down  : yabai -m window --warp south

      cmd - left  : yabai -m window --focus west
      cmd - right : yabai -m window --focus east
      cmd - up    : yabai -m window --focus north
      cmd - down  : yabai -m window --focus south

      cmd - z : yabai -m window --toggle zoom-fullscreen
      cmd - x : yabai -m window --toggle native-fullscreen

      rcmd - t : /etc/profiles/per-user/kafka/bin/kitty --single-instance -d ~
      rcmd - s : open -na Signal
      rcmd - l : open -na KeePassXC
      rcmd - p : ~/rofi-beats
    ";
  };
}
