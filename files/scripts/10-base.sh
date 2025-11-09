#!/usr/bin/env bash

set -xeuo pipefail

# Start customizing your image here

# Ectx/system_filesxamples:
# dnf install -y 'dnf-command(config-manager)'
# dnf config-manager --set-enabled crb


# rsync -rvK /ctx/system_files/ /



dnf install fish distrobox fastfetch git restic buildah fzf fpaste glow gum hplip ntfs-3g ptyxis -y
dnf install gwenview kweather kate kcalc kontact okular skanpage -y # haruna

# chsh -s /usr/bin/fish

dnf copr enable ublue-os/packages -y
dnf install ublue-brew ublue-os-udev-rules -y
dnf install ublue-polkit-rules ublue-os-just ublue-os-update-services ublue-setup-services uupd ublue-bling ublue-rebase-helper -y
dnf copr disable ublue-os/packages -y


systemctl enable brew-setup.service
systemctl disable mcelog.service
systemctl --global enable podman-auto-update.timer
systemctl disable rpm-ostree.service
systemctl enable ublue-system-setup.service
systemctl enable uupd.timer
systemctl --global enable ublue-user-setup.service
systemctl mask bootc-fetch-apply-updates.timer bootc-fetch-apply-updates.service
authselect enable-feature with-fingerprint
# systemctl enable systemd-resolved.service

dnf remove PackageKit PackageKit-command-not-found -y

dnf clean all
