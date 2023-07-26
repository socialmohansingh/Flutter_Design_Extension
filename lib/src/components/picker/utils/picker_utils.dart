class PicketUtil {
  static bool strNoEmpty(String? value) {
    if (value == null) return false;

    return value.trim().isNotEmpty;
  }

  static bool strEmpty(String? value) {
    if (value == null) return true;

    return value.trim().isEmpty;
  }

  static bool mapNoEmpty(Map? value) {
    if (value == null) return false;
    return value.isNotEmpty;
  }

  static bool mapEmpty(Map? value) {
    if (value == null) return true;
    return value.isEmpty;
  }

  static bool listNoEmpty(List? list) {
    if (list == null) return false;

    if (list.length == 0) return false;

    return true;
  }

  static bool listEmpty(List? list) {
    if (list == null) return true;

    if (list.length == 0) return true;

    return false;
  }
}
