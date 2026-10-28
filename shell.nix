let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/9ecbdcf57fbde7ad94ed6c0db0bcdfbde30fc86a.tar.gz";
  pkgs = import nixpkgs { config = {permittedInsecurePackages = [ "electron-41.10.7" ]; }; overlays = []; };

    patchedQuarto = pkgs.quarto.overrideAttrs (oldAttrs: {
      postPatch = (oldAttrs.postPatch or "") + ''
        substituteInPlace bin/quarto.js \
          --replace-fail "syntax-highlighting" "highlight-style"
      '';
    });

   quarto_patched = pkgs.quarto.overrideAttrs (old: {
     postFixup = (old.postFixup or "") + ''
       substituteInPlace $out/bin/quarto.js \
         --replace-fail 'kSyntaxHighlighting = "syntax-highlighting"' 'kSyntaxHighlighting = "highlight-style"' \
         --replace-fail '"--syntax-highlighting"' '"--highlight-style"'
       substituteInPlace $out/share/filters/modules/jog.lua \
         --replace-fail "elseif tp == 'pandoc TableHead' or tp == 'pandoc TableFoot' or" "elseif tp == 'pandoc TableBody' or tp == 'TableBody' then
    element.head = jogger(element.head)
    element.body = jogger(element.body)
  elseif tp == 'pandoc TableHead' or tp == 'pandoc TableFoot' or"
     '';
   });

in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    R
    quarto
    pandoc
    rstudio
    rPackages.tidyverse
    rPackages.rmarkdown
    rPackages.knitr
    rPackages.here
  ];

   LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
   LANG = "en_US.UTF-8";
   LC_ALL = "en_US.UTF-8";
   LC_TIME = "en_US.UTF-8";
   LC_MONETARY = "en_US.UTF-8";
   LC_PAPER = "en_US.UTF-8";
   LC_MEASUREMENT = "en_US.UTF-8";
}
