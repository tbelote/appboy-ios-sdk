#import "ABKUIUtils.h"
#import "ABKSDWebImageProxy.h"

#define ABKUISPMBundlePath @"/Appboy_iOS_SDK_AppboyUI.bundle/"

static NSString *const LocalizedAppboyStringNotFound = @"not found";
static NSUInteger const iPhoneXHeight = 2436.0;
static NSUInteger const iPhoneXRHeight = 1792.0;
static NSUInteger const iPhoneXSMaxHeight = 2688.0;
static NSUInteger const iPhoneXRScaledHeight = 1624.0;

@implementation ABKUIUtils

#pragma mark - Bundle Helper

+ (NSBundle *)bundle:(Class)bundleClass {
  NSString *spmBundleAt = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:ABKUISPMBundlePath];
  if ([[NSFileManager defaultManager] fileExistsAtPath:spmBundleAt]) {
    return [NSBundle bundleWithPath:spmBundleAt];
  }
  return  [NSBundle bundleForClass:bundleClass];
}

#pragma mark - View Hierarchy Helpers

// Used in unit tests to mock the UIApplication instance used.
+ (UIApplication *)application {
  return UIApplication.sharedApplication;
}

+ (UIWindowScene *)activeWindowScene {
  UIWindowScene *windowScene;
  UIWindowScene *activeWindowScene;
  
  // Loop over the connected window scenes to find the last foreground active
  // one. If no scene is currently in foreground state, fallback to last window
  // scene in hierarchy.
  for (UIScene *scene in [self application].connectedScenes) {
    if (![scene isKindOfClass:[UIWindowScene class]]) {
      continue;
    }
    
    windowScene = (UIWindowScene *)scene;
    if (scene.activationState == UISceneActivationStateForegroundActive) {
      activeWindowScene = windowScene;
    }
  }
  return activeWindowScene ?: windowScene;
}

+ (UIWindow *)activeApplicationWindow {
  if (@available(iOS 13.0, tvOS 13.0, *)) {
    UIWindow *window = [self selectApplicationWindow:ABKUIUtils.activeWindowScene.windows];
    if (window) {
      return window;
    }
  }
  
  return [self selectApplicationWindow:[self application].windows];
}

+ (UIViewController *)activeApplicationViewController {
  return ABKUIUtils.activeApplicationWindow.rootViewController;
}

+ (BOOL)applicationStatusBarHidden {
  UIViewController *viewController = self.activeApplicationViewController;
  while (viewController.childViewControllerForStatusBarHidden) {
    viewController = viewController.childViewControllerForStatusBarHidden;
  }
  return viewController.prefersStatusBarHidden;
}

+ (UIStatusBarStyle)applicationStatusBarStyle {
  UIViewController *viewController = self.activeApplicationViewController;
  while (viewController.childViewControllerForStatusBarStyle) {
    viewController = viewController.childViewControllerForStatusBarStyle;
  }
  return viewController.preferredStatusBarStyle;
}

/*!
 * Selects the window most likely to be the application window among an array of windows.
 *
 * @discussion The application window should most likely be the bottommost window with a windowLevel
 *             set to UIWindowLevelNormal (excluding a potential ABKInAppMessageWindow currently
 *             being displayed). If no window respecting that condition is found, fallback to the first
 *             window in the hierarchy.
 *
 * @param windows An array of UIWindow
 * @returns The UIWindow most likely to be the application window, nil if windows param is empty
 */
+ (UIWindow *)selectApplicationWindow:(NSArray<UIWindow *> *)windows {
  // Dynamically gets ABKInAppMessageWindow class as it is part of AppboyUI
  Class ABKInAppMessageWindow = NSClassFromString(@"ABKInAppMessageWindow");
  
  for (UIWindow *window in windows) {
    // Ignores ABKInAppMessageWindow
    if (ABKInAppMessageWindow && [window isKindOfClass:[ABKInAppMessageWindow class]]) {
      continue;
    }
    // Assumes that the application window has a windowLevel set to
    // UIWindowLevelNormal
    if (window.windowLevel == UIWindowLevelNormal) {
      return window;
    }
  }
  
  // Fallback to first window in hierarchy
  return windows.firstObject;
}

#pragma mark - Methods

+ (NSString *)getLocalizedString:(NSString *)key inAppboyBundle:(NSBundle *)appboyBundle table:(NSString *)table {
  // Check if the app has a customized localization for the given key
  NSString *localizedString = [[NSBundle mainBundle] localizedStringForKey:key
                                                                     value:LocalizedAppboyStringNotFound
                                                                     table:nil];
  if ([ABKUIUtils string:localizedString isEqualToString:LocalizedAppboyStringNotFound]) {
    // Check Braze's localization in the given bundle
    for (NSString *language in [[NSBundle mainBundle] preferredLocalizations]) {
      if ([[appboyBundle localizations] containsObject:language]) {
        NSBundle *languageBundle = [NSBundle bundleWithPath:[appboyBundle pathForResource:language ofType:@"lproj"]];
        localizedString = [languageBundle localizedStringForKey:key
                                                          value:LocalizedAppboyStringNotFound
                                                          table:table];
        break;
      }
    }
    if ([ABKUIUtils string:localizedString isEqualToString:LocalizedAppboyStringNotFound]) {
      // Couldn't find Braze's localization for the given key, fetch the default value for the key
      // from Base.lproj.
      NSBundle *appboyBaseBundle = [NSBundle bundleWithPath:[appboyBundle pathForResource:@"Base" ofType:@"lproj"]];
      localizedString = [appboyBaseBundle localizedStringForKey:key
                                                          value:LocalizedAppboyStringNotFound
                                                          table:table];
    }
  }
  return localizedString;
}

+ (BOOL)objectIsValidAndNotEmpty:(id)object {
  if (object != nil && object != [NSNull null]) {
    if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSString class]]) {
      return ![ABKUIUtils isEmpty:object];
    }
    if ([object isKindOfClass:[NSURL class]]) {
      NSString *string = [(NSURL *)object absoluteString];
      return [string length] != 0;
    }
    return YES;
  }
  return NO;
}

// Calls AppboyKit private abk_isEmpty method on object
+ (BOOL)isEmpty:(id)object {
  SEL sel = NSSelectorFromString(@"abk_isEmpty");
  IMP imp = [object methodForSelector:sel];
  return ((BOOL (*)(id, SEL))imp)(object, sel);
}

+ (Class)getSDWebImageProxyClass {
  Class SDWebImageProxyClass = NSClassFromString(@"ABKSDWebImageProxy");
  if (SDWebImageProxyClass == nil) {
    NSLog(CORE_VERSION_WARNING);
    return nil;
  }
  if (![SDWebImageProxyClass isSupportedSDWebImageVersion]) {
    NSLog(@"The SDWebImage version is unsupported.");
    return nil;
  }
  return SDWebImageProxyClass;
}

+ (Class)getModalFeedViewControllerClass {
  return NSClassFromString(@"ABKNewsFeedViewController");
}

+ (BOOL)isNotchedPhone {
  return ([[UIScreen mainScreen] nativeBounds].size.height == iPhoneXHeight ||
          [[UIScreen mainScreen] nativeBounds].size.height == iPhoneXRHeight ||
          [[UIScreen mainScreen] nativeBounds].size.height == iPhoneXSMaxHeight ||
          [[UIScreen mainScreen] nativeBounds].size.height == iPhoneXRScaledHeight);
}

+ (UIImage *)getImageWithName:(NSString *)name
                         type:(NSString *)type
               inAppboyBundle:(NSBundle *)appboyBundle {
  NSString *imagePath = [appboyBundle pathForResource:name ofType:type];
  UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
  return image;
}

+ (UIInterfaceOrientation)getInterfaceOrientation {
  if (@available(iOS 13.0, *)) {
    UIWindowScene *windowScene = ABKUIUtils.activeWindowScene;
    if (windowScene) {
      return windowScene.interfaceOrientation;
    }
  }
  return UIApplication.sharedApplication.statusBarOrientation;
}

+ (CGSize)getStatusBarSize {
  if (@available(iOS 13.0, *)) {
    UIWindowScene *windowScene = ABKUIUtils.activeWindowScene;
    if (windowScene) {
      return windowScene.statusBarManager.statusBarFrame.size;
    }
  }
  return UIApplication.sharedApplication.statusBarFrame.size;
}

#pragma mark - Dark Theme

+ (UIColor *)dynamicColorForLightColor:(UIColor *)lightColor
                             darkColor:(UIColor *)darkColor {
  if (lightColor == nil || darkColor == nil) {
    return lightColor;
  }

#if !TARGET_OS_TV
  if (@available(iOS 13.0, *)) {
    // Crashes if either darkColor or lightColor is nil
    return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
      if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        return darkColor;
      } else {
        return lightColor;
      }
    }];
  } else {
    return lightColor;
  }
#else
  return lightColor;
#endif
}

/*!
 * Unlike NSString's :isEqualToString method, this method returns true rather than throwing an exception if the first or both inputs are nil
 * OR the first or both inputs are NSNull.
 */
+ (BOOL)string:(NSString *)string1 isEqualToString:(NSString *)string2 {
  if ((string1 == nil && string2 == nil) || ([string1 isKindOfClass:[NSNull class]] && [string2 isKindOfClass:[NSNull class]])) {
    return YES;
  }
  if (string1 == nil || [string1 isKindOfClass:[NSNull class]] || string2 == nil || [string2 isKindOfClass:[NSNull class]]) {
    return NO;
  }
  return [string1 isEqualToString:string2];
}

+ (BOOL)responderChainOf:(UIResponder *)responder hasKindOfClass:(Class)aClass {
  UIResponder *resp = responder;
  
  while (resp && ![resp isKindOfClass:aClass]) {
    resp = resp.nextResponder;
  }
  
  return resp != nil;
}

@end
