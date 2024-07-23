# custom update command
update-all() {
    echo 'Updating \033[0;34mArch\033[0m packages...'
    paru -Syu

    echo 'Updating \033[1mFlatpak\033[0m packages...'
    flatpak --user update

    echo 'Updating \033[0;35mghcup\033[0m packages...'
    ghcup upgrade
    cabal update

    echo 'Updating \033[0;31mRac\033[0;34mket\033[0m packages...'
    raco pkg update --all

    echo 'Updating \033[0;31mRubyGems\033[0m packages...'
    gem update

    echo 'Updating \033[0;34mNeo\033[1mVim\033[0m packages...'
    nvim --headless "+Lazy! sync" +qa

    echo 'Updating \033[1mSystem Firmware\033[0m'
    fwupdmgr refresh
    fwupdmgr update
}
