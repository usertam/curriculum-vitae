{ noto-fonts }:

(noto-fonts.override {
  variants = [
    "Noto Sans Symbols"
    "Noto Sans Symbols 2"
  ];
}).overrideAttrs (prev: {
  pname = "noto-fonts-symbols";
})
