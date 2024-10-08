{
  config,
  pkgs,
  username,
  ...
}:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-empty-string = {
    Value = "";
    Status = "locked";
  };
in
{
  programs = {
    firefox = {
      enable = true;

      profiles.${username} = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://duckduckgo.com";
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.order.1" = "DuckDuckGo";
          "signon.rememberSignons" = false;

          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "browser.aboutConfig.showWarning" = false;
          "browser.compactmode.show" = true;
          "browser.cache.disk.enable" = false; # Be kind to hard drive

          #"mousewheel.default.delta_multiplier_x" = 20;
          #"mousewheel.default.delta_multiplier_y" = 20;
          #"mousewheel.default.delta_multiplier_z" = 20;
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [
            "DuckDuckGo"
            "Google"
          ];
        };

        bookmarks = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Tower Sites";
                bookmarks = [
                  {
                    name = "Dashboard";
                    url = "http://192.168.0.10:40080";
                  }
                  {
                    name = "Nextcloud";
                    url = "https://nextcloud.lucidleaf.link";
                  }
                  {
                    name = "Jellyfin";
                    url = "https://jellyfin.lucidleaf.link";
                  }
                  {
                    name = "Jellyseerr";
                    url = "https://jellyserr.lucidleaf.link";
                  }
                  {
                    name = "Radarr";
                    url = "https://radarr.lucidleaf.link";
                  }
                  {
                    name = "Sonarr";
                    url = "https://sonarr.lucidleaf.link";
                  }
                ];
              }
              {
                name = "Nix Sites";
                bookmarks = [
                  {
                    name = "Nix package manager";
                    url = "https://en.wikipedia.org/wiki/Nix_package_manager";
                  }
                  {
                    name = "NixOs";
                    url = "https://en.wikipedia.org/wiki/NixOS";
                  }
                  {
                    name = "MyNixOs";
                    url = "https://mynixos.com";
                  }
                  {
                    name = "Home Manager";
                    url = "https://home-manager-options.extranix.com";
                  }
                  {
                    name = "NixOs & Flakes book";
                    url = "https://nixos-and-flakes.thiscute.world/";
                  }
                ];
              }
              {
                name = "Calendar";
                url = "https://calendar.google.com";
              }
              {
                name = "YouTube";
                url = "https://youtube.com";
              }
            ];
          }
        ];
      };

      # ---- POLICIES ----
      # Check about:policies#documentation for options.
      policies = {
        Homepage = {
          locked = true;
          StartPage = "previous-session";
        };
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DontCheckDefaultBrowser = true;
        DisableFirefoxAccounts = true;
        DisablePocket = true;
        DisableFirefoxScreenshots = true;
        SearchBar = "unified";
        OfferToSaveLogins = false;

        # ---- PREFERENCES ----
        # Check about:config for options.
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
        ExtensionSettings =
          with builtins;
          let
            extension = shortId: uuid: {
              name = uuid;
              value = {
                install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                installation_mode = "normal_installed";
              };
            };
          in
          listToAttrs [
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "keepassxc-browser" "keepassxc-browser@keepassxc.org")
            (extension "darkreader" "addon@darkreader.org")
            (extension "zotero-connector" "zotero@chnm.gmu.edu")
          ];
        # To add additional extensions, find it on addons.mozilla.org, find
        # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
        # Then, download the XPI by filling it in to the install_url template, unzip it,
        # run `jq .browser_specific_settings.gecko.id manifest.json` or
        # `jq .applications.gecko.id manifest.json` to get the UUID
      };
    };

    chromium = {
      enable = true;
      commandLineArgs = [ "--enable-features=TouchpadOverscrollHistoryNavigation" ];
      extensions = [
        # {id = "";}  // extension id, query from chrome web store
      ];
    };
  };
}
