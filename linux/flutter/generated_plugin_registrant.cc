//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <pretty_button/pretty_button_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) pretty_button_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PrettyButtonPlugin");
  pretty_button_plugin_register_with_registrar(pretty_button_registrar);
}
