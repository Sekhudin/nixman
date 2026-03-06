# NIXMAN

Declarative **dotfiles** and development environment powered by **Nix flakes** and **Home Manager**.

This repository contains my personal system configuration, allowing me to reproduce my entire development environment on any machine in a fully declarative way.

Instead of manually installing and configuring applications, everything is defined in Nix and can be deployed with a single command.

---

# Features

- Declarative environment configuration
- Reproducible development setup
- Managed with **Nix flakes**
- User environment managed via **Home Manager**
- Editor configurations defined through Nix

---

# Included Tools

This setup installs and configures several tools and applications.

## Editors

- **nixvim** – Neovim fully configured using Nix
- **Zed** – modern high-performance code editor

## Media

- Media player configuration for everyday use

## Applications

Common desktop applications are included, such as:

- WPS Office
- Slack
- Discord

## Utilities

Additional supporting tools and CLI utilities used in daily development.

---

# Getting Started

## 1. Install Nix

If you don't have Nix installed, install it first:

https://nixos.org/download/

After installation, make sure **flakes** are enabled.

---

## 2. Install Home Manager

If you don't have Home Manager installed yet, you can initialize it with:

```bash
nix run home-manager/master -- init
```

Or follow the official documentation:

https://nix-community.github.io/home-manager/

---

## 3. Clone the Repository

```bash
git clone https://github.com/Sekhudin/nixman.git
cd nixman
```

---

## 4. Configure Your Username

Adjust the configuration if needed so it matches your local system username.

---

## 5. Apply the Configuration

Run the following command:

```bash
home-manager switch --flake .
```

This command will build and apply the environment defined in this repository.

---

# Exploring the Flake

To inspect what this flake provides, run:

```bash
nix flake show
```

This will display all available outputs such as packages, modules, and configurations.

---

# Philosophy

This repository follows a **declarative configuration approach**:

- Everything is defined as code
- The environment is reproducible
- Setup on a new machine takes only a few commands
- Configuration stays version controlled

---

# Support

If you find this repository useful, you can support the development.

<p align"center">
  <a href="https://trakteer.id/syaikhu" target="_blank">
    <img id="wse-buttons-preview" src="https://edge-cdn.trakteer.id/images/embed/trbtn-red-1.png?v=14-05-2025" height="40" style="border:0px;height:40px;" alt="Trakteer Saya">
  </a>
</p>

Support is completely optional but always appreciated.

---

# License

Personal configuration repository.
Feel free to use it as inspiration for your own setup.
