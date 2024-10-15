<!-- -------- Header start --------- -->

<div align = center>
  <h1 style="color:#f594a0">
    ⚙️ My-Dotfiles 🔧 
  </h1>
  <p>Space for storing my <a href="https://wiki.archlinux.org/title/Dotfiles">dotfiles</a> of DE/WM, programs, services.
    <br> 
    Also documentation about them.
  </p>
</div>

<br>

<details>
  <summary style="color:#a2e3ac">
    <small>Spaces 🗺️</small>
  </summary>

- [🗔 dotfiles (current)][dtfls]
- [💻 dotfiles (Plasma)][dtfls_plsma]
- **🪟 dotfiles (Windows) ⇽**
- [🌐 Website][wbste]
  <!-- - [🗜 Home Server][hmsrvr] -->
  </details>

[dtfls]: https://github.com/soymadip/Dotfiles#----%EF%B8%8F-my-dotfiles----
[dtfls_plsma]: https://github.com/soymadip/Dotfiles/tree/dotfiles-plasma#----%EF%B8%8F-my-dotfiles----
[dtfls_win]: https://github.com/soymadip/Dotfiles/tree/dotfiles-windows#----%EF%B8%8F-my-dotfiles----
[wbste]: https://github.com/soymadip/Dotfiles/tree/Website#----%EF%B8%8F-my-dotfiles----

<!-- [hmsrvr]:     https://github.com/soymadip/Dotfiles/tree/Home-server#----%EF%B8%8F-my-dotfiles---- -->

<!-- -------- Header End --------- -->

<h2 align="center">-----: Setup Overview :-----</h2>

```zsh
> fastfetch
```

<img align="left" src="./src/Assets/neofetch.webp" width="158px" alt="fastfetch avatar" style="padding-top:80px"/>

```yaml
 soymadip@DESKTOP-SD
 ---------------------
 OS: Windows 11 (Home Single Language) x86_64
 Kernel:  WIN32_NT 10.0.22631.4317 (23H2)1
 Packages: winget (70), choco (1)
 Shell: nushell 0.98.0
 WM: Desktop Window Manager
 Theme: Custom - Iris pastel (System: Dark, Apps: Dark)
 Icons:
 Terminal: Wezterm
 Terminal Font: JetbrainsMono Nerd Font 12
 CPU: 12th Gen Intel(R) Core(TM) i5-12500H (16) @ 4.50 GHz
 GPU1: Intel(R) UHD Graphics (128.00 MiB) [Integrated]
 GPU2: NVIDIA GeForce RTX 3050 (3.87 GiB) [Discrete]
 Memory: 2.40 GiB / 15.63 GiB
```

<!-- ------------------ -->

<h2 align="center">-----: App Utilities :-----</h2>

<details>
  <summary>GUI Apps</summary>

- **[Wezterm][wztrm] --** Gpu Accelarated _Terminal_ with lua as config language.
- **[VS Codium][code] --** FOSS Fork of VS Code without **telemetry**.
- **[zen Browser][zen] --** web browser built on top of Firefox, focusing on faster, more secure, and beautifully customizable browsing experience.
- **[Brave][brv] --** Chromium based Privacy focused Browser.
- **[MPV Player][mpv] --** The Command line video player.
- **[64gram][64grm] --** Unofficial Telegram client with many customizations.
- **[OBS Studio][obs] --** FOSS software for video recording and live streaming.

</details>

<details>
  <summary>CLI  Apps</summary>

- **[Git][gt] --** The version control system.
- **[Nu Shell][nushl] --** The modern Shell
- **[yazi][yzi] --** Terminal file manager.
- **[NeoVim][nvim] --** [Vim][vim] with lua support.
- **[Yt-dlp][ytdlp] --** Download video from [1000+][ytdlp_sts] websites.
- **[lsd][lsd] --** Rewrite of GNU `ls` with lots of added features like colors, icons etc.
- **[fzf][fzf] --** A command-line fuzzy finder.
- **[Syncthing][sncthnc] --** File sync between devices.
- **[fastfetch][fstfth] --** Neofetch written in C.

</details>

<details>
  <summary>Some useful Projects</summary>

- **🔤 [NerdFont][nf] --** Beautiful Font with icon support.

</details>

<br>
<!-- -------------------------- -->

<h2 align="center">-----: Keyboard Shorttcuts :-----</h2>

I try to stick to some basic rules for my binds:-

- <kbd>Super:</kbd> Dedicated to window management and global system related things.
- <kbd>Super + Ctrl:</kbd> Dedicated to system controls.
- <kbd>Ctrl + Shift:</kbd> Reserved for application-specific actions or shortcuts.
- <kbd>Ctrl:</kbd> Used for internal functions within apps (e.g., terminal commands or CLI interactions).
- <kbd>Alt:</kbd> For any extra work or alternate actions.

<br>

> Windows doesn't allow to modify keybinds :)
> <br>

<h2 align="center">-----: ⚠️ :-----</h2>

- I am using windows for now because of my new laptop & will switch to linux soon. So i don't know much & won't tinker too much too. This space will serve as a temp (later deparciated) backup for my windows dotfiles.
- Also in windows it's not that easy to manage dotfiles as programs use whatever directory they like for config.
  <br>
- Install script won't be available for windows as bash or zsh is not natively supported in windows & i won't bother learning PowerShell. May make one when i learn [Nu][nushl] scripting.

</br></br>

<!-- ___________________LINKS___________________ -->

[kskt]: https://github.com/soymadip/KireiSakura-Kit
[hprpnll]: https://github.com/Jas-SinghFSU/HyprPanel
[agsl]: https://github.com/Aylur/ags
[rfil]: https://github.com/adi1090x/rofi
[64grm]: .local/share/64Gram/
[brv]: .config/BraveSoftware/Brave-Browser/
[code]: .config/Code/
[fstfth]: .config/fastfetch
[fzf]: https://github.com/junegunn/fzf
[gt]: .config/git
[kpssxc]: .config/keepassxc/
[lsd]: .config/lsd
[mpv]: .config/mpv/
[nf]: https://www.nerdfonts.com/
[nfpwa]: https://9to5google.com/2021/01/27/firefox-discontinues-work-pwa-desktop/
[nvim]: .config/nvim/
[nushl]: .config/nushell
[nwgl]: .config/nwg-look/
[obs]: .config/obs-studio/
[sncthnc]: https://syncthing.net/
[vim]: https://en.wikipedia.org/wiki/Vim_(text_editor)
[wztrm]: .config/wezterm
[ytdlp]: https://github.com/yt-dlp/yt-dlp
[ytdlp_sts]: https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md
[yzi]: .config/yazi/
[zen]: .zen/
