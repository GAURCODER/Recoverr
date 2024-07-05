String generateChatId(String senderId, String receiverId) {
  List<String> ids = [senderId, receiverId];

  // Sort the list alphabetically
  ids.sort();

  // Concatenate sorted IDs to form a unique chat ID
  return ids[0] + ids[1];
}
