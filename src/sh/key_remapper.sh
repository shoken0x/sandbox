# remap right shift to delete
# remap right option to Grave Accent and Tilde
# see https://news.mynavi.jp/article/osxhack-192/
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":  0x7000000e5,"HIDKeyboardModifierMappingDst":0x70000002a},{"HIDKeyboardModifierMappingSrc":  0x7000000e6,"HIDKeyboardModifierMappingDst":0x700000035}]}'
