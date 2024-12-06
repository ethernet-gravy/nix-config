{pkgs, ...}:
{
  fonts.packages = with pkgs; [
	#(nerd-fonts.override { fonts = ["CascadiaCode" "Iosevka" ]; })
    cascadia-code
    nerd-fonts.iosevka
  ];
}
