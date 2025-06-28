# Flutter ProGuard rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.embedding.engine.plugins.** { *; }
-keep class io.flutter.embedding.engine.plugins.activity.** { *; }
-keep class io.flutter.embedding.engine.plugins.broadcastreceiver.** { *; }
-keep class io.flutter.embedding.engine.plugins.contentprovider.** { *; }
-keep class io.flutter.embedding.engine.plugins.receiver.** { *; }
-keep class io.flutter.embedding.engine.plugins.service.** { *; }
-keep class io.flutter.embedding.engine.plugins.shim.** { *; }
-keep class io.flutter.embedding.engine.systemchannels.** { *; }
-keep class io.flutter.plugin.common.** { *; }
-keep class io.flutter.plugin.editing.** { *; }
-keep class io.flutter.plugin.platform.** { *; }
-keep class io.flutter.plugin.text.** { *; }
-keep class io.flutter.plugin.localization.** { *; }
-keep class io.flutter.plugins.** { *; }

# Firebase ProGuard rules
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Add any additional rules below as needed 