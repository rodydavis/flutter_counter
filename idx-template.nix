{pkgs, ...}: {
    packages = [
        pkgs.curl
        pkgs.git
    ];
    bootstrap = ''
        cp -r ${./dev}/* "$out"
        mkdir "$out"/.idx
        cp ${./dev.nix} "$out"/.idx/dev.nix
        install --mode u+rw ${./dev.nix} "$out"/.idx/dev.nix
        chmod -R u+w "$out"
    '';
}