{pkgs, ...}: {
    packages = [
        pkgs.curl
        pkgs.git
    ];
    bootstrap = ''
        cp -r $PWD/* "$out"
        rm "$out"/dev.nix
        rm "$out"/idx-template.nix
        rm "$out"/idx-template.json
        cp ${./dev.nix} "$out"/.idx/dev.nix
        install --mode u+rw ${./dev.nix} "$out"/.idx/dev.nix
        chmod -R u+w "$out"
    '';
}