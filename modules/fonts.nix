{pkgs, ...}:
{
  fonts.packages = with pkgs; [
#	(nerdfonts.override { fonts = ["CascadiaCode" "Iosevka" ]; })
  nerd-fonts.caskaydia-mono
  nerd-fonts.iosevka
  ];
}
