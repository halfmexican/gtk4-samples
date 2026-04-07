project('style-switcher', 'vala', 'c',
  version: '0.1.0',
  meson_version: '>= 1.0.0'
)

gnome = import('gnome')

sources = [
  'style-switcher.vala',
]

deps = [
  dependency('gtk4'),
  dependency('libadwaita-1'),
]


blueprint_targets = []

blueprint_targets += custom_target('style-switcher-blueprints',
  input: files('../../../blp/adw/style-switcher/style-switcher.blp'),
  output: 'style-switcher.ui',
  command: [
    find_program('blueprint-compiler'),
    'compile',
    '--output', '@OUTPUT@',
    '@INPUT@'
  ],
)

blueprint_targets += custom_target('style-switcher-blueprints-window',
  input: files('../../../blp/adw/style-switcher/window.blp'),
  output: 'window.ui',
  command: [
    find_program('blueprint-compiler'),
    'compile',
    '--output', '@OUTPUT@',
    '@INPUT@'
  ],
)

# Compile resources, depending on all blueprint targets
sources += gnome.compile_resources('style-switcher-resources',
  'style-switcher.gresource.xml',
  c_name: 'style_switcher',
  dependencies: blueprint_targets,
  source_dir: meson.current_build_dir(),
)

executable('style-switcher', sources,
  dependencies: deps,
  install: true,
)