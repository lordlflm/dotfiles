#!/bin/bash

nvim_src_dir="$HOME/src/neovim"
nvim_bin_dir="$HOME/neovim"

build_nvim() {
  rm -rf build .deps/build .deps/CMakeFiles .deps/CMakeCache.txt "${nvim_bin_dir}"
  echo "Building Neovim in ${nvim_bin_dir}..."
  if ! make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${nvim_bin_dir}" CMAKE_BUILD_TYPE=RelWithDebInfo; then
    echo "Build failed. Aborting..."
    exit 1
  fi
  echo "Installing..."
  make install || { echo "Install failed. Aborting..."; exit 1; }
  echo "Done."
}

select_ref() {
  # Fetch both branches and tags
  echo "Fetching remote branches and tags..."
  git fetch --all --tags --quiet

  echo "Select a branch or tag:"
  selected=$(
    {
      git for-each-ref --format='branch: %(refname:strip=2)' refs/remotes/origin/ 
      git tag --sort=-creatordate | sed 's/^/tag: /'
    } | fzf | xargs
  )

  if [[ -z "$selected" ]]; then
    echo "No selection made. Aborting..."
    exit 1
  fi

  # Separate type and name
  type=$(echo "$selected" | cut -d':' -f1)
  name=$(echo "$selected" | cut -d' ' -f2-)

  echo "$type:$name"
}

if [ -d "$nvim_src_dir" ]; then
  echo "Neovim is already on the system."
  echo "Entering directory: '${nvim_src_dir}'"
  prev_dir=$(pwd)
  cd "$nvim_src_dir" || exit 1

  current_build=$(git rev-parse --abbrev-ref HEAD)
  current_commit=$(git rev-parse --short HEAD)
  echo "Current build is ${current_build} (${current_commit})."

  read -p "Do you want to switch build? [y/n] " confirm_switch
  confirm_switch=${confirm_switch:-n}

  if [[ "$confirm_switch" == "y" ]]; then
    # User chose to switch to another branch or tag
    ref_info=$(select_ref)
    ref_type="${ref_info%%:*}"
    ref_name="${ref_info#*:}"

    if [[ "$ref_type" == "branch" ]]; then
      echo "Switching to branch '${ref_name}'..."
      git checkout "${ref_name}" || { echo "Failed to checkout ${ref_name}"; exit 1; }
    else
      echo "Checking out tag '${ref_name}' (detached HEAD)..."
      git checkout "tags/${ref_name}" || { echo "Failed to checkout tag ${ref_name}"; exit 1; }
    fi

    build_nvim

  else
    read -p "Do you want to update the current build? [y/n] " confirm_update
    confirm_update=${confirm_update:-n}
    if [[ "$confirm_update" == "y" ]]; then
      build_nvim
    else
      echo "Skipping build/update..."
    fi
  fi

  echo "Leaving directory: '${nvim_src_dir}'"
  cd "$prev_dir" || exit 1

else
  echo "Cloning Neovim repository..."
  git clone git@github.com:neovim/neovim.git "${nvim_src_dir}" || { echo "Clone failed."; exit 1; }

  echo "Entering directory: '${nvim_src_dir}'"
  prev_dir=$(pwd)
  cd "${nvim_src_dir}" || exit 1

  ref_info=$(select_ref)
  ref_type="${ref_info%%:*}"
  ref_name="${ref_info#*:}"

  if [[ "$ref_type" == "branch" ]]; then
    echo "Checking out branch '${ref_name}'..."
    git checkout "${ref_name}" || { echo "Failed to checkout ${ref_name}"; exit 1; }
  else
    echo "Checking out tag '${ref_name}' (detached HEAD)..."
    git checkout "tags/${ref_name}" || { echo "Failed to checkout tag ${ref_name}"; exit 1; }
  fi

  build_nvim

  echo "Leaving directory: '${nvim_src_dir}'"
  cd "$prev_dir" || exit 1
fi

