# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  bufdelete-nvim = {
    pname = "bufdelete-nvim";
    version = "07d1f8ba79dec59d42b975a4df1c732b2e4e37b4";
    src = fetchgit {
      url = "https://github.com/famiu/bufdelete.nvim";
      rev = "07d1f8ba79dec59d42b975a4df1c732b2e4e37b4";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-UubYRfRAXZ89WOc3QFMvAMjNjLW6bV4nDgSa1CRZkIM=";
    };
    date = "2023-06-29";
  };
  bufferline-lua = {
    pname = "bufferline-lua";
    version = "9961d87bb3ec008213c46ba14b3f384a5f520eb5";
    src = fetchgit {
      url = "https://github.com/akinsho/bufferline.nvim";
      rev = "9961d87bb3ec008213c46ba14b3f384a5f520eb5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-Wo6oAbqG0SOJ4dKjg85s/IJGe1Z6XnyjVPzQZ00Lojw=";
    };
    date = "2023-08-29";
  };
  comment = {
    pname = "comment";
    version = "0236521ea582747b58869cb72f70ccfa967d2e89";
    src = fetchgit {
      url = "https://github.com/numToStr/Comment.nvim";
      rev = "0236521ea582747b58869cb72f70ccfa967d2e89";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-+dF1ZombrlO6nQggufSb0igXW5zwU++o0W/5ZA07cdc=";
    };
    date = "2023-08-07";
  };
  conjure = {
    pname = "conjure";
    version = "0d9b823db06cc11e6115b54297f690dff10c0299";
    src = fetchgit {
      url = "https://github.com/Olical/conjure";
      rev = "0d9b823db06cc11e6115b54297f690dff10c0299";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-Rae5SihnvnalFtNZ+VInUBRLBTilFGUj797lgKVw92g=";
    };
    date = "2023-08-04";
  };
  "coq.artifacts" = {
    pname = "coq.artifacts";
    version = "af92b636ceee8c657463fd816146b28d43ace732";
    src = fetchgit {
      url = "https://github.com/ms-jpq/coq.artifacts";
      rev = "af92b636ceee8c657463fd816146b28d43ace732";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-obWiy0nmUc/UBu9ok80A955FVLIwklIjEM1AV6BPJek=";
    };
    date = "2023-08-22";
  };
  coq_3p = {
    pname = "coq_3p";
    version = "47a748c18d6378df7aa033527d1b56d6dec94dc5";
    src = fetchgit {
      url = "https://github.com/ms-jpq/coq.thirdparty";
      rev = "47a748c18d6378df7aa033527d1b56d6dec94dc5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-jFKAiRfHLxoYDIVzHH9Z/lcVqTgr8Sm/siRf69fM/cs=";
    };
    date = "2023-08-26";
  };
  coq_nvim = {
    pname = "coq_nvim";
    version = "cb44d4df9caa4a5a1534f4919d9f595e7c9bf6bf";
    src = fetchgit {
      url = "https://github.com/ms-jpq/coq_nvim";
      rev = "cb44d4df9caa4a5a1534f4919d9f595e7c9bf6bf";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-gEaUXSJzsApxuz96s4IosT1fnf+UcUGpAVOthQcekaY=";
    };
    date = "2023-08-22";
  };
  crates = {
    pname = "crates";
    version = "d5caf28aba49e81ac4099426231f3cf3c151013a";
    src = fetchgit {
      url = "https://github.com/saecki/crates.nvim";
      rev = "d5caf28aba49e81ac4099426231f3cf3c151013a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-09tqoU9zo32+zpP/ybo6bbDxmdzAcr3a0xU7ZKuN3pg=";
    };
    date = "2023-08-08";
  };
  gitsigns = {
    pname = "gitsigns";
    version = "44adf808ace6cb65a3353bd61fa585a2d8fe0db3";
    src = fetchgit {
      url = "https://github.com/lewis6991/gitsigns.nvim";
      rev = "44adf808ace6cb65a3353bd61fa585a2d8fe0db3";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-4DVX9vd+PF02DonjAL+6q2xR7YCZG5vGD1/o4HbL4XI=";
    };
    date = "2023-08-31";
  };
  indent-blankline = {
    pname = "indent-blankline";
    version = "9637670896b68805430e2f72cf5d16be5b97a22a";
    src = fetchgit {
      url = "https://github.com/lukas-reineke/indent-blankline.nvim";
      rev = "9637670896b68805430e2f72cf5d16be5b97a22a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-1EpjFIJ5GK9NXS6dTMJ71w/AtLtR6Q5HrAXCIRNOBAY=";
    };
    date = "2023-08-22";
  };
  lazy-lsp = {
    pname = "lazy-lsp";
    version = "4b10237a7f9e5ab678eb384a4266e2e28e8472f7";
    src = fetchgit {
      url = "https://github.com/dundalek/lazy-lsp.nvim";
      rev = "4b10237a7f9e5ab678eb384a4266e2e28e8472f7";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-zTupCULojjlLBgYuLeL86ugMR4bNONQp3us89PbXdOU=";
    };
    date = "2023-08-11";
  };
  lspkind = {
    pname = "lspkind";
    version = "57610d5ab560c073c465d6faf0c19f200cb67e6e";
    src = fetchgit {
      url = "https://github.com/onsails/lspkind.nvim";
      rev = "57610d5ab560c073c465d6faf0c19f200cb67e6e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-S+qZm51hw/cRujIfHV/1x1fYyCKI4XQ0utSL8uy4l6I=";
    };
    date = "2023-05-05";
  };
  lualine = {
    pname = "lualine";
    version = "45e27ca739c7be6c49e5496d14fcf45a303c3a63";
    src = fetchgit {
      url = "https://github.com/nvim-lualine/lualine.nvim";
      rev = "45e27ca739c7be6c49e5496d14fcf45a303c3a63";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-v8finXk+sLNaFMA7pSHhEu0WF5mhPYWHEKhl0IKBv8c=";
    };
    date = "2023-08-03";
  };
  moonfly = {
    pname = "moonfly";
    version = "8a2384a6fff293a07164fca7ef5aeab99910acd5";
    src = fetchgit {
      url = "https://github.com/bluz71/vim-moonfly-colors";
      rev = "8a2384a6fff293a07164fca7ef5aeab99910acd5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-GOatmbR5lJLUfDMvCJ02HmucG5ucbmiHpr7k6I4Idxk=";
    };
    date = "2023-09-01";
  };
  neogen = {
    pname = "neogen";
    version = "1dd0319ccf41b2498f45a3c7607f2ee325ffc6a0";
    src = fetchgit {
      url = "https://github.com/danymat/neogen";
      rev = "1dd0319ccf41b2498f45a3c7607f2ee325ffc6a0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-7qsYR3xJzkZujT38VtX0A8B4gDjRIXErvptpTy8mhjg=";
    };
    date = "2023-06-09";
  };
  neorg = {
    pname = "neorg";
    version = "064f8f65dd32f4fe728e76acfa3e4e153b121147";
    src = fetchgit {
      url = "https://github.com/nvim-neorg/neorg";
      rev = "064f8f65dd32f4fe728e76acfa3e4e153b121147";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-n1++Mq7o8jPZkUxIYvXhhwyDN6SMUB4CiF4AXLylHHI=";
    };
    date = "2023-08-30";
  };
  neorg-telescope = {
    pname = "neorg-telescope";
    version = "1310d4aaefd8149c9839bbe1d5610e94389e2f0e";
    src = fetchgit {
      url = "https://github.com/nvim-neorg/neorg-telescope";
      rev = "1310d4aaefd8149c9839bbe1d5610e94389e2f0e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-jVfpSWPjSSbbsQns8n7TaAiSJLZ9EPEYVl8mibKH8Mw=";
    };
    date = "2023-08-06";
  };
  noice = {
    pname = "noice";
    version = "74c2902146b080035beb19944baf6f014a954720";
    src = fetchgit {
      url = "https://github.com/folke/noice.nvim";
      rev = "74c2902146b080035beb19944baf6f014a954720";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-TDAmbqlUjoa2uB9LZRXDhPOZPi62MXpOXKFnaHfPUoM=";
    };
    date = "2023-08-30";
  };
  notify = {
    pname = "notify";
    version = "ea9c8ce7a37f2238f934e087c255758659948e0f";
    src = fetchgit {
      url = "https://github.com/rcarriga/nvim-notify";
      rev = "ea9c8ce7a37f2238f934e087c255758659948e0f";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-Rr2tzuEr06M9ZbvQbC07qcxkyjFJFYdABwRpYelKBFI=";
    };
    date = "2023-06-05";
  };
  nui = {
    pname = "nui";
    version = "aa1b4c1e05983ff7debd2b4b2788651db099de2f";
    src = fetchgit {
      url = "https://github.com/MunifTanjim/nui.nvim";
      rev = "aa1b4c1e05983ff7debd2b4b2788651db099de2f";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-TiY5KeWLP7HdV85lnuUjxdWLkqXptu3kBi/YYGYzXuU=";
    };
    date = "2023-08-30";
  };
  null-ls = {
    pname = "null-ls";
    version = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7";
    src = fetchgit {
      url = "https://github.com/jose-elias-alvarez/null-ls.nvim";
      rev = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-cWA0rzkOp/ekVKaFee7iea1lhnqKtWUIU+fW5M950wI=";
    };
    date = "2023-08-11";
  };
  nvim-colorzier = {
    pname = "nvim-colorzier";
    version = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6";
    src = fetchgit {
      url = "https://github.com/norcalli/nvim-colorizer.lua";
      rev = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-6YrnItxExL2C8pNIdLd+hXCjsB2MbZANwWkah6dreD8=";
    };
    date = "2020-06-11";
  };
  nvim-lspconfig = {
    pname = "nvim-lspconfig";
    version = "a27356f1ef9c11e1f459cc96a3fcac5c265e72d6";
    src = fetchgit {
      url = "https://github.com/neovim/nvim-lspconfig";
      rev = "a27356f1ef9c11e1f459cc96a3fcac5c265e72d6";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-JYhEKTD51Ey9ksy8tpsJn2ZjxdW4dwjtuqD/1BI8uJ8=";
    };
    date = "2023-08-26";
  };
  parinfer = {
    pname = "parinfer";
    version = "5ca09287ab3f4144f78ff7977fabc27466f71044";
    src = fetchgit {
      url = "https://github.com/gpanders/nvim-parinfer";
      rev = "5ca09287ab3f4144f78ff7977fabc27466f71044";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-diwLtmch8LzaX7FIwBNy78n3iY7VnqMC1n0ep8k5kWE=";
    };
    date = "2023-08-09";
  };
  plenary = {
    pname = "plenary";
    version = "0dbe561ae023f02c2fb772b879e905055b939ce3";
    src = fetchgit {
      url = "https://github.com/nvim-lua/plenary.nvim";
      rev = "0dbe561ae023f02c2fb772b879e905055b939ce3";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-TcjgafIbwNXxoAO5wrf/Wr6sZHJtfpHU9R7RIjBZgkg=";
    };
    date = "2023-08-24";
  };
  smart-splits = {
    pname = "smart-splits";
    version = "7aad6019dee974a01333523a5b8e122b7e7da454";
    src = fetchgit {
      url = "https://github.com/mrjones2014/smart-splits.nvim";
      rev = "7aad6019dee974a01333523a5b8e122b7e7da454";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-mLLh8rcq5D6dA9Iwn3ULiHRG/jI4Sjct4J498C+QPO8=";
    };
    date = "2023-06-26";
  };
  startup = {
    pname = "startup";
    version = "5295eabe35eb66d0b355ada0ca06ec8bdb8f9698";
    src = fetchgit {
      url = "https://github.com/startup-nvim/startup.nvim";
      rev = "5295eabe35eb66d0b355ada0ca06ec8bdb8f9698";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-WB9NVv2sv8ZAFuM5zcg9akFsqVNl0JBhNIwixwfrf2I=";
    };
    date = "2023-03-13";
  };
  telescope = {
    pname = "telescope";
    version = "2c1ed33a6f6f2db3b69f5421f6b405eda1b07748";
    src = fetchgit {
      url = "https://github.com/nvim-telescope/telescope.nvim";
      rev = "2c1ed33a6f6f2db3b69f5421f6b405eda1b07748";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-RK4UCZTM318VN/rvpdt2NHQAKBB/9g7jwqFIHQOoqqk=";
    };
    date = "2023-08-30";
  };
  telescope-file-browser = {
    pname = "telescope-file-browser";
    version = "ad7b637c72549713b9aaed7c4f9c79c62bcbdff0";
    src = fetchgit {
      url = "https://github.com/nvim-telescope/telescope-file-browser.nvim";
      rev = "ad7b637c72549713b9aaed7c4f9c79c62bcbdff0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-iq2KyNU5U/j0zVvWg0q9TAXolHjbxL4d2GyMW/e1+Lo=";
    };
    date = "2023-08-13";
  };
  toggle-term = {
    pname = "toggle-term";
    version = "12cba0a1967b4f3f31903484dec72a6100dcf515";
    src = fetchgit {
      url = "https://github.com/akinsho/toggleterm.nvim";
      rev = "12cba0a1967b4f3f31903484dec72a6100dcf515";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-VFTnDLGy8U3x5ldMUW6okQjQ78qEFPb1n3pcbS2znNY=";
    };
    date = "2023-08-03";
  };
  treesitter = {
    pname = "treesitter";
    version = "f8c2825220bff70919b527ee68fe44e7b1dae4b2";
    src = fetchgit {
      url = "https://github.com/nvim-treesitter/nvim-treesitter";
      rev = "f8c2825220bff70919b527ee68fe44e7b1dae4b2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-p5EIjcuT21M3JDG3DuOzJJhTs3TvAYaxYAUcd1HW6Dk=";
    };
    date = "2023-08-31";
  };
  treesitter-context = {
    pname = "treesitter-context";
    version = "3e7c60982c98a9f5e7b6b0fb7c9ba5318f752fe1";
    src = fetchgit {
      url = "https://github.com/nvim-treesitter/nvim-treesitter-context";
      rev = "3e7c60982c98a9f5e7b6b0fb7c9ba5318f752fe1";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-7mvTaDBt6PaGrDc1WGtAjcQcWKE2fD9bW1rI1ZY7joc=";
    };
    date = "2023-08-28";
  };
  trouble = {
    pname = "trouble";
    version = "3f85d8ed30e97ceeddbbcf80224245d347053711";
    src = fetchgit {
      url = "https://github.com/folke/trouble.nvim";
      rev = "3f85d8ed30e97ceeddbbcf80224245d347053711";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-3dielW+Y+Rpt/sotZjk8tYHhYTlSrYHS5AILdytyNVA=";
    };
    date = "2023-08-30";
  };
  vim-nix = {
    pname = "vim-nix";
    version = "1e8d3cc4d74f40fb384cd1739739543fe117ff61";
    src = fetchgit {
      url = "https://github.com/LnL7/vim-nix";
      rev = "1e8d3cc4d74f40fb384cd1739739543fe117ff61";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-x6/WNMWFbR/1uLAeMawlwmp4b1ak+YRWu7abwx+9TRs=";
    };
    date = "2023-07-29";
  };
  vimtex = {
    pname = "vimtex";
    version = "ad17583ce399b6830b4c2888ef2a12d52c5eb607";
    src = fetchgit {
      url = "https://github.com/lervag/vimtex";
      rev = "ad17583ce399b6830b4c2888ef2a12d52c5eb607";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-k2vxuPpvf1QgfHRkvUC+6XQZIEX5DotLLv8z5FEIPvQ=";
    };
    date = "2023-08-31";
  };
  web-devicons = {
    pname = "web-devicons";
    version = "cfc8824cc1db316a276b36517f093baccb8e799a";
    src = fetchgit {
      url = "https://github.com/nvim-tree/nvim-web-devicons";
      rev = "cfc8824cc1db316a276b36517f093baccb8e799a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-6iuZbUi7MA69/wIMijCWj3J1s2RrCWKxQ/l7fWDnOF0=";
    };
    date = "2023-08-17";
  };
  which-key = {
    pname = "which-key";
    version = "7ccf476ebe0445a741b64e36c78a682c1c6118b7";
    src = fetchgit {
      url = "https://github.com/folke/which-key.nvim";
      rev = "7ccf476ebe0445a741b64e36c78a682c1c6118b7";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-B1+EHd2eH/EbD5Kip9PfhdPyyGfIkD6rsx0Z3rXvb5w=";
    };
    date = "2023-07-28";
  };
  yuck-vim = {
    pname = "yuck-vim";
    version = "9b5e0370f70cc30383e1dabd6c215475915fe5c3";
    src = fetchgit {
      url = "https://github.com/elkowar/yuck.vim";
      rev = "9b5e0370f70cc30383e1dabd6c215475915fe5c3";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-F7aS8d6jJQQoIGkG2o4KNnDZAIrq0c+otIHvjdoGbtY=";
    };
    date = "2022-10-29";
  };
}
