import 'package:flutter/material.dart';

// ============================================
// 1. HOME PAGE APPBAR
// ============================================
AppBar homeAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.home_rounded, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 2. STATISTICS PAGE APPBAR
// ============================================
AppBar statisticsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.bar_chart_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 3. SETTINGS PAGE APPBAR
// ============================================
AppBar settingsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.settings, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 4. ACCOUNTS PAGE APPBAR
// ============================================
AppBar accountsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.person_outline, color: Colors.teal, size: 24),
        ),
        const SizedBox(width: 12),
        const Text(
          'Account Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 5. VOICE COMMAND PAGE APPBAR - Animated
// ============================================
class VoiceCommandAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isListening;

  const VoiceCommandAppBar({super.key, this.isListening = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: isListening ? Colors.red : Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Voice Command',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              if (isListening)
                Text(
                  'Listening...',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ============================================
// 6. WIFI PAGE APPBAR
// ============================================
AppBar wifiAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.wifi, color: Colors.green, size: 24),
        ),
        const SizedBox(width: 12),
        const Text(
          'WiFi Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 7. LANGUAGES PAGE APPBAR
// ============================================
AppBar languagesAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.language_outlined,
            color: Colors.lightGreen,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Languages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 8. HELP CENTER APPBAR
// ============================================
AppBar helpCenterAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.help_center_outlined,
            color: Colors.amber,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Help Center',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 9. BUGS & SUGGESTIONS PAGE APPBAR
// ============================================
AppBar bugsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.bug_report_outlined,
            color: Colors.red,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Bugs & Suggestions',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 10. PRIVACY POLICY PAGE APPBAR
// ============================================
AppBar privacyPolicyAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.policy_outlined,
            color: Colors.indigo,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// 11. TERMS OF SERVICE PAGE APPBAR
// ============================================
AppBar termsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.description_outlined,
            color: Colors.amber,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Terms of Service',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}

// ============================================
// USAGE EXAMPLES
// ============================================
/*
  // For regular pages
  appBar: homeAppBar(context),
  appBar: statisticsAppBar(context),
  appBar: settingsAppBar(context),
  appBar: accountsAppBar(context),
  appBar: wifiAppBar(context),
  appBar: languagesAppBar(context),
  appBar: helpCenterAppBar(context),
  appBar: bugsAppBar(context),
  appBar: privacyPolicyAppBar(context),
  appBar: termsAppBar(context),
  
  // For Voice Command page with state
  appBar: VoiceCommandAppBar(isListening: _isListening),
*/
