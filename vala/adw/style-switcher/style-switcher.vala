
    [GtkTemplate (ui = "/dev/vala-lang/examples/StyleSwitcher/style-switcher.ui")]
    public class StyleSwitcher : Gtk.Box {

        [GtkChild] unowned Gtk.CheckButton system_selector;
        [GtkChild] unowned Gtk.CheckButton light_selector;
        [GtkChild] unowned Gtk.CheckButton dark_selector;

        private Adw.StyleManager style_manager;

        public StyleSwitcher () {
            this.style_manager = Adw.StyleManager.get_default ();

            // Sync UI with current system state on init
            var scheme = style_manager.get_color_scheme ();
            if (scheme == Adw.ColorScheme.FORCE_LIGHT) {
                light_selector.active = true;
            } else if (scheme == Adw.ColorScheme.FORCE_DARK) {
                dark_selector.active = true;
            } else {
                system_selector.active = true;
            }

            // Connect signals
            system_selector.toggled.connect(() => {
                if (system_selector.active) {
                    style_manager.set_color_scheme (Adw.ColorScheme.DEFAULT);
                }
            });

            light_selector.toggled.connect(() => {
                if (light_selector.active) {
                    style_manager.set_color_scheme (Adw.ColorScheme.FORCE_LIGHT);
                }
            });

            dark_selector.toggled.connect(() => {
                if (dark_selector.active) {
                    style_manager.set_color_scheme (Adw.ColorScheme.FORCE_DARK);
                }
            });
        }
    }

    void main (string[] args) {
        var app = new Adw.Application ("dev.vala-lang.examples.StyleSwitcher", GLib.ApplicationFlags.FLAGS_NONE);
            app.activate.connect (() => {
                var win = new Adw.ApplicationWindow (app);
                win.set_default_size (300, 200);
                win.set_title ("Style Switcher Demo");

                //var switcher = new StyleSwitcher ();
                //win.set_content (switcher);

                win.present ();
            });
        app.run (args);
    }


