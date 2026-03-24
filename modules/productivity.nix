{pkgs, pkgs-stable, ...}:
{
    nixpkgs.overlays = [
        (final: prev: {
            ipe = prev.ipe.override {
                withTeXLive = false;
            };
         })

    ];
  environment.systemPackages = with pkgs; [
    tomat #pomodoro timer
    libreoffice
    zathura
    #styluslabs-write
    #xournalpp # write but better, gonna keep both, see which one i like more.
    rnote # okay so both suck. this one's better
    ipe
    texlab
    pkgs-stable.freecad
    (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-medium
        dvisvgm dvipng # for preview and export as html
        wrapfig amsmath ulem hyperref capt-of
        latexmk titlesec listings caption fourier float subfig
        etoolbox xcolor enumitem collection-fontsrecommended
        mylatexformat cancel preview collection-fontsextra;
    })
    typst
    tinymist
  ];
}
