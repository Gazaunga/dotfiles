#!/bin/bash

ghc libx11-dev dzen dmenu
wget http://hackage.haskell.org/package/cabal-install
tar xzf cabal-install-1.24.0.2.tar.gz
cd cabal-install-1.24.0.2/
sudo chmod +x bootstrap.sh
./bootstrap.sh
echo "export PATH=$PATH:~/.cabal/bin" >> ~/.profile
cabal install xmonad xmonad-contrib --flags="-use_xft"
echo "exec xmonad" >> ~/.xsession
