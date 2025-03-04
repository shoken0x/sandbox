# remap right shift to delete
# remap right option to Grave Accent and Tilde
# see
# https://news.mynavi.jp/article/osxhack-192/
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html
# https://hidutil-generator.netlify.app/
# https://gist.github.com/mysteriouss/7d859f4ebb20604d212e7e9f807f64ff
# https://mybyways.com/blog/script-to-re-map-macbook-pro-function-keys
#
# 0x70000002A Right Shift
# 0x7000000E5 Delete or Backspace
# 0x7000000E6 Right Alt
# 0x700000035 Grave Accent and Tilde
#
hidutil property --set '{"UserKeyMapping":[
  {"HIDKeyboardModifierMappingSrc":  0x7000000e5,"HIDKeyboardModifierMappingDst":0x70000002a},
  {"HIDKeyboardModifierMappingSrc":  0x7000000e6,"HIDKeyboardModifierMappingDst":0x700000035}
]}'
