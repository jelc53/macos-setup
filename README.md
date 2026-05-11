# macos-setup

Reproducible setup for a fresh macOS development machine.

## What's in here

```
.
├── Brewfile              # CLI tools + GUI apps (run via `brew bundle`)
├── bootstrap.sh          # Top-level installer — run this on a new mac
├── home/                 # Mirrors $HOME; symlinked into place by link-dotfiles.sh
│   ├── .zshrc
│   ├── .zprofile
│   ├── .aws/config
│   └── .config/
│       ├── ghostty/config
│       └── helix/languages.toml
└── scripts/
    ├── link-dotfiles.sh              # Symlinks home/* into $HOME (with backup)
    ├── prune-orphaned-symlinks.sh    # Removes dangling links left behind by deleted dotfiles
    ├── install-languages.sh          # rustup, fnm LTS, latest pyenv python
    └── macos-defaults.sh             # System prefs (disabled by default)
```

## Rebuilding a mac from scratch

```bash
# 1. Install git the quickest way (triggers Xcode CLT install too):
xcode-select --install

# 2. Clone this repo:
mkdir -p ~/repos && cd ~/repos
git clone git@github.com:<you>/macos-setup.git
cd macos-setup

# 3. Run the bootstrap:
./bootstrap.sh
```

The bootstrap is idempotent — re-run it any time to converge the machine
back to this repo's state.

## Post-install (manual steps)

These can't be automated:

- **1Password GUI** — sign in. The `op` CLI used in `.aws/config` for MFA
  needs the GUI app authenticated to unlock vaults. (Install via
  `cask "1password"` if you want it managed by brew.)
- **Git identity** — set name/email:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "you@example.com"
  ```
- **Raycast** — open it, grant accessibility permissions, import settings
  if you have them backed up.
- **Ghostty** — accept terminal access prompts on first run.
- **Sign in to**: Slack, Notion, Obsidian, Google Drive, Spotify, Chrome
  (sync), VSCode (settings sync).
- **SSH keys for GitHub** — generate and add to GitHub (or restore from
  backup):
  ```bash
  ssh-keygen -t ed25519 -C "you@example.com"
  pbcopy < ~/.ssh/id_ed25519.pub  # then paste into github.com/settings/keys
  ```

## Maintaining the repo

When you install something new on the machine:

```bash
# Refresh Brewfile from current state and review the diff:
brew bundle dump --file=Brewfile --force
git diff Brewfile
```

When you change a tracked dotfile (e.g. `~/.zshrc`), edit it in this
repo's `home/` tree — it's already symlinked, so changes flow both ways.

To track a new dotfile, move it into `home/` and re-run:

```bash
./scripts/link-dotfiles.sh
```

When you **remove** a tracked dotfile (delete it from `home/`), the symlink
under `$HOME` is left behind as a dangling link. Sweep these up with:

```bash
./scripts/prune-orphaned-symlinks.sh
```

Note there are three guards before any removal: (1) target must be a
symlink, (2) it must point into this repo's `home/` tree, and (3) the
source file must not exist. Manually-created symlinks and links pointing
outside the repo are not touched.
