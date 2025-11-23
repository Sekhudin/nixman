let
  indent = 2;
in
{
  config.globals.mapleader = " ";
  config.globals.number = true;
  config.globals.relativenumber = true;
  config.globals.mouse = "";
  config.globals.encoding = "utf8";
  config.globals.termguicolors = true;
  config.globals.cursorline = false;
  config.globals.wrap = false;
  config.globals.background = "dark";
  config.globals.tabstop = indent;
  config.globals.shiftwidth = indent;
  config.globals.smarttab = true;
  config.globals.expandtab = true;
  config.globals.laststatus = 2;
  config.globals.compatible = false;
  config.globals.conceallevel = 3;
  config.globals.concealcursor = "n";
  config.globals.backspace = [
    "indent"
    "eol"
    "start"
  ];
}
