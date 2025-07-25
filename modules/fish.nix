{ lib, config, pkgs, ... }:

lib.mkMerge [
  {
    programs.fish.enable = true;

    programs.zoxide.enable = true;

    environment.systemPackages = [
      pkgs.fishPlugins.hydro
    ];

    programs.bash.interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]; then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  }

  (lib.mkIf (config.anchovy || config.croaker){
    programs.fish.interactiveShellInit = ''
      # Greetings with lovely Aussie accent
      function fish_greeting
        random choice "Hello mate!" "Hi there!" "G'day!" "Howdy!"
      end

      # Since this declared by `programs.fish.interactiveShellInit`,
      # there is no need to check if this is interactive like the doc.

      # Configure auto-attach/exit to your likings (default is off).
      set ZELLIJ_AUTO_ATTACH true
      set ZELLIJ_AUTO_EXIT true
      eval (zellij setup --generate-auto-start fish | string collect)

      set -U hydro_color_prompt blue
    '';
    environment.systemPackages = with pkgs; [
      zellij
    ];
  })

  (lib.mkIf config.marlin {
    programs.fish.interactiveShellInit = ''
      function fish_greeting
        random choice "Hello mate!" "Hi there!" "G'day!" "Howdy!"
      end

      set -U hydro_color_prompt blue
    '';
  })
]
