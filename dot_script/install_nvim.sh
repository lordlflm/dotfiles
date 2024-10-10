#!/bin/bash

nvim_src_dir="$HOME/src/neovim"
nvim_bin_dir="$HOME/neovim"

build_nvim() {
  rm -rf build .deps/build .deps/CMakeFiles .deps/CMakeCache.txt ${nvim_bin_dir}
  echo "Building neovim in ${nvim_bin_dir}..."
  make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${nvim_bin_dir}" CMAKE_BUILD_TYPE=RelWithDebInfo
  echo "Installing..."
  make install
  echo "Done."
}

if [ -d "$nvim_src_dir" ]; then
  echo "Neovim is already on the system."
  echo "Entering directory: '${nvim_src_dir}'"
  cd "$nvim_src_dir"

  current_build=$(git rev-parse --abbrev-ref HEAD)
  current_commit=$(git rev-parse --short HEAD)
  echo "Current build is ${current_build} (${current_commit})."

  read -p "Do you want to switch build? Specify build name (recommended builds are 'stable' or 'nightly') or 'no' to keep current build. " new_build
  new_build=${new_build:-no}

  if [[ "$new_build" != "no" && "$new_build" != "n" ]]; then
    if git rev-parse --verify "$new_build">/dev/null 2>&1; then
      git checkout ${new_build}
    else
      echo "Specified build does not exist. Aborting..."
      exit
    fi
    build_nvim

  else
    read -p "Do you want to update current build? [y/n]" confirm_update
    confirm_update=${confirm_update:-n}
    if [[ "$confirm_update" == "y" ]]; then
      build_nvim

    else
      echo "Skipping..."
    fi
  fi

  echo "Leaving directory: '${nvim_src_dir}'"
  cd -

else
  nvim_build="stable"
  read -p "Are we installing Neovim nightly? (default: stable) [y/n] " confirm_nightly
  confirm_nightly=${confirm_nightly:-n}

  if [[ "$confirm_nightly" == "y" ]]; then
    nvim_build="nightly"
  fi

  git clone git@github.com:neovim/neovim.git ${nvim_src_dir}
  echo "Entering directory: '${nvim_src_dir}'"
  cd "${nvim_src_dir}"
  git checkout ${nvim_build}
  build_nvim
  echo "Leaving directory: '${nvim_src_dir}'"
  cd -
fi
